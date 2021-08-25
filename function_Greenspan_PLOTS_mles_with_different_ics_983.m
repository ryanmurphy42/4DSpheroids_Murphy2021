function function_Greenspan_PLOTS_mles_with_different_ics_983

%% For each initial condition ( 2500, 5000, 10000)
%% Plot the MLE with different initial radius from each initial condition
%% For example, plot MLE 5000 but vary initial radius for 1250, 2500, 5000,10000

load_file_location = [pwd '\'];

simulation_id = 'Sim9832101';
mle_2500  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');


simulation_id = 'Sim9833101';
mle_5000  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');


simulation_id = 'Sim9834101';
mle_10000  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');

R0_2500  = mle_2500.p_mle(5);
R0_5000  = mle_5000.p_mle(5);
R0_10000 = mle_10000.p_mle(5);



%% 2) Load the 2500 MLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


simulation_num = 9832101;
parameters_to_profile = 1:5;
disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
load_file_location = [pwd '\'];


[simulation_id, ...
    data_file_to_use_array,...
    data_sheet_to_use_array,...
    p_lower_bounds,...
    p_upper_bounds,...
    p_first_guess,...
    times_to_use,...
    initial_condition,...
    filepath_save,...
    parameter_range_to_profile_custom,...
    parameter_range_to_profile,...
    data_inclusions]  ...
    = function_load_simulation_settings(simulation_num);


load([load_file_location simulation_id '\' simulation_id '_exp_MLE2.mat'],...
    'time_measurements_all',...
    'y_measurements_all',...
    'time_measurements_array',...
    'y_measurements_array',...
    'unique_time_measurements_array',...
    'experimental_measurements_mean_per_timepoint_array',...
    'experimental_measurements_std_per_timepoint_array',...
    'variable_id_measurements',...
    'p_mle',...
    'time_measurements_full_array',...
    'y_measurements_full_array',...
    'unique_time_measurements_full_array',...
    'experimental_measurements_mean_per_timepoint_full_array',...
    'experimental_measurements_std_per_timepoint_full_array',...
    'pooled_standard_deviation_all',...
    'pooled_standard_deviation_outer',...
    'pooled_standard_deviation_necrotic',...
    'pooled_standard_deviation_inhibited'...
    );




%% 2.2) Plot 2500 data (with initial radius set to 2500 MLE initial radius) v 2500 MLE


simulation_id = 'SimData983D2500MLE2500';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_2500.p_mle;
p_mle(5) = mle_2500.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);

%% 2.3) Plot 2500 data (with initial radius set to 5000 MLE initial radius) v 5000 MLE

simulation_id = 'SimData983D2500MLE5000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_5000.p_mle;
p_mle(5) = mle_2500.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);

%% 2.4) Plot 2500 data (with initial radius set to 10000 MLE initial radius) v 10000 MLE


simulation_id = 'SimData983D2500MLE10000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_10000.p_mle;
p_mle(5) = mle_2500.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);



%% 3) Load the 5000 data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


simulation_num = 9833101;
parameters_to_profile = 1:5;
disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
load_file_location = [pwd '\'];


[simulation_id, ...
    data_file_to_use_array,...
    data_sheet_to_use_array,...
    p_lower_bounds,...
    p_upper_bounds,...
    p_first_guess,...
    times_to_use,...
    initial_condition,...
    filepath_save,...
    parameter_range_to_profile_custom,...
    parameter_range_to_profile,...
    data_inclusions]  ...
    = function_load_simulation_settings(simulation_num);


load([load_file_location simulation_id '\' simulation_id '_exp_MLE2.mat'],...
    'time_measurements_all',...
    'y_measurements_all',...
    'time_measurements_array',...
    'y_measurements_array',...
    'unique_time_measurements_array',...
    'experimental_measurements_mean_per_timepoint_array',...
    'experimental_measurements_std_per_timepoint_array',...
    'variable_id_measurements',...
    'p_mle',...
    'time_measurements_full_array',...
    'y_measurements_full_array',...
    'unique_time_measurements_full_array',...
    'experimental_measurements_mean_per_timepoint_full_array',...
    'experimental_measurements_std_per_timepoint_full_array',...
    'pooled_standard_deviation_all',...
    'pooled_standard_deviation_outer',...
    'pooled_standard_deviation_necrotic',...
    'pooled_standard_deviation_inhibited'...
    );






%% 3.2) Plot 5000 data (with initial radius set to 2500 MLE initial radius) v 2500 MLE



simulation_id = 'SimData983D5000MLE2500';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_2500.p_mle;
p_mle(5) = mle_5000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);

%% 3.3) Plot 5000 data (with initial radius set to 5000 MLE initial radius) v 5000 MLE

simulation_id = 'SimData983D5000MLE5000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_5000.p_mle;
p_mle(5) = mle_5000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);

%% 3.4) Plot 5000 data (with initial radius set to 10000 MLE initial radius) v 10000 MLE


simulation_id = 'SimData983D5000MLE10000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_10000.p_mle;
p_mle(5) = mle_5000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);




%% 4) Load the 10000 data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


simulation_num = 9834101;
parameters_to_profile = 1:5;
disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
load_file_location = [pwd '\'];


[simulation_id, ...
    data_file_to_use_array,...
    data_sheet_to_use_array,...
    p_lower_bounds,...
    p_upper_bounds,...
    p_first_guess,...
    times_to_use,...
    initial_condition,...
    filepath_save,...
    parameter_range_to_profile_custom,...
    parameter_range_to_profile,...
    data_inclusions]  ...
    = function_load_simulation_settings(simulation_num);


load([load_file_location simulation_id '\' simulation_id '_exp_MLE2.mat'],...
    'time_measurements_all',...
    'y_measurements_all',...
    'time_measurements_array',...
    'y_measurements_array',...
    'unique_time_measurements_array',...
    'experimental_measurements_mean_per_timepoint_array',...
    'experimental_measurements_std_per_timepoint_array',...
    'variable_id_measurements',...
    'p_mle',...
    'time_measurements_full_array',...
    'y_measurements_full_array',...
    'unique_time_measurements_full_array',...
    'experimental_measurements_mean_per_timepoint_full_array',...
    'experimental_measurements_std_per_timepoint_full_array',...
    'pooled_standard_deviation_all',...
    'pooled_standard_deviation_outer',...
    'pooled_standard_deviation_necrotic',...
    'pooled_standard_deviation_inhibited'...
    );






%% 4.2) Plot 10000 data (with initial radius set to 2500 MLE initial radius) v 2500 MLE


simulation_id = 'SimData983D10000MLE2500';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_2500.p_mle;
p_mle(5) = mle_10000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);




%% 4.3) Plot 10000 data (with initial radius set to 5000 MLE initial radius) v 5000 MLE


simulation_id = 'SimData983D10000MLE5000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_5000.p_mle;
p_mle(5) = mle_10000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);




%% 4.4) Plot 10000 data (with initial radius set to 10000 MLE initial radius) v 10000 MLE




simulation_id = 'SimData983D10000MLE10000';
folder_name = [simulation_id ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_figs = [load_file_location simulation_id '\'];

% Plot

p_mle = mle_10000.p_mle;
p_mle(5) = mle_10000.p_mle(5);

function_Greenspan_PLOTS_v4_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited);




end
