function   function_Greenspan_pl_combine_lower_upper(load_file_location,simulation_id,parameters_to_profile_this_loop,first_second_pass,filepath_save)

%% Load the .mat files
lower_upper=1;
lower = load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_' num2str(first_second_pass) '_' num2str(lower_upper) '.mat'],...
    'pr',...
    'pp',...
    'mle_pr');

lower_upper=2;
upper = load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_' num2str(first_second_pass) '_'  num2str(lower_upper) '.mat'],...
    'pr',...
    'pp',...
    'mle_pr');

%% Sort pr
[pr,pr_sort_index] = sort([lower.pr,upper.pr]);

% combine lower and upper
pp_temp = [lower.pp,upper.pp];
mle_pr_temp = [lower.mle_pr;upper.mle_pr];

% sort the combined lower and upper files
pp = pp_temp(pr_sort_index);
mle_pr = mle_pr_temp(pr_sort_index,:);

%% Save
save([filepath_save simulation_id '_profile_likelihood_'  num2str(parameters_to_profile_this_loop) '_' num2str(first_second_pass) '.mat'],'-v7.3',...
    'pr',...
    'pp',...
    'mle_pr');
disp('File saved')



end