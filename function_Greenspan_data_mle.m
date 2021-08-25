%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2021--Murphy et al--Designing and interpreting 4D tumour spheroid experiments
%% Author Ryan J. Murphy
%% Code to load the outer, necrotic, and inhibited radii from .mat files, save into one file, and calculate the the maximum likelihood estimate.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function function_Greenspan_data_mle(simulation_id, ...
    data_file_to_use_array, data_sheet_to_use_array,...
    p_first_guess, p_lower_bounds, p_upper_bounds,...
    times_to_use, initial_condition,filepath_save,first_second_pass,...
    data_inclusions)

%% Create folder and save paths

folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end

%% Create variable to store measurement times, radii (referred to as y_measurements), type of measurement, pooled standard deviation

time_measurements_all = [];
y_measurements_all = [];
variable_id_measurements = [];
sum_for_pooled_standard_deviation_all= 0;
count_total_length_y_measurements = 0;


%% Loop through each file to load 1) the outer radius data, 2) necrotic radius data, 3) inhibited radius data.

for data_file_counter = 1:3 % 1 - outer radius, 2 - necrotic radius, 3 - inhibited radius

    %% For WM793b (shift start time by 4 days corresponding to the time taken for spheroids to form)
    if num2str(simulation_id(4:6)) == 793
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 4;
    elseif str2double(simulation_id(4:6)) == 793
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 4;
	elseif num2str(simulation_id(6:8)) == 793
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 4;
    elseif str2double(simulation_id(6:8)) == 793
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 4;	
    end
    
    %% For WM983b (shift start time by 2 days corresponding to the time taken for spheroids to form)
    
    if num2str(simulation_id(4:6)) == 983
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 2;
    elseif str2double(simulation_id(4:6)) == 983
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 2;
    end
    
	 %% For WM164 (shift start time by 3 days corresponding to the time taken for spheroids to form)
    
     if num2str(simulation_id(4:6)) == 164
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 3;
    elseif str2double(simulation_id(4:6)) == 164
        experimental_data_table = load(data_file_to_use_array{data_file_counter});
        experimental_data_table.Day = experimental_data_table.Day - 3;
     end
    
    %% Obtain initial condition from file
    
    file_initial_condition = experimental_data_table.InitialCondition;
    
    
    %% Obtain file_time_measurements and file_y_measurements
    
    file_time_measurements = experimental_data_table.Day;
    file_y_measurements = experimental_data_table.Radius;
    
    
    %% Select time and y measurements for given initial condition
    
    file_time_measurements_ic = file_time_measurements(file_initial_condition==initial_condition);
    file_y_measurements_ic = file_y_measurements(file_initial_condition==initial_condition);
    
    %% Determine which times are to be used
    
    len_file_time_measurements_ic = length(file_time_measurements_ic);
    times_to_use_indicator =   zeros(len_file_time_measurements_ic,1);
    
    if len_file_time_measurements_ic > 0
        
        time_measurements_temp = 0;
        time_measurements_temp_counter=0;
        for i=1:len_file_time_measurements_ic
            if sum(file_time_measurements_ic(i) == times_to_use) > 0
                time_measurements_temp_counter = time_measurements_temp_counter + 1;
                time_measurements_temp(time_measurements_temp_counter) =  file_time_measurements_ic(i);
                times_to_use_indicator(i) = 1;
            else
                times_to_use_indicator(i) = 0;
            end
        end
        time_measurements = time_measurements_temp;
        
        if  data_inclusions(data_file_counter) == 1
            time_measurements_all = [time_measurements_all,time_measurements];
        end
        
        %% Select  y measurements using times_to_use_indicator
        
        y_measurements = file_y_measurements_ic(times_to_use_indicator==1);
        
        if  data_inclusions(data_file_counter) == 1
            y_measurements_all = [y_measurements_all;y_measurements];
        end
        
        %% Specify the variable_id_measurements
        if  data_inclusions(data_file_counter) == 1
            variable_id_measurements = [variable_id_measurements;data_file_counter*ones(length(y_measurements),1)];
        end
        
    else
        % no measurements
        time_measurements = [];
        y_measurements = []; 
    end
    
    
    %% Calculate pooled_standard_deviation (for data used for profiling and full data)
    
    if length(y_measurements) > 0
        
        unique_time_measurements = unique(sort(time_measurements));
        num_unique_time_measurements = length(unique_time_measurements);
        
        experimental_measurements_mean_per_timepoint = zeros(num_unique_time_measurements,1);
        experimental_measurements_var_per_timepoint = zeros(num_unique_time_measurements,1);
        experimental_measurements_std_per_timepoint = zeros(num_unique_time_measurements,1);
        for i=1:num_unique_time_measurements
            experimental_measurements_mean_per_timepoint(i) = mean(y_measurements(time_measurements==unique_time_measurements(i)));
            experimental_measurements_var_per_timepoint(i) = var(y_measurements(time_measurements==unique_time_measurements(i)));
            experimental_measurements_std_per_timepoint(i) = std(y_measurements(time_measurements==unique_time_measurements(i)));
        end
        sum_for_pooled_standard_deviation  = 0;
        count_total_length_y_measurements = count_total_length_y_measurements + length(y_measurements);
        
        for j=1:length(y_measurements)
            sum_for_pooled_standard_deviation = sum_for_pooled_standard_deviation + (y_measurements(j) - experimental_measurements_mean_per_timepoint(unique_time_measurements==time_measurements(j)) )^2;
        end
        pooled_standard_deviation = sqrt((1/(length(time_measurements)-1))*sum_for_pooled_standard_deviation);
        
        if data_inclusions(data_file_counter) == 1
            count_total_length_y_measurements = count_total_length_y_measurements + length(y_measurements);
            for j=1:length(y_measurements)
                sum_for_pooled_standard_deviation_all = sum_for_pooled_standard_deviation_all + (y_measurements(j) - experimental_measurements_mean_per_timepoint(unique_time_measurements==time_measurements(j)) )^2;
            end
        end
        
    else
        pooled_standard_deviation = 0;
        experimental_measurements_mean_per_timepoint = [];
        experimental_measurements_var_per_timepoint = [];
        experimental_measurements_std_per_timepoint = [];
        unique_time_measurements = [];
    end
    
    
    %% Calculate  pooled_standard_deviation_outer,pooled_standard_deviation_necrotic, pooled_standard_deviation_fucci  (for data used for profiling and each measurement type)
    
    if data_file_counter == 1 % 1 - outer radius
        pooled_standard_deviation_outer = pooled_standard_deviation;
    elseif data_file_counter == 2 % 2 - necrotic core
        pooled_standard_deviation_necrotic = pooled_standard_deviation;
    elseif data_file_counter == 3 % 3 - fucci
        pooled_standard_deviation_inhibited = pooled_standard_deviation;
    end
    
    
    %% save full data source
    
    time_measurements_full = file_time_measurements_ic;
    y_measurements_full = file_y_measurements_ic;
    
    
    
    
    %% full
    unique_time_measurements_full = unique(sort(time_measurements_full));
    num_unique_time_measurements_full = length(unique_time_measurements_full);
    
    
    experimental_measurements_mean_per_timepoint_full = zeros(num_unique_time_measurements_full,1);
    experimental_measurements_var_per_timepoint_full = zeros(num_unique_time_measurements_full,1);
    experimental_measurements_std_per_timepoint_full = zeros(num_unique_time_measurements_full,1);
    for i=1:num_unique_time_measurements_full
        experimental_measurements_mean_per_timepoint_full(i) = mean(y_measurements_full(time_measurements_full==unique_time_measurements_full(i)));
        experimental_measurements_var_per_timepoint_full(i) = var(y_measurements_full(time_measurements_full==unique_time_measurements_full(i)));
        experimental_measurements_std_per_timepoint_full(i) = std(y_measurements_full(time_measurements_full==unique_time_measurements_full(i)));
    end

    
    if data_inclusions(data_file_counter) == 1
        
        unique_time_measurements_array{data_file_counter} = unique_time_measurements;
        experimental_measurements_mean_per_timepoint_array{data_file_counter} = experimental_measurements_mean_per_timepoint;
        experimental_measurements_var_per_timepoint_array{data_file_counter} = experimental_measurements_var_per_timepoint;
        experimental_measurements_std_per_timepoint_array{data_file_counter} = experimental_measurements_std_per_timepoint;
        pooled_standard_deviation_array{data_file_counter} = pooled_standard_deviation;
        time_measurements_array{data_file_counter} = time_measurements;
        y_measurements_array{data_file_counter} = y_measurements;
        
    else
        
        unique_time_measurements_array{data_file_counter}  = [];
        experimental_measurements_mean_per_timepoint_array{data_file_counter}  = [];
        experimental_measurements_var_per_timepoint_array{data_file_counter}  = [];
        experimental_measurements_std_per_timepoint_array{data_file_counter} = [];
        pooled_standard_deviation_array{data_file_counter} = [];
        time_measurements_array{data_file_counter} = {};
        y_measurements_array{data_file_counter}  = {};
        
    end
    
    time_measurements_full_array{data_file_counter} = time_measurements_full;
    y_measurements_full_array{data_file_counter} = y_measurements_full;
    unique_time_measurements_full_array{data_file_counter} = unique_time_measurements_full;
    experimental_measurements_mean_per_timepoint_full_array{data_file_counter} = experimental_measurements_mean_per_timepoint_full;
    experimental_measurements_var_per_timepoint_full_array{data_file_counter} = experimental_measurements_var_per_timepoint_full;
    experimental_measurements_std_per_timepoint_full_array{data_file_counter} = experimental_measurements_std_per_timepoint_full;
    
    
end


%% Use all of the available data to create pooled standard deviation (pooled_standard_deviation_all)
pooled_standard_deviation_all = sqrt((1/(count_total_length_y_measurements-1))*sum_for_pooled_standard_deviation_all);

%% if standard deviation for one measurement is zero set it to the pooled variance
if abs(pooled_standard_deviation_outer) <1e-8 % 1 - outer radius
    pooled_standard_deviation_outer = pooled_standard_deviation_all;
end
if abs(pooled_standard_deviation_necrotic) <1e-8 % 2 - necrotic core
    pooled_standard_deviation_necrotic = pooled_standard_deviation_all;
end
if abs(pooled_standard_deviation_inhibited) <1e-8 % 3 - fucci
    pooled_standard_deviation_inhibited = pooled_standard_deviation_all;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate MLE using global minimisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set the standard deviation for each measurement according to the type of measurment
standard_deviation_vec = [ pooled_standard_deviation_outer*ones(length(y_measurements_array{1}),1); ...
    pooled_standard_deviation_necrotic*ones(length(y_measurements_array{2}),1);...
    pooled_standard_deviation_inhibited*ones(length(y_measurements_array{3}),1)];

% define the likelihood function
fun_likelihood = @(p) function_Greenspan_loglikelihood(p,y_measurements_all, variable_id_measurements, time_measurements_all,standard_deviation_vec);

% define global minimisation properties
max_iterations = 2500;
MaxFunctionEvaluations = 5000;
output_localSolverIncomplete = inf;

while output_localSolverIncomplete > 0 % run globalsearch until all have converged - to help avoid missing the global minimum
    
    problem = createOptimProblem('fmincon',...
        'objective', fun_likelihood,...
        'x0',p_first_guess,'lb',p_lower_bounds,'ub', p_upper_bounds, 'options',...
        optimoptions(@fmincon,'Algorithm','sqp','Display','off','MaxIterations',max_iterations,'MaxFunctionEvaluations',MaxFunctionEvaluations));
    
    gs = GlobalSearch('Display','iter','NumTrialPoints',5000,'MaxTime',7200);
    
    tic
    rng(14,'twister') % for reproducibility
    [p_mle,nLLmin,exitflag_gs,output_gs] = run(gs,problem);
    toc
    
    output_localSolverIncomplete = output_gs.localSolverIncomplete;
    
    max_iterations = max_iterations*10;
    MaxFunctionEvaluations = MaxFunctionEvaluations*10;
end

% update the first guess used for profile likelihood calculations to the MLE that has just been found.
p_first_guess = p_mle;

%% Save as .mat file

save([filepath_save simulation_id '_exp_MLE' num2str(first_second_pass) '.mat'],'-v7.3',...
    'simulation_id',...
    'p_first_guess',...
    'p_lower_bounds',...
    'p_upper_bounds',...
    'p_mle',...
    'nLLmin',...
    'variable_id_measurements',...
    'unique_time_measurements_array',...
    'experimental_measurements_mean_per_timepoint_array',...
    'experimental_measurements_var_per_timepoint_array',...
    'experimental_measurements_std_per_timepoint_array',...
    'pooled_standard_deviation_array',...
    'time_measurements_full_array',...
    'y_measurements_full_array',...
    'unique_time_measurements_full_array',...
    'experimental_measurements_mean_per_timepoint_full_array',...
    'experimental_measurements_var_per_timepoint_full_array',...
    'experimental_measurements_std_per_timepoint_full_array',...
    'pooled_standard_deviation_all',...
    'time_measurements_all',...
    'y_measurements_all',...
    'time_measurements_array',...
    'y_measurements_array',...
    'pooled_standard_deviation_outer',...
    'pooled_standard_deviation_necrotic',...
    'pooled_standard_deviation_inhibited'...
    );



end