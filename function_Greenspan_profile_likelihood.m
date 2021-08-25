function function_Greenspan_profile_likelihood(parameters_to_profile_this_loop,parameter_range_to_profile,...
    parameter_range_to_profile_custom, p_mle,p_lower_bounds,p_upper_bounds,...
    simulation_id,filepath_save,time_measurements_all,y_measurements_all,variable_id_measurements,first_second_pass,lower_upper,...
    y_measurements_array,pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)

% Loop to the "left" (lower) and to the "right" (upper) of the MLE.

% Parameter id - parameter name
% 1 - Q
% 2 - gamma
% 3 - s
% 4 - R_c
% 5 - R_o_init

% define global minimisation properties
globalmin_max_time= 900;
globalmin_NumTrialPoints = 2000;


%% likelihood function

% set the standard deviation for each measurement according to the type of measurment
standard_deviation_vec = [ pooled_standard_deviation_outer*ones(length(y_measurements_array{1}),1); ...
    pooled_standard_deviation_necrotic*ones(length(y_measurements_array{2}),1);...
    pooled_standard_deviation_inhibited*ones(length(y_measurements_array{3}),1)];

% define the likelihood function
fun_likelihood = @(p) function_Greenspan_loglikelihood(p,y_measurements_all, variable_id_measurements, time_measurements_all,standard_deviation_vec);

%% Set ranges and points to evaluate for profile likelihood

% Parameter 1 - Q
npts=20;

if parameter_range_to_profile_custom(1) == 1
    p1 = parameter_range_to_profile{1};
else
    p1_lower = linspace(p_lower_bounds(1),p_mle(1),npts);
    p1_upper = linspace(p_mle(1),p_upper_bounds(1),npts);
    p1_lower=unique(p1_lower);
    p1_upper=unique(p1_upper);
    
    p1 = unique([p1_lower p1_upper]);
    p1_lower = sort(p1_lower,'descend');
end
p1_lower_bounds = p_lower_bounds([2,3,4,5]);
p1_upper_bounds = p_upper_bounds([2,3,4,5]);
p1_mle = p_mle([2,3,4,5]);

% Parameter 2 - gamma
if parameter_range_to_profile_custom(2) == 1
    p2 = parameter_range_to_profile{2};
else
    p2_lower   = linspace(p_lower_bounds(2),p_mle(2),npts);
    p2_upper = linspace(p_mle(2),p_upper_bounds(2),npts);
    p2_lower=unique(p2_lower);
    p2_upper=unique(p2_upper);
    
    p2 = unique([p2_lower p2_upper]);
    p2_lower = sort(p2_lower,'descend');
end
p2_lower_bounds = p_lower_bounds([1,3,4,5]);
p2_upper_bounds = p_upper_bounds([1,3,4,5]);
p2_mle = p_mle([1,3,4,5]);

% Parameter 3 - s
if parameter_range_to_profile_custom(3) == 1
    p3 = parameter_range_to_profile{3};
else
    p3_lower   = linspace(p_lower_bounds(3),p_mle(3),npts);
    p3_upper = linspace(p_mle(3),p_upper_bounds(3),npts);
    p3_lower=unique(p3_lower);
    p3_upper=unique(p3_upper);
    
    p3 = unique([p3_lower p3_upper]);
    p3_lower = sort(p3_lower,'descend');
end
p3_lower_bounds = p_lower_bounds([1,2,4,5]);
p3_upper_bounds = p_upper_bounds([1,2,4,5]);
p3_mle = p_mle([1,2,4,5]);

% Parameter 4 - R_c
if parameter_range_to_profile_custom(4) == 1
    p4 = parameter_range_to_profile{4};
else
    p4_lower   = linspace(p_lower_bounds(4),p_mle(4),npts);
    p4_upper = linspace(p_mle(4),p_upper_bounds(4),npts);
    p4_lower=unique(p4_lower);
    p4_upper=unique(p4_upper);
    
    p4 = unique([p4_lower p4_upper]);
    p4_lower = sort(p4_lower,'descend');
end
p4_lower_bounds = p_lower_bounds([1,2,3,5]);
p4_upper_bounds = p_upper_bounds([1,2,3,5]);
p4_mle = p_mle([1,2,3,5]);

% Parameter 5 - R_o_init
if parameter_range_to_profile_custom(5) == 1
    p5 = parameter_range_to_profile{5};
else
    p5_lower   = linspace(p_lower_bounds(5),p_mle(5),npts);
    p5_upper = linspace(p_mle(5),p_upper_bounds(5),npts);
    p5_lower=unique(p5_lower);
    p5_upper=unique(p5_upper);
    
    p5 = unique([p5_lower p5_upper]);
    p5_lower = sort(p5_lower,'descend');
end
p5_lower_bounds = p_lower_bounds([1,2,3,4]);
p5_upper_bounds = p_upper_bounds([1,2,3,4]);
p5_mle = p_mle([1,2,3,4]);

%% P1: Profile likelihood (maximising over parameters 2,3,4,5) %

if sum(parameters_to_profile_this_loop==1) > 0
    
    if lower_upper == 1
        
        tic
        pr=p1_lower;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p1_mle;
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            
            %% global optimisation
            
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p1_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p1_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                fun = @(p) fun_likelihood([pr(i),p(1),p(2),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p1_lower_bounds,'ub', p1_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) = [pr(i);guess_loop(1:4)]'  ;
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p1_mle;
            end
            
            
            toc
        end
        toc
        
    elseif lower_upper == 2
        
        tic
        pr=p1_upper;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p1_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            
            %% global optimisation
            
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p1_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p1_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                fun = @(p) fun_likelihood([pr(i),p(1),p(2),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p1_lower_bounds,'ub', p1_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) = [pr(i);guess_loop(1:4)]'  ;
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p1_mle;
            end
            
            
            toc
        end
        toc
        
    end
    
    
    
    
end


%% P2: Profile likelihood (maximising over parameters 1,3,4,5) %

if sum(parameters_to_profile_this_loop==2) > 0
    
    
    if lower_upper == 1
        
        tic
        pr=p2_lower;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p2_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        
        
        for i = 1:length(pr)
            
            
            %% global optimisation
            tic
            
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p2_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p2_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                
                
                fun = @(p) fun_likelihood([p(1),pr(i),p(2),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p2_lower_bounds,'ub', p2_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) = [guess_loop(1);pr(i);guess_loop(2:4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p2_mle;
            end
            
            toc
        end
        toc
        
    elseif lower_upper == 2
        
        tic
        pr=p2_upper;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p2_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        
        
        for i = 1:length(pr)
            
            
            %% global optimisation
            tic
            
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p2_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p2_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                fun = @(p) fun_likelihood([p(1),pr(i),p(2),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p2_lower_bounds,'ub', p2_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
                
                
            end
            
            
            
            mle_pr(i,:) = [guess_loop(1);pr(i);guess_loop(2:4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p2_mle;
            end
            
            toc
        end
        toc
        
    end
    
end


%% P3: Profile likelihood (maximising over parameters 1,2,4,5) %

if sum(parameters_to_profile_this_loop==3) > 0
    
    if lower_upper == 1
        
        
        
        tic
        pr=p3_lower;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p3_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            %% global optimisation
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p3_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p3_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                
                fun = @(p) fun_likelihood([p(1),p(2),pr(i),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p3_lower_bounds,'ub', p3_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) = [guess_loop(1:2);pr(i);guess_loop(3:4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p3_mle;
            end
            
            toc
        end
        toc
        
    elseif lower_upper == 2
        
        tic
        pr=p3_upper;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p3_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            %% global optimisation
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p3_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p3_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                
                fun = @(p) fun_likelihood([p(1),p(2),pr(i),p(3),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p3_lower_bounds,'ub', p3_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) = [guess_loop(1:2);pr(i);guess_loop(3:4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p3_mle;
            end
            
            toc
        end
        toc
        
        
    end
    
end


%% P4: Profile likelihood (maximising over parameters 1,2,3,5) %


if sum(parameters_to_profile_this_loop==4) > 0
    
    if lower_upper == 1
        
        
        tic
        pr=p4_lower;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p4_mle; %
        
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            disp(['pr index is ' num2str(i)])
            
            %% global optimisation first guess
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p4_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p4_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            
            %% global optimisation
            
            tic
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                tic
                fun = @(p) fun_likelihood([p(1),p(2),p(3),pr(i),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p4_lower_bounds,'ub', p4_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
                toc
                
            end
            
            
            
            mle_pr(i,:) = [guess_loop(1:3);pr(i);guess_loop(4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p4_mle;
            end
            
            toc
        end
        toc
        
    elseif lower_upper == 2
        
        
        tic
        pr=p4_upper;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p4_mle; %
        
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            disp(['pr index is ' num2str(i)])
            
            %% global optimisation first guess
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p4_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p4_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            %% global optimisation
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                tic
                fun = @(p) fun_likelihood([p(1),p(2),p(3),pr(i),p(4)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p4_lower_bounds,'ub', p4_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
                toc
                
            end
            
            
            
            mle_pr(i,:) = [guess_loop(1:3);pr(i);guess_loop(4)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p4_mle;
            end
            
            toc
        end
        toc
        
    end
    
end




%% P5: Profile likelihood (maximising over parameters 1,2,3,4) %

if sum(parameters_to_profile_this_loop==5) > 0
    
    if lower_upper == 1
        
        tic
        pr=p5_lower;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p5_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            %% global optimisation
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p5_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p5_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                
                fun = @(p) fun_likelihood([p(1),p(2),p(3),p(4),pr(i)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p5_lower_bounds,'ub', p5_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) =[guess_loop(1:4);pr(i)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p5_mle;
            end
            
            toc
        end
        toc
        
    elseif lower_upper == 2
        
        
        tic
        pr=p5_upper;
        pp = zeros(size(pr));
        mle_pr = zeros(length(pr),5);
        first_guess_loop = p5_mle; %
        
        mle_prev_iteration = first_guess_loop;
        mle_prev_prev_iteration = first_guess_loop;
        
        for i = 1:length(pr)
            
            %% global optimisation
            
            if i==1
                first_guess_this_iteration = first_guess_loop;
            elseif i==2
                % 0th order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration;
            else
                % first order approximation of first guess
                first_guess_this_iteration = mle_prev_iteration + ((pr(i)-pr(i-1))./(pr(i-1)-pr(i-2))).*(mle_prev_iteration - mle_prev_prev_iteration);
            end
            
            
            % ensure first_guess_this_iteration is inside parameter bounds
            if  sum(first_guess_this_iteration < p5_lower_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            if sum(first_guess_this_iteration > p5_upper_bounds) > 0
                first_guess_this_iteration = mle_prev_iteration;
            end
            
            tic
            
            max_iterations = 2500;
            MaxFunctionEvaluations = 5000;
            
            output_localSolverIncomplete = inf;
            
            while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to avoid missing the global minimum
                
                
                fun = @(p) fun_likelihood([p(1),p(2),p(3),p(4),pr(i)]); %
                
                problem = createOptimProblem('fmincon',...
                    'objective', fun,...
                    'x0',first_guess_this_iteration,'lb',p5_lower_bounds,'ub', p5_upper_bounds, 'options',...
                    optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
                
                gs= GlobalSearch('Display','iter','NumTrialPoints',globalmin_NumTrialPoints,'MaxTime',globalmin_max_time);
                
                rng(14,'twister') % for reproducibility
                [guess_loop,pp(i),exitflag_gs,output_gs] = run(gs,problem);
                
                output_localSolverIncomplete = output_gs.localSolverIncomplete;
                
                max_iterations = max_iterations*10;
                MaxFunctionEvaluations = MaxFunctionEvaluations*10;
                
            end
            
            mle_pr(i,:) =[guess_loop(1:4);pr(i)]';
            
            % to use for first order approximation of first guess
            mle_prev_prev_iteration = mle_prev_iteration;
            mle_prev_iteration = guess_loop;
            
            
            % if no feasible solution found
            if output_gs.localSolverNoSolution == output_gs.localSolverTotal
                output_localSolverIncomplete = 1; % to exit the while loop
                
                pp(i)= inf;
                
                guess_loop = p5_mle;
            end
            
            toc
        end
        toc
        
    end
    
end

%% Save as .mat file
save([filepath_save simulation_id '_profile_likelihood_'  num2str(parameters_to_profile_this_loop) '_' num2str(first_second_pass) '_' num2str(lower_upper) '.mat'],'-v7.3',...
    'pr',...
    'pp',...
    'mle_pr');
disp('File saved')



end


