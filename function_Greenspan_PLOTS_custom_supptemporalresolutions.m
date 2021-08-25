function function_Greenspan_PLOTS_custom_supptemporalresolutions

%% Figure save settings

folder_name = ['custom_plots' ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end

filepath_save_custom_plots = [pwd '\' folder_name '\'];

colours_to_plot_3 = [0.9290 0.6940 0.1250; ... %]	'#EDB120' % yellow
    0.8500 0.3250 0.0980 ;...	%'#D95319'	%orange
    0 0.4470 0.7410]; %	'#0072BD'	 % blue

colours_to_plot_4  = [0.9290 0.6940 0.1250; ... %]	'#EDB120' % yellow
    0.8500 0.3250 0.0980 ;...	%'#D95319'	%orange
    0 0.4470 0.7410; %	'#0072BD'	 % blue
    0.4940 0.1840 0.5560];	%'#7E2F8E' % purple

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FIGURES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% FigCustom_SuppTemporalResolutions_793_1250 - 793 1250


load_file_location = [pwd '/']; 

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[7931401,7931501,7931601,7931701]
        plot_counter=plot_counter+1;
        
        
        [simulation_id, ...
            data_file_to_use,...
            data_sheet_to_use,...
            p_lower_bounds,...
            p_upper_bounds,...
            p_first_guess,...
            times_to_use,...
            initial_condition,...
            filepath_save,...
            parameter_range_to_profile_custom,...
            parameter_range_to_profile]  ...
            = function_load_simulation_settings(simulation_num);
        
    % load .mat file with bounds
          load([load_file_location simulation_id '\' simulation_id '_exp_MLE1.mat'],...
            'p_lower_bounds',...
            'p_upper_bounds');
        
        % load mle
        
        load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
            'p_mle',...
            'nLLmin');
        
        
        
        load([load_file_location simulation_id '\' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_3' '.mat'],...
            'pr',...
            'pp',...
            'mle_pr');
        
        
        plot(pr,exp(-pp - -nLLmin),'color',colours_to_plot_4(plot_counter,:),"LineWidth",4); hold on; % profile likelihood
        hold on
        plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],'color',colours_to_plot_4(plot_counter,:),'LineStyle',":","LineWidth",2); % actual value
    end
    
    plot([p_lower_bounds(parameters_to_profile_this_loop),p_upper_bounds(parameters_to_profile_this_loop)],[0.15,0.15],"r:","LineWidth",2); % 95 percent confidence interval
    
    legend off
    
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
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_SuppTemporalResolutions_793_1250' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_1250' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_1250' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_1250' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end



%% FigCustom_SuppTemporalResolutions_793_5000 - 793 5000


load_file_location = [pwd '/']; 

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[7933401,7933501,7933601,7933701]
        plot_counter=plot_counter+1;
        
        
        [simulation_id, ...
            data_file_to_use,...
            data_sheet_to_use,...
            p_lower_bounds,...
            p_upper_bounds,...
            p_first_guess,...
            times_to_use,...
            initial_condition,...
            filepath_save,...
            parameter_range_to_profile_custom,...
            parameter_range_to_profile]  ...
            = function_load_simulation_settings(simulation_num);
        
    % load .mat file with bounds
          load([load_file_location simulation_id '\' simulation_id '_exp_MLE1.mat'],...
            'p_lower_bounds',...
            'p_upper_bounds');
        
        % load mle
        
        load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
            'p_mle',...
            'nLLmin');
        
        
        
        load([load_file_location simulation_id '\' simulation_id '_profile_likelihood_' num2str(parameters_to_profile_this_loop) '_3' '.mat'],...
            'pr',...
            'pp',...
            'mle_pr');
        
        
        plot(pr,exp(-pp - -nLLmin),'color',colours_to_plot_4(plot_counter,:),"LineWidth",4); hold on; % profile likelihood
        hold on
        plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],'color',colours_to_plot_4(plot_counter,:),'LineStyle',":","LineWidth",2); % actual value
    end
    
    plot([p_lower_bounds(parameters_to_profile_this_loop),p_upper_bounds(parameters_to_profile_this_loop)],[0.15,0.15],"r:","LineWidth",2); % 95 percent confidence interval
    
    legend off
    
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
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_SuppTemporalResolutions_793_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_SuppTemporalResolutions_793_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end


end

