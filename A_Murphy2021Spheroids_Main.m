%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2021--Murphy et al--Designing and interpreting 4D tumour spheroid experiments
%% Preprint on bioRxiv: https://doi.org/10.1101/2021.08.18.456910
%% Author Ryan J. Murphy
%% Main script to generate MLE, profile likelihoods, and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% For mathematical model description and details of statistical identifiability analysis see Supplementary Material A and B.

function A_Murphy2021Spheroids_Main(simulation_num, parameters_to_profile,section_to_run)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Display function inputs

disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
disp(['section_to_run is ' num2str(section_to_run)])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 0) Simulation settings

load_file_location = [pwd '/'];

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1) Determine experimental data and obtain first estimate of MLE
% Due to: number of parameters, size of parameter bounds, time to compute, many local minima,
% We determine the MLE and profile likelihood in steps (see Supplementary Material B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(section_to_run == 1) > 0
    
    first_second_pass = 1;
    function_Greenspan_data_mle(simulation_id, ...
        data_file_to_use_array, data_sheet_to_use_array,...
        p_first_guess, p_lower_bounds, p_upper_bounds,...
        times_to_use, initial_condition,filepath_save,first_second_pass,...
        data_inclusions)
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2) Generate profile likelihoods and MLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2.1.1) Profiling all variables - first pass - lower bounds

if sum(section_to_run == 211) > 0
    first_second_pass=1;
    lower_upper = 1;
    
    %% Load the .mat file containing the first estimate of the MLE
    
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE1.mat'])
    
    %% Run profile likelihood for each parameter
    
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        
        function_Greenspan_profile_likelihood(parameters_to_profile_this_loop,parameter_range_to_profile,...
            parameter_range_to_profile_custom, p_mle,p_lower_bounds,p_upper_bounds,...
            simulation_id,filepath_save,time_measurements_all,y_measurements_all,variable_id_measurements,first_second_pass,lower_upper,...
            y_measurements_array,pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)
    end
end


%% 2.1.2) Profiling all variables - first pass - upper bounds

if sum(section_to_run == 212) > 0
    first_second_pass=1;
    lower_upper = 2;
    
    %% Load the .mat file
    
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE1.mat'])
    
    %% Run profile likelihood for each parameter
    
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        
        function_Greenspan_profile_likelihood(parameters_to_profile_this_loop,parameter_range_to_profile,...
            parameter_range_to_profile_custom, p_mle,p_lower_bounds,p_upper_bounds,...
            simulation_id,filepath_save,time_measurements_all,y_measurements_all,variable_id_measurements,first_second_pass,lower_upper,...
            y_measurements_array,pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)
    end
end


%% 2.1.3) Combine the lower and upper bound profile likelihood files

if sum(section_to_run == 213) > 0
    first_second_pass = 1;
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        function_Greenspan_pl_combine_lower_upper(load_file_location,simulation_id,parameters_to_profile_this_loop,first_second_pass,filepath_save)
    end
end


%% 2.2) Determine approximate 95% confidence intervals for parameters using first pass of profile likelihood
% for final approximate 95% confidence intervals, shown in tables of supplementary material, a more sophisticated approach is used. This level of accuracy is not required here

if sum(section_to_run == 220) > 0
    function_Greenspan_pass_1_CI(load_file_location, simulation_id,filepath_save)
end

%% 2.3) MLE - second pass (setting lower and upper bounds from 95% confidence intervals)

if sum(section_to_run == 230) > 0
    first_second_pass = 2;
    
    % load the lower bounds and upper bounds from 95% CI from profile likelihood first pass
    load([load_file_location simulation_id '\' simulation_id '_profile_likelihood_' 'CI_bounds'  '.mat'],...
        'p_lower_bound_CI',...
        'p_upper_bound_CI',...
        'mle_pr_CI',...
        'pp_mle_CI');
    
    % load data from the MLE
    first_pass_MLE =   load([load_file_location simulation_id '\' simulation_id '_exp_MLE1.mat'],...
        'p_mle',...
        'nLLmin');
    
    % set first guess as minimum (lowest error from first pass MLE and first pass profile liklelihoods)
    if  first_pass_MLE.nLLmin < pp_mle_CI
        p_first_guess_CI = first_pass_MLE.p_mle;
    else
        p_first_guess_CI = mle_pr_CI;
    end
    
    % calculate the MLE inside the approximate 95% confidence intervals
    function_Greenspan_data_mle(simulation_id, ...
        data_file_to_use_array, data_sheet_to_use_array,...
        p_first_guess_CI, p_lower_bound_CI, p_upper_bound_CI,...
        times_to_use, initial_condition,filepath_save,first_second_pass,...
        data_inclusions)
    
end

%% 2.4.1) Profile likelihood - second pass - inside 95% confidence intervals - lower bounds

if sum(section_to_run == 241) > 0
    
    first_second_pass =2;
    lower_upper = 1;
    
    %% Load the .mat file for the second mle guess
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE2.mat']);
    
    %% Run profile likelihood for each parameter
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        
        function_Greenspan_profile_likelihood(parameters_to_profile_this_loop,parameter_range_to_profile,...
            parameter_range_to_profile_custom, p_mle,p_lower_bounds,p_upper_bounds,...
            simulation_id,filepath_save,time_measurements_all,y_measurements_all,variable_id_measurements,first_second_pass,lower_upper,...
            y_measurements_array,pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)
    end
end

%% 2.4.2) Profile likelihood - second pass - inside 95% confidence intervals - lower bounds

if sum(section_to_run == 242) > 0
    
    first_second_pass =2;
    lower_upper = 2;
    
    %% Load the .mat file for the second mle guess
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE2.mat']);
    
    %% Run profile likelihood for each parameter
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        
        function_Greenspan_profile_likelihood(parameters_to_profile_this_loop,parameter_range_to_profile,...
            parameter_range_to_profile_custom, p_mle,p_lower_bounds,p_upper_bounds,...
            simulation_id,filepath_save,time_measurements_all,y_measurements_all,variable_id_measurements,first_second_pass,lower_upper,...
            y_measurements_array,pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)
        
    end
end



%% 2.4.3) Combine the lower and upper bound profile likelihood files

if sum(section_to_run == 243) > 0
    first_second_pass = 2;
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        function_Greenspan_pl_combine_lower_upper(load_file_location,simulation_id,parameters_to_profile_this_loop,first_second_pass,filepath_save)
    end
end


%% 2.5) Calculate profile likelihood for full domain

if sum(section_to_run == 250) > 0
    
    %% Create MLE file 3
    % combine lower bounds and upper bounds from pass 1 with MLE from pass 2
    function_Greenspan_generate_MLE_file_3(load_file_location, simulation_id,filepath_save)
    
    %%  Create profile likelihood file 3
    function_Greenspan_generate_profile_likelihood_file_3(load_file_location,parameters_to_profile, simulation_id,filepath_save)
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3) Plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 3.1) Generate plots of experimental data and MLE

if sum(section_to_run == 31) > 0
    
    %% Load .mat file
    
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
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
    
    %% Define filepath to save figures
    filepath_save_figs = [load_file_location simulation_id '\'];
    
    %% Plot
    
    function_Greenspan_PLOTS_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
        time_measurements_array, y_measurements_array,...
        filepath_save_figs,...
        unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
        experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
        p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
        experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
        pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)
    
    
    
end

%% 3.2) Generate plots of profile likelihoods

if sum(section_to_run == 32) > 0
    
    load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
        'p_mle',...
        'pooled_standard_deviation_all',...
        'nLLmin',...
        'p_lower_bounds',...
        'p_upper_bounds');
    
    % Loop through each parameter
    for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
        parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
        
        %% Load .mat file
        load([load_file_location simulation_id '\' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_3' '.mat'],...
            'pr',...
            'pp',...
            'mle_pr');
        
        %% Plot
        function_Greenspan_PLOTS_profile_likelihoods(pr,pp,mle_pr,parameters_to_profile_this_loop,...
            filepath_save,p_mle,pooled_standard_deviation_all,nLLmin,p_lower_bounds,p_upper_bounds)
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 33) Custom plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if sum(section_to_run == 33) > 0
    
    %% Plots for figures in paper corresponding to WM793b cell line
    
    % profile likelihoods
    function_Greenspan_PLOTS_custom
    
    % Fig 4 - comparing spheroid sizes
    function_Greenspan_PLOTS_mles_with_different_ics
    
    %% Plots for supplementary figures in paper corresponding to supplementary experimental designs for WM793b cell line
    
    % profile likelihoods
    function_Greenspan_PLOTS_custom_supptemporalresolutions
    
    %% Plots for figures in paper corresponding to WM983b cell line
    
    % profile likelihoods
    function_Greenspan_PLOTS_custom_983
    
    % Fig 4 - comparing spheroid sizes
    function_Greenspan_PLOTS_mles_with_different_ics_983
    
    %% Plots for figures in paper corresponding to WM164 cell line
    
    % profile likelihoods
    function_Greenspan_PLOTS_custom_164
    
    % Fig 4 - comparing spheroid sizes
    function_Greenspan_PLOTS_mles_with_different_ics_164
    
    %% Plots for figures in paper corresponding to synthetic data based on WM793b cell line
    
    % Generate synthetic data using Greenspan_generate_synthetic_data
    
    % Plots
    function_Greenspan_PLOTS_custom_synthetic
    
    %% Code to generate table of values for approximate 95% confidence intervals
    
    function_Greenspan_compute_confidenceintervals(load_file_location, simulation_id,filepath_save)
    
end


end


