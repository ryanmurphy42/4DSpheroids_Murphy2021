function [variable_deterministic_values]  = function_Greenspan_model_fmincon_no_plots_v1(variable_id_vec,time_vec,parameter_id_syn)

%% Variable id

% Define the following variable id's
% 1 - R_o - outer
% 2 - R_i - necrotic
% 3 - R_g - inhibited

%% Parameters

Q = parameter_id_syn(1);
gamma = parameter_id_syn(2);
s = parameter_id_syn(3);
R_c = parameter_id_syn(4);
R_o_init = parameter_id_syn(5);

% Define xi
xi_0_init = R_o_init/R_c;

%% If start in phase 1

if Q/xi_0_init > 1
    %% PHASE 1
    tau_1 = (3*log(Q/xi_0_init));
else
    tau_1=0;
end


%% PHASE 2

if R_o_init < R_c
    
    % initial condition
    if tau_1 >  0
        x0=1e-8;
    else
        x0_R_inhibted = sqrt(R_o_init^2 - Q^2*R_c^2);
        x0=x0_R_inhibted/R_o_init;
    end

    % tic
    tau_phase2_span = [0, (abs(tau_1)+25)/s];

    global y_star
    y_star = (1 - Q^2)^(1/2);

    Opt_tau2 = odeset('Events', @function_myEvent_phase2_of_3_wastes,'RelTol',1e-8,'AbsTol', 1e-8); %run until tau_star
    
    % Use deval to calculate values
    sol_ode15s_phase2 =  ode15s(@(tau_phase_2, y) (1-y^2)*(1-y^3)/(3*y),  tau_phase2_span, x0,Opt_tau2);

    max_sol_ode15s_phase2_x  = max(sol_ode15s_phase2.x);
    
else
    
    max_sol_ode15s_phase2_x=0;
    
end

%% Solving Phase 3 as a differential algebraic system.

% A constant, singular mass matrix
M = [1 0
    0 0];

% Use an inconsistent initial condition to test initialization.

if max_sol_ode15s_phase2_x > 0
    y0 = [1e-8; (1-Q^2)^(1/2)];
elseif (R_c == R_o_init)
    y0 = [1e-8; (1-Q^2)^(1/2)];
else
    % convert initial radius to x and y values
    % determine necrotic radius
    
    coefficients_n = [2/R_o_init, -3 ,0, (R_o_init^2 -R_c^2)];
    roots_n = roots(coefficients_n);
    Rn_init = roots_n(logical((roots_n < R_o_init).*(roots_n > 0).*(roots_n == real(roots_n))));
    
    % Determine inhibited radius
    
    coefficients_i = [1, 0 , (Q^2*R_c^2 -R_o_init^2 - 2*Rn_init^3/R_o_init), 2*Rn_init^3];
    roots_i = roots(coefficients_i);
    Ri_init =  roots_i(logical((roots_i < R_o_init).*(roots_i > Rn_init).*(roots_i == real(roots_i))));
    
    y0=[Rn_init/R_o_init;Ri_init/R_o_init];
end

tspan = [0 (abs(tau_1)+25)/s];

options = odeset('Mass',M,'RelTol',1e-8,'AbsTol', [1e-8 1e-8]);

sol_ode15s_phase3 = ode15s(@(t,y) function_Greenspan_ode_model_2_2_phase3(t,y,gamma,Q),tspan,y0,options);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Output:
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len_variable_id_vec = length(variable_id_vec);

variable_deterministic_values = zeros(len_variable_id_vec,1);

for ii = 1:len_variable_id_vec
    if time_vec(ii) <  (1/s)*tau_1 % then in Phase 1
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec(ii)
            variable_deterministic_values(ii) = R_c*xi_0_init.*exp(s*time_vec(ii)/3);
            
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec(ii)
            variable_deterministic_values(ii) = 0;
            
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec(ii)
            variable_deterministic_values(ii) = 0;
        end
        
    elseif time_vec(ii) < (1/s)*(tau_1 + max_sol_ode15s_phase2_x) % then in Phase 2
        
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec(ii)
            variable_deterministic_values(ii) = R_c.*Q.*(1-deval(sol_ode15s_phase2,s*(time_vec(ii)-(1/s)*tau_1)).^2).^(-1/2);
            
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec(ii)
            variable_deterministic_values(ii) = 0;
            
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec(ii)
            variable_deterministic_values(ii) = R_c.*Q.*sqrt((1./(1-deval(sol_ode15s_phase2,s*(time_vec(ii)-(1/s)*tau_1)).^2))- 1);
        end
        
    else % In Phase 3
        
        save_time_y_phase3_ode15s = deval(sol_ode15s_phase3,s*(time_vec(ii)-(1/s)*(tau_1+max_sol_ode15s_phase2_x)));
        save_time_x_phase3_dt = save_time_y_phase3_ode15s(1);
        save_time_y_phase3_dt = save_time_y_phase3_ode15s(2);
        save_time_xi_phase3_dt = (((1-save_time_x_phase3_dt).^2).*(1+2.*save_time_x_phase3_dt)).^(-1/2);
        
        save_time_r_0_phase_3 = R_c.*save_time_xi_phase3_dt;
        save_time_r_g_phase_3 = R_c.*save_time_y_phase3_dt.*save_time_xi_phase3_dt;
        save_time_r_i_phase_3 = R_c.*save_time_x_phase3_dt.*save_time_xi_phase3_dt;
        
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec(ii)
            variable_deterministic_values(ii) = save_time_r_0_phase_3;
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec(ii)
            variable_deterministic_values(ii) = save_time_r_i_phase_3 ;
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec(ii)
            variable_deterministic_values(ii) = save_time_r_g_phase_3;
        end
    end
end

end

