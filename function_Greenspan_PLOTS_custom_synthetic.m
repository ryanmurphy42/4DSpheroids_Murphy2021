function function_Greenspan_PLOTS_custom_synthetic


%% Figure save settings


folder_name = ['custom_plots' ];
if ~exist([folder_name'], 'dir')
    mkdir([folder_name]);
end


filepath_save_custom_plots = [pwd '\' folder_name '\'];


p_mle_actual = [0.796637996793545;0.0449958112018849;0.153238188349895;254.366068313418;179.549533304352];

p_mle_actual_Ro = [0.796637996793545,0.0449958112018849,0.153238188349895,254.366068313418,125.4628; ...
    0.796637996793545,0.0449958112018849,0.153238188349895,254.366068313418,141.2811; ...
    0.796637996793545,0.0449958112018849,0.153238188349895,254.366068313418,179.549533304352; ...
    0.796637996793545,0.0449958112018849,0.153238188349895,254.366068313418,231.5020];


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

%% FigCustom_Fig2_793Syn_5000 - Figure 2 - temporal resolution


load_file_location = [pwd '/'];

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[717933103,717933303,717933203]
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
        
        
        plot(pr,exp(-pp - -nLLmin),'color',colours_to_plot_3(plot_counter,:),"LineWidth",4); hold on; % profile likelihood
        hold on
        plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],'color',colours_to_plot_3(plot_counter,:),'LineStyle',":","LineWidth",2); % actual value
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
    
    
    plot([p_mle_actual(parameters_to_profile_this_loop),p_mle_actual(parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_Fig2_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig2_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig2_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig2_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end


%% FigCustom_Fig3_793Syn_5000 - Figure 3 - O V O+N v O+N+F 793 5000


load_file_location = [pwd '/'];

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[717933103,717933102,717933101]
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
        
        
        plot(pr,exp(-pp - -nLLmin),'color',colours_to_plot_3(plot_counter,:),"LineWidth",4); hold on; % profile likelihood
        hold on
        plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],'color',colours_to_plot_3(plot_counter,:),'LineStyle',":","LineWidth",2); % actual value
        
        
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
    
    plot([p_mle_actual(parameters_to_profile_this_loop),p_mle_actual(parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_Fig3_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end




%% FigCustom_Fig4_793Syn_ - Synthetic data version of Figure 4 - comparing information gained from first 7 days


load_file_location = [pwd '/'];

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[747931901,747932901,747933901,747934901]
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
    
    plot([p_mle_actual_Ro(plot_counter,parameters_to_profile_this_loop),p_mle_actual_Ro(plot_counter,parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
    
    if parameters_to_profile_this_loop == 5
        plot([p_mle_actual_Ro(1,parameters_to_profile_this_loop),p_mle_actual_Ro(1,parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
        plot([p_mle_actual_Ro(2,parameters_to_profile_this_loop),p_mle_actual_Ro(2,parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
        plot([p_mle_actual_Ro(3,parameters_to_profile_this_loop),p_mle_actual_Ro(3,parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
    end
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_Fig4_793Syn_' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig4_793Syn_' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig4_793Syn_' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig4_793Syn_' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end


%% Fig6_experimentalmeanstd_v_mle_actual_formatted_ - For Figure 4 MLE - plot the experimental data v MLE v actual

plot_counter=0;
for simulation_num = [747931901,747932901,747933901,747934901]
    plot_counter=plot_counter+1;
    
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
    
    
    filepath_save_figs = [load_file_location simulation_id '\'];
    
    %% Plot
    
    
    time_measurements_Greenspan_plot = [time_measurements_all, max(max(time_measurements_full_array{1},24)),];
    
    
    figure
    function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_Greenspan_plot,p_mle,filepath_save_figs,3);
    errorbar(unique_time_measurements_full_array{1},...
        experimental_measurements_mean_per_timepoint_full_array{1},experimental_measurements_std_per_timepoint_full_array{1},'g','Linewidth',1,'Linestyle','none','marker','x')
    hold on
    errorbar(unique_time_measurements_full_array{2},...
        experimental_measurements_mean_per_timepoint_full_array{2},experimental_measurements_std_per_timepoint_full_array{2},'k','Linewidth',1,'Linestyle','none','marker','x')
    errorbar(unique_time_measurements_full_array{3},...
        experimental_measurements_mean_per_timepoint_full_array{3},experimental_measurements_std_per_timepoint_full_array{3},'m','Linewidth',1,'Linestyle','none','marker','x')
    legend('Outer','Necrotic','Inhibited','Location','northwest')
    xlim([0,max(24,max(time_measurements_Greenspan_plot))])
    ylim([0,max(400,max(y_measurements_full_array{1}))])
    box on
    grid on
    yticks([0,100,200,300,400])
    xticks([0,4,8,12,16,20])
    xlim([0,21])
    
    
    
    
    
    
    hold on
    function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_Greenspan_plot,p_mle_actual_Ro(plot_counter,:),filepath_save_figs,3);
    
    xlim([0,22])
    xticks([0,5,10,15,20])
    yticks([0,100,200,300,400])
    grid on
    legend off
    box on
    %Save figure
    saveas(gcf,[filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_actual_formatted_' num2str(plot_counter) '.pdf']);
    saveas(gcf, [filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_actual_formatted_' num2str(plot_counter) '.fig'])
    saveas(gcf, [filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_actual_formatted_' num2str(plot_counter) '.jpg'])
    
end



%% FigCustom_Fig3_793Syn_48_5000 - Figure 3 - O V O+N v O+N+F 793 5000 (48 measurements)


load_file_location = [pwd '/'];

for parameters_to_profile_this_loop = 1:5
    
    plot_counter=0;
    figure
    for simulation_num=[727933203,727933202,727933201]
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
        
        
        plot(pr,exp(-pp - -nLLmin),'color',colours_to_plot_3(plot_counter,:),"LineWidth",4); hold on; % profile likelihood
        hold on
        plot([p_mle(parameters_to_profile_this_loop),p_mle(parameters_to_profile_this_loop)],[0,2],'color',colours_to_plot_3(plot_counter,:),'LineStyle',":","LineWidth",2); % actual value
        
        
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
    
    plot([p_mle_actual(parameters_to_profile_this_loop),p_mle_actual(parameters_to_profile_this_loop)],[0,2],'color','k','LineStyle',":","LineWidth",4); % actual value
    
    ylim([0,1.2])
    box on
    grid on
    yticks([0,.25,.5,.75,1])
    
    %% Save Figure
    print(gcf,'-depsc2',[filepath_save_custom_plots  'FigCustom_Fig3_793Syn_48_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.eps']);
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_48_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood'  '.fig'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_48_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.jpg'])
    saveas(gcf, [filepath_save_custom_plots 'FigCustom_Fig3_793Syn_48_5000' num2str(parameters_to_profile_this_loop) '_Profile_likelihood' '.pdf'])
    
end



end

