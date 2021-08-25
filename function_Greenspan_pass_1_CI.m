function function_Greenspan_pass_1_CI(load_file_location, simulation_id,filepath_save)


%% load .mat file with mle, pooled standard deviation, bounds
load([load_file_location simulation_id '/' simulation_id '_exp_MLE1.mat'],...
    'p_mle',...
    'pooled_standard_deviation_all',...
    'nLLmin',...
    'p_lower_bounds',...
    'p_upper_bounds');

%% Loop over each parameter

parameters_to_profile = [1,2,3,4,5];
len_parameters_to_profile = length(parameters_to_profile);

% set initial values for the lower and upper bounds
p_lower_bound_CI = p_lower_bounds;
p_upper_bound_CI = p_upper_bounds;


for parameters_to_profile_loop_counter=1:len_parameters_to_profile
    
    parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
    
    %% Load the profile likelihood first pass data
    
    load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_1'  '.mat'],...
        'pr',...
        'pp',...
        'mle_pr');
    
    profile_likelihood_this_loop =  -pp - (-nLLmin);
    
    %% Determine the lower bound of the 95% CI
    
    % Starting from the lower bound of the domain find the first value for which the profile likelihood is above the confidence interval threshold value
    
    for pr_index=1:length(pr)
        profile_likelihood_at_pr_index =  profile_likelihood_this_loop(pr_index);
        if profile_likelihood_at_pr_index >=  -1.92 %(log-likelihood profile likelihood threshold value - corresponds to 0.15 likelihood threshold value)
            if pr_index == 1
                p_lower_bound_CI(parameters_to_profile_loop_counter) = pr(1);
            else
                p_lower_bound_CI(parameters_to_profile_loop_counter) = pr(pr_index -1);
            end
            break
        end
        
    end
    
    %% Determine the upper bound of the 95% CI
    
    % Starting from the upper bound of the domain find the first value for which the profile likelihood is above the confidence interval threshold value
    
    for pr_index=1:length(pr)
        profile_likelihood_at_pr_index =  profile_likelihood_this_loop(length(pr) + 1 - pr_index);
        if profile_likelihood_at_pr_index >=  -1.92
            if pr_index == 1
                p_upper_bound_CI(parameters_to_profile_loop_counter) = pr(end);
            else
                p_upper_bound_CI(parameters_to_profile_loop_counter) = pr(length(pr) - pr_index + 2);
            end
            
            break
        end
        
    end

end

%% Find the MLE from profile likelihoods

pp_mle_CI = inf;

for parameters_to_profile_loop_counter=1:len_parameters_to_profile
    
    parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
    
    %% Load the profile likelihood first pass data
    
    load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_1' '.mat'],...
        'pr',...
        'pp',...
        'mle_pr');
    
    pp_this_loop = pp;
    
    [min_pp_this_loop,min_pp_this_loop_index] = min(pp_this_loop);
    
    % lowest error
    if min_pp_this_loop < pp_mle_CI
        mle_pr_CI = mle_pr(min_pp_this_loop_index,:)';
        pp_mle_CI = min(pp_mle_CI,min_pp_this_loop);
        
    end
    
    
end

%% Save variables

save([filepath_save simulation_id '_profile_likelihood_' 'CI_bounds'  '.mat'],'-v7.3',...
    'p_lower_bound_CI',...
    'p_upper_bound_CI',...
    'mle_pr_CI',...
    'pp_mle_CI');
disp('File saved')

end
