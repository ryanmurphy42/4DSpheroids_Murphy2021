function [variable_deterministic_values]  = function_Greenspan_model_fmincon_v1(variable_id_vec,time_vec,parameter_id_syn,filepath_save_figs,include_plot)

%% Variable id

% Define the following variable id's
% 1 - R_o - outer
% 2 - R_i - necrotic (note in paper Rn is necrotic region)
% 3 - R_g - inhibited (note in paper Ri is inhibited region)

%% Parameters


disp(['Q = ' num2str(parameter_id_syn(1)) ', gamma = ' num2str(parameter_id_syn(2)) ', s = ' num2str(parameter_id_syn(3)) ', R_c = ' num2str(parameter_id_syn(4)) ', R_o_init = ' num2str(parameter_id_syn(5))])

Q = parameter_id_syn(1);
gamma = parameter_id_syn(2);
s = parameter_id_syn(3);
R_c = parameter_id_syn(4);
R_o_init = parameter_id_syn(5);


%
xi_0_init = R_o_init/R_c;

%% If start in phase 1

if Q/xi_0_init > 1
    
    %% PHASE 1
    
    tau_1 = (3*log(Q/xi_0_init));
    
    tau_phase_1=[0:0.05:tau_1,tau_1];
    
    xi_phase_1 = xi_0_init.*exp(tau_phase_1/3);
    eta_phase_1  = zeros(length(tau_phase_1),1);
    zeta_phase_1  = zeros(length(tau_phase_1),1);
    
    r_0_phase_1 = R_c*xi_phase_1;
    r_i_phase_1 = eta_phase_1;
    r_g_phase_1 = zeta_phase_1;
    
    
    tau_phase_1 = (1/s)*tau_phase_1;
    tau_vector = [tau_phase_1'];
    
    r_o_vector = [r_0_phase_1'];
    r_i_vector = [r_i_phase_1];
    r_g_vector = [r_g_phase_1];
    
    
else
    
    tau_phase_1 = [];
    r_0_phase_1 = [];
    r_i_phase_1 = [];
    r_g_phase_1 = [];
    tau_1=0;
    
    
    tau_vector = [];
    
    r_o_vector = [];
    r_i_vector = [];
    r_g_vector = [];
    
end


%% PHASE 2

if R_o_init < R_c
    
    % initial condition
    if length(tau_phase_1) > 0
        x0=1e-8;
    else
        % convert initial radius to y value
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
    
    tau_phase_2_ode15s_deval = [0:0.001:max(sol_ode15s_phase2.x),max(sol_ode15s_phase2.x)];
    y_phase_2_ode15s_deval = deval(sol_ode15s_phase2,tau_phase_2_ode15s_deval);
    
    r_0_phase_2 =  R_c.*Q.*(1-y_phase_2_ode15s_deval.^2).^(-1/2);
    r_i_phase_2 = zeros(length(y_phase_2_ode15s_deval),1);
    r_g_phase_2 = R_c.*Q.*sqrt((1./(1-y_phase_2_ode15s_deval.^2))- 1);
    
    r_0_phase_2 =r_0_phase_2';
    r_i_phase_2 = r_i_phase_2';
    tau_phase_2_ode15s = tau_phase_2_ode15s_deval;
    
    
    tau_phase_2_ode15s = (1/s)*tau_phase_2_ode15s;
    
    if length(tau_phase_1) >0
        
        tau_vector = [tau_vector; tau_phase_1(end) + tau_phase_2_ode15s'];
        r_o_vector = [r_o_vector;r_0_phase_2];
        r_i_vector = [r_i_vector;r_i_phase_2'];
        r_g_vector = [r_g_vector;r_g_phase_2'];
    else
        tau_vector = [ tau_phase_2_ode15s'];
        r_o_vector = [r_0_phase_2];
        r_i_vector = [r_i_phase_2'];
        r_g_vector = [r_g_phase_2'];
    end
    
    
    max_sol_ode15s_phase2_x  = max(sol_ode15s_phase2.x);
    
else
    
    tau_phase_2_ode15s = [];
    r_0_phase_2 = [];
    r_i_phase_2 = [];
    r_g_phase_2 = [];
    
    tau_vector = [];
    
    r_o_vector = [];
    r_i_vector = [];
    r_g_vector = [];
    
    max_sol_ode15s_phase2_x=0;
    
end

%% Solving Phase 3 as a differential algebraic system.


% A constant, singular mass matrix
M = [1 0
    0 0];

% Use an inconsistent initial condition to test initialization.



if length(tau_phase_2_ode15s) > 0
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

[tau_phase3_dt,y_phase3_ode15s] = ode15s(@(t,y) function_Greenspan_ode_model_2_2_phase3(t,y,gamma,Q),tspan,y0,options);
sol_ode15s_phase3 = ode15s(@(t,y) function_Greenspan_ode_model_2_2_phase3(t,y,gamma,Q),tspan,y0,options);

x_phase3_dt = y_phase3_ode15s(:,1);
y_phase3_dt = y_phase3_ode15s(:,2);

xi_phase3_dt = (((1-x_phase3_dt).^2).*(1+2.*x_phase3_dt)).^(-1/2);

r_0_phase_3 = R_c.*xi_phase3_dt;
r_g_phase_3 = R_c.*y_phase3_dt.*xi_phase3_dt;
r_i_phase_3 = R_c.*x_phase3_dt.*xi_phase3_dt;


%% with PHASE III

% scale time with s (dimensional = s * dimensionless )
tau_phase3_dt = (1/s)*tau_phase3_dt;

if length(tau_phase_1) > 0
    
    if length(tau_phase_2_ode15s) > 0
        tau_vector = [tau_vector; tau_phase_1(end) + tau_phase_2_ode15s(end)  + tau_phase3_dt];
        
        r_o_vector = [r_o_vector;r_0_phase_3];
        r_i_vector = [r_i_vector;r_i_phase_3];
        r_g_vector = [r_g_vector;r_g_phase_3];
        
    else
        
        tau_vector = [tau_phase3_dt];
        
        r_o_vector = [r_0_phase_3];
        r_i_vector = [r_i_phase_3];
        r_g_vector = [r_g_phase_3];
        
    end
    
else
    
    if length(tau_phase_2_ode15s) > 0
        tau_vector = [tau_vector;  tau_phase_2_ode15s(end)  + tau_phase3_dt];
        
        r_o_vector = [r_o_vector;r_0_phase_3];
        r_i_vector = [r_i_vector;r_i_phase_3];
        r_g_vector = [r_g_vector;r_g_phase_3];
        
    else
        
        tau_vector = [tau_phase3_dt];
        
        r_o_vector = [r_0_phase_3];
        r_i_vector = [r_i_phase_3];
        r_g_vector = [r_g_phase_3];
        
    end
    
    
end


%% PLOTS

% include_plot = 0;

if include_plot == 1
    %% Plots of evolution of radius
    figure
    % plot the outer radius phase 1
    plot(tau_vector, r_o_vector,'g-.','Linewidth',2)
    hold on
    % plot the outer radius phase 2
    plot(tau_vector, r_i_vector,'k-.','Linewidth',2)
    plot(tau_vector, r_g_vector,'m-.','Linewidth',2)
    
    % plot a dashed line marking the time between phase 1 and phase 2
    plot(tau_phase_1(end)*ones(2,1),[0,max(r_o_vector*1.5)],'k--')
    
    % plot a dashed line marking the time between phase 2 and phase 3
    plot((tau_phase_1(end)+tau_phase_2_ode15s(end))*ones(2,1),[0,max(r_o_vector*1.5)],'k--')
    
    legend('Outer','Necrotic','Inhibited proliferation')
    
    xlabel('Time')
    ylabel('Radius')
    
    title('Evolution of radius of spheroid')
    xlim([0,20])
    
    
    %Save figure
    print(gcf,'-depsc2',[filepath_save_figs  'Radius_Evolution' '.eps']);
    saveas(gcf, [filepath_save_figs  'Radius_Evolution'  '.fig'])
    saveas(gcf, [filepath_save_figs  'Radius_Evolution'  '.jpg'])
    
    %% Plots of evolution of differences in widths
    
    figure
    hold on
    plot(tau_vector, r_o_vector-r_i_vector)
    plot(tau_vector, r_o_vector-r_g_vector)
    plot(tau_vector, r_g_vector-r_i_vector)
    legend('Outer - Necrotic', 'Outer - Inhibited', 'Inhibited - Necrotic')
    xlabel('Time')
    ylabel('Differences in radius')
    title('Evolution of differences in radius')
    xlim([0,20])
    
    %Save figure
    print(gcf,'-depsc2',[filepath_save_figs  'Radius_Evolution_differences' '.eps']);
    saveas(gcf, [filepath_save_figs  'Radius_Evolution_differences'  '.fig'])
    saveas(gcf, [filepath_save_figs  'Radius_Evolution_differences'  '.jpg'])
    
elseif include_plot == 2
    
    figure
    % plot the outer radius phase 1
    plot(tau_vector, r_o_vector,'g-.','Linewidth',2)
    hold on
    % plot the outer radius phase 2
    plot(tau_vector, r_i_vector,'k-.','Linewidth',2)
    plot(tau_vector, r_g_vector,'m-.','Linewidth',2)
    
    % plot a dashed line marking the time between phase 1 and phase 2
    plot(tau_phase_1(end)*ones(2,1),[0,max(r_o_vector*1.5)],'k--')
    
    % plot a dashed line marking the time between phase 2 and phase 3
    plot((tau_phase_1(end)+tau_phase_2_ode15s(end))*ones(2,1),[0,max(r_o_vector*1.5)],'k--')
    
    legend('Outer','Necrotic','Inhibited')
    
    xlabel('Time')
    ylabel('Radius')
    
    title('Evolution of radius of spheroid')
    xlim([0,20])
    
    
elseif include_plot == 3
    
    hold on
    % plot the outer radius phase 1
    plot(tau_vector, r_o_vector,'g-.','Linewidth',2)
    % plot the outer radius phase 2
    plot(tau_vector, r_i_vector,'k-.','Linewidth',2)
    plot(tau_vector, r_g_vector,'m-.','Linewidth',2)
    
    % plot a dashed line marking the time between phase 1 and phase 2
    
    if length(tau_phase_1) > 0
        plot(tau_phase_1(end)*ones(2,1),[0,max(r_o_vector*1.5)],'k:')
    end
    
    % plot a dashed line marking the time between phase 2 and phase 3
    
    if length(tau_phase_1) > 0
        plot((tau_phase_1(end)+tau_phase_2_ode15s(end))*ones(2,1),[0,max(r_o_vector*1.5)],'k:')
    else
        if length(tau_phase_2_ode15s) > 0
            plot((tau_phase_2_ode15s(end))*ones(2,1),[0,max(r_o_vector*1.5)],'k:')
        end
    end
    
    legend('Outer','Necrotic','Inhibited proliferation')
    
    xlabel('Time')
    ylabel('Radius')
    
    title('Evolution of radius of spheroid')
    xlim([0,20])
    
    
end



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Output:
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Evaluate the variables at the specified times
time_vec_update = time_vec;
time_vec_update(time_vec_update == -1) = 40;

len_variable_id_vec = length(variable_id_vec);

variable_deterministic_values = zeros(len_variable_id_vec,1);


for ii = 1:len_variable_id_vec
    

    if time_vec_update(ii) <  (1/s)*tau_1 % then in Phase 1

        
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec_update(ii)
            variable_deterministic_values(ii) = R_c*xi_0_init.*exp(s*time_vec_update(ii)/3);
            
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec_update(ii)
            variable_deterministic_values(ii) = 0;
            
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec_update(ii)
            variable_deterministic_values(ii) = 0;
        end
        
    elseif time_vec_update(ii) < (1/s)*(tau_1 + max_sol_ode15s_phase2_x) % then in Phase 2
        
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec_update(ii)
            variable_deterministic_values(ii) = R_c.*Q.*(1-deval(sol_ode15s_phase2,s*(time_vec_update(ii)-(1/s)*tau_1)).^2).^(-1/2);
            
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec_update(ii)
            variable_deterministic_values(ii) = 0;
            
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec_update(ii)
            variable_deterministic_values(ii) = R_c.*Q.*sqrt((1./(1-deval(sol_ode15s_phase2,s*(time_vec_update(ii)-(1/s)*tau_1)).^2))- 1);
        end
        
    else % In Phase 3
        
        save_time_y_phase3_ode15s = deval(sol_ode15s_phase3,s*(time_vec_update(ii)-(1/s)*(tau_1+max_sol_ode15s_phase2_x)));
        save_time_x_phase3_dt = save_time_y_phase3_ode15s(1);
        save_time_y_phase3_dt = save_time_y_phase3_ode15s(2);
        save_time_xi_phase3_dt = (((1-save_time_x_phase3_dt).^2).*(1+2.*save_time_x_phase3_dt)).^(-1/2);
        
        save_time_r_0_phase_3 = R_c.*save_time_xi_phase3_dt;
        save_time_r_g_phase_3 = R_c.*save_time_y_phase3_dt.*save_time_xi_phase3_dt;
        save_time_r_i_phase_3 = R_c.*save_time_x_phase3_dt.*save_time_xi_phase3_dt;
        
        if variable_id_vec(ii) == 1  % 1 - R_o - outer
            % evaluate R_o at time_vec_update(ii)
            variable_deterministic_values(ii) = save_time_r_0_phase_3;
            
        elseif variable_id_vec(ii) == 2 % 2 - R_i - necrotic
            % evaluate R_i at time_vec_update(ii)
            variable_deterministic_values(ii) = save_time_r_i_phase_3 ;
            
        elseif variable_id_vec(ii) == 3 % 3 - R_g - inhibited
            % evaluate R_g at time_vec_update(ii)
            variable_deterministic_values(ii) = save_time_r_g_phase_3;
        end 
    end
end


end

