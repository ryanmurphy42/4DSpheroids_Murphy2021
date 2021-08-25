function function_Greenspan_PLOTS_profile_likelihoods(pr,pp,mle_pr,parameters_to_profile_this_loop,...
    filepath_save,p_mle,pooled_standard_deviation_all,nLLmin,p_lower_bounds,p_upper_bounds)


%% Plot profile likelihood
figure
plot(pr, exp(nLLmin-pp),'-*',"LineWidth",2); hold on;
plot([p_lower_bounds(parameters_to_profile_this_loop),p_upper_bounds(parameters_to_profile_this_loop)],[0.15,0.15],"r:","LineWidth",2); % 95 percent confidence interval
plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],"k:","LineWidth",2); % actual value
ylabel("Profile likelihood");

% legend("Profile","95 percent","MLE");

if parameters_to_profile_this_loop == 1
    xlabel('Q: oxygen and waste')
    
elseif parameters_to_profile_this_loop == 2
    xlabel('gamma: death')
    
elseif parameters_to_profile_this_loop == 3
    xlabel('s: prolif')
    
elseif parameters_to_profile_this_loop == 4
    xlabel('Rc: outer radius when nec forms')
    
elseif parameters_to_profile_this_loop == 5
    xlabel('Ro: initial outer radius')
    
end

xlim([0,max(pr)])


%% Save figure

print(gcf,'-depsc2',[filepath_save  'FigP' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
saveas(gcf, [filepath_save 'FigP' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
saveas(gcf, [filepath_save 'FigP' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
saveas(gcf, [filepath_save 'FigP' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])


close

%% Plot how mle varies

label_variables = ["Q: oxygen and waste";"gamma: death";"s: prolif";"Rc: outer radius when nec forms";"Ro: initial outer radius"];


if parameters_to_profile_this_loop == 1
    
    parameter_ids_mle_change_to_plot = [1,2,3,4,5];
    
elseif parameters_to_profile_this_loop == 2
    
    parameter_ids_mle_change_to_plot = [2,1,3,4,5];
    
elseif parameters_to_profile_this_loop == 3
    parameter_ids_mle_change_to_plot = [3,1,2,4,5];
    
elseif parameters_to_profile_this_loop == 4
    parameter_ids_mle_change_to_plot = [4,1,2,3,5];
    
elseif parameters_to_profile_this_loop == 5
    parameter_ids_mle_change_to_plot = [5,1,2,3,4];
    
end


xlabel_val = label_variables(parameter_ids_mle_change_to_plot(1));
ylabel_val_1 = label_variables(parameter_ids_mle_change_to_plot(2));
ylabel_val_2 = label_variables(parameter_ids_mle_change_to_plot(3));
ylabel_val_3 = label_variables(parameter_ids_mle_change_to_plot(4));
ylabel_val_4 = label_variables(parameter_ids_mle_change_to_plot(5));


x_mle_pr = mle_pr(:,parameter_ids_mle_change_to_plot(1));
y_mle_pr_val_1 = mle_pr(:,parameter_ids_mle_change_to_plot(2));
y_mle_pr_val_2 = mle_pr(:,parameter_ids_mle_change_to_plot(3));
y_mle_pr_val_3 = mle_pr(:,parameter_ids_mle_change_to_plot(4));
y_mle_pr_val_4 = mle_pr(:,parameter_ids_mle_change_to_plot(5));



% Plots
figure
plot(x_mle_pr,y_mle_pr_val_1,'-*',"LineWidth",2)
xlabel(xlabel_val)
ylabel(ylabel_val_1)

print(gcf,'-depsc2',[filepath_save  'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_' num2str(parameter_ids_mle_change_to_plot(2)) '.eps']);
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(2)) '.fig'])
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(2)) '.jpg'])

close


% Plot
figure
plot(x_mle_pr,y_mle_pr_val_2,'-*',"LineWidth",2)
xlabel(xlabel_val)
ylabel(ylabel_val_2)

print(gcf,'-depsc2',[filepath_save  'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_' num2str(parameter_ids_mle_change_to_plot(3)) '.eps']);
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(3)) '.fig'])
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(3)) '.jpg'])

close

%

figure
plot(x_mle_pr,y_mle_pr_val_3,'-*',"LineWidth",2)
xlabel(xlabel_val)
ylabel(ylabel_val_3)

print(gcf,'-depsc2',[filepath_save  'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_' num2str(parameter_ids_mle_change_to_plot(4)) '.eps']);
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(4)) '.fig'])
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(4)) '.jpg'])

close

%

figure
plot(x_mle_pr,y_mle_pr_val_4,'-*',"LineWidth",2)
xlabel(xlabel_val)
ylabel(ylabel_val_4)

print(gcf,'-depsc2',[filepath_save  'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_' num2str(parameter_ids_mle_change_to_plot(5)) '.eps']);
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(5)) '.fig'])
saveas(gcf, [filepath_save 'FigPA' num2str(parameters_to_profile_this_loop) '_Profile_likelihood_mle_change_'  num2str(parameter_ids_mle_change_to_plot(5)) '.jpg'])

close


end
