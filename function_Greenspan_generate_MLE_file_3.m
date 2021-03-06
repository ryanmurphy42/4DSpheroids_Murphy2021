function  function_Greenspan_generate_MLE_file_3(load_file_location, simulation_id,filepath_save)

%% Load the first pass MLE
load([load_file_location simulation_id '/' simulation_id '_exp_MLE1.mat'],... % first pass
    'simulation_id',...
    'p_first_guess',...
    'p_lower_bounds',...
    'p_upper_bounds',...
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
    'pooled_standard_deviation_outer',...
    'pooled_standard_deviation_necrotic',...
    'pooled_standard_deviation_inhibited'...
    );



%% Load the second pass MLE 
expMLE2_mat = load([load_file_location simulation_id '/' simulation_id '_exp_MLE2.mat'],... % second pass
    'p_mle',...
    'nLLmin',...
    'time_measurements_array',...
    'y_measurements_array');

% update the MLE
p_mle = expMLE2_mat.p_mle;
nLLmin = expMLE2_mat.nLLmin;
time_measurements_array = expMLE2_mat.time_measurements_array;
y_measurements_array = expMLE2_mat.y_measurements_array;


%% Save data

save([filepath_save simulation_id '_exp_MLE' '3' '.mat'],'-v7.3',...
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