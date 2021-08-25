function function_Greenspan_compute_confidenceintervals(load_file_location, simulation_id,filepath_save)

%% Compute approximate 95% confidence intervals

%% load .mat file with mle, pooled standard deviation, bounds
load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
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
p_lower_bound_CI_fsolve = p_lower_bounds;
p_upper_bound_CI_fsolve = p_upper_bounds;


for parameters_to_profile_loop_counter=1:len_parameters_to_profile
    
    parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
    
    %% Load the profile likelihood final pass data
    
    load([load_file_location simulation_id '\' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_3'  '.mat'],...
        'pr',...
        'pp',...
        'mle_pr');
    
    % remove non-unique pr and pp
    mle_index = find(hist(pr,unique(pr))>1);
    
    pr = [pr(1:mle_index),pr(mle_index+2:end)];
    pp = [pp(1:mle_index),pp(mle_index+2:end)];
    mle_pr =     [mle_pr(1:mle_index,:);mle_pr(mle_index+2:end,:)];
    
    % calculate profile likelihood
    
    profile_likelihood_this_loop =  -pp - (-nLLmin);
    
    
    %% Determine the lower bound of the 95% CI
    
    % Starting from the lower bound of the domain find the first value for which the profile likelihood is above the confidence interval threshold value
    
    for pr_index=1:length(pr)
        profile_likelihood_at_pr_index =  profile_likelihood_this_loop(pr_index);
        if profile_likelihood_at_pr_index >=  -1.92
            if pr_index == 1
                p_lower_bound_CI(parameters_to_profile_loop_counter) = pr(1);
            else
                p_lower_bound_CI(parameters_to_profile_loop_counter) = pr(pr_index -1);
            end
            
            break
        end
        
    end

    % fsolve to find parameter value closest to confidence interval threshold value
    data=[pr;profile_likelihood_this_loop]';
    first_guess = pr(pr_index);
    xval = @(yval) fsolve(@(x) interp1(data(:,1), data(:,2), x, 'linear') - yval, first_guess);
    
    if  pr_index == 1
    else
        p_lower_bound_CI_fsolve(parameters_to_profile_loop_counter) = xval(-1.92);
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
    
    % fsolve to find parameter value closest to confidence interval threshold value
    
    data=[pr;profile_likelihood_this_loop]';
    first_guess = p_upper_bound_CI(parameters_to_profile_loop_counter);
    xval = @(yval) fsolve(@(x) interp1(data(:,1), data(:,2), x, 'linear') - yval, first_guess);
    
    if pr_index == 1
    else
        p_upper_bound_CI_fsolve(parameters_to_profile_loop_counter) = xval(-1.92);
    end
    
    %% Plot
    
    figure
    plot(pr,exp(profile_likelihood_this_loop))
    hold on
    plot([p_lower_bound_CI_fsolve(parameters_to_profile_loop_counter),p_lower_bound_CI_fsolve(parameters_to_profile_loop_counter)],[0,2],'b')
    plot([p_upper_bound_CI_fsolve(parameters_to_profile_loop_counter),p_upper_bound_CI_fsolve(parameters_to_profile_loop_counter)],[0,2],'r')
    title(['parameters_to_profile_loop_counter:  '  num2str(parameters_to_profile_loop_counter)])
    shg
    
end

%% Save variables

save([filepath_save simulation_id '_profile_likelihood_' 'CI_bounds_fsolve'  '.mat'],'-v7.3',...
    'p_lower_bound_CI',...
    'p_upper_bound_CI',...
    'p_lower_bound_CI_fsolve',...
    'p_upper_bound_CI_fsolve');
disp('File saved')

%% Save variables to .csv file (rounded to 3 decimal places)

p_mle_round = round(p_mle, 3);
p_lower_bound_CI_fsolve_round = round(p_lower_bound_CI, 3);
p_upper_bound_CI_fsolve_round = round(p_upper_bound_CI, 3);

m = [p_mle_round,p_lower_bound_CI_fsolve_round,p_upper_bound_CI_fsolve_round];
writematrix(m,[filepath_save simulation_id '_profile_likelihood_' 'CI_bounds_fsolve'  '.csv'])


end









