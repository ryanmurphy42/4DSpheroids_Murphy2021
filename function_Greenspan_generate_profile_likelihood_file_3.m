function function_Greenspan_generate_profile_likelihood_file_3(load_file_location,parameters_to_profile, simulation_id,filepath_save)


%% load the lower bounds and upper bounds from CI
load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' 'CI_bounds'  '.mat'],...
    'p_lower_bound_CI',...
    'p_upper_bound_CI');


%%  Looping through each parameter
% Use pass 2 for parameters inside 1st pass CI
% Use pass 1 for parameters outside 1st pass CI     for parameters_to_profile_loop_counter=1:length(parameters_to_profile)


for parameters_to_profile_loop_counter=1:length(parameters_to_profile)
    parameters_to_profile_this_loop = parameters_to_profile(parameters_to_profile_loop_counter);
    
    pr_temp= [];
    pp_temp = [];
    mle_pr_temp = zeros(1,length(parameters_to_profile));
    
    %% Pass 1 - include only those outside CI
    PL_pass1_mat =   load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_1' '.mat'],...
        'pr',...
        'pp',...
        'mle_pr');
    
    % if outside of CI bound then add to pr 
    counter =0;
    for i = 1:length(PL_pass1_mat.pr)
        
        pass_1_pr_this_loop = PL_pass1_mat.pr;
        
       
        
        if pass_1_pr_this_loop(i) <  p_lower_bound_CI(parameters_to_profile_this_loop)
            counter = counter + 1;
            
            % if less than the lower bound then add
            pr_temp = [pr_temp,pass_1_pr_this_loop(i)];
            pp_temp = [pp_temp,PL_pass1_mat.pp(i)];
            mle_pr_temp(counter,:) = PL_pass1_mat.mle_pr(i,:);
            
        elseif pass_1_pr_this_loop(i) >  p_upper_bound_CI(parameters_to_profile_this_loop)
            counter = counter + 1;
            
            % if less than the lower bound then add
            pr_temp = [pr_temp,pass_1_pr_this_loop(i)];
            pp_temp = [pp_temp,PL_pass1_mat.pp(i)];
            mle_pr_temp(counter,:) = PL_pass1_mat.mle_pr(i,:);
        end
        
    end
    
    %% Pass 2 - include all
    
    PL_pass2_mat = load([load_file_location simulation_id '/' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_2' '.mat'],...
        'pr',...
        'pp',...
        'mle_pr');
    
    % if outside of CI bound then add to pr
    for i = 1:length(PL_pass2_mat.pr)
        counter = counter + 1;
        pr_temp = [pr_temp,PL_pass2_mat.pr(i)];
        pp_temp = [pp_temp,PL_pass2_mat.pp(i)];
        mle_pr_temp(counter,:) = PL_pass2_mat.mle_pr(i,:);
    end
    
    
    %% Sort by pr in ascending order
    
    [pr, pr_sort_index] = sort(pr_temp);
    pp =   pp_temp(pr_sort_index);
    mle_pr =  mle_pr_temp(pr_sort_index,:);
    
    
    %% Save
    
    save([filepath_save simulation_id '_profile_likelihood_'  num2str(parameters_to_profile_this_loop) '_' '3' '.mat'],'-v7.3',...
        'pr',...
        'pp',...
        'mle_pr');
    disp('File saved')
    
end





end


