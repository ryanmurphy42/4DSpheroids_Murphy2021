function  function_Greenspan_PLOTS_expdata_MLE(data_inclusions,time_measurements_all, y_measurements_all,...
    time_measurements_array, y_measurements_array,...
    filepath_save_figs,...
    unique_time_measurements_array,experimental_measurements_mean_per_timepoint_array,...
    experimental_measurements_std_per_timepoint_array,variable_id_measurements,...
    p_mle,time_measurements_full_array,y_measurements_full_array,unique_time_measurements_full_array,...
    experimental_measurements_mean_per_timepoint_full_array,experimental_measurements_std_per_timepoint_full_array,pooled_standard_deviation_all,...
    pooled_standard_deviation_outer,pooled_standard_deviation_necrotic,pooled_standard_deviation_inhibited)

%% CODE used to generate figures for a simulation number

% update times shown in plots
time_measurements_Greenspan_plot = [time_measurements_all, max(max(time_measurements_full_array{1},24)),];

%% Fig1_experimentalscatter - plot experimental measurements used for profiling

figure
hold on
if data_inclusions(1) == 1
    scatter(time_measurements_array{1},y_measurements_array{1},'g','filled')
end
if data_inclusions(2) == 1
    scatter(time_measurements_array{2},y_measurements_array{2},'k','filled')
end
if data_inclusions(3) == 1
    scatter(time_measurements_array{3},y_measurements_array{3},'m','filled')
end
title('Experimental measurements')
xlabel('Time (Days)')
ylabel('Radius')
legend('Experimental','Location','northwest')
ylim([0,400])
box on

xlim([0,22])
xticks([0,5,10,15,20])
yticks([0,100,200,300,400])
grid on
legend off

%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig1_experimentalscatter' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig1_experimentalscatter'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig1_experimentalscatter'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig1_experimentalscatter'  '.pdf'])


close

%% Fig2_experimentalmeanstd - plot experimental measurements used for profiling (mean +- standard deviation)

figure
hold on
if data_inclusions(1) == 1
    errorbar(unique_time_measurements_array{1},...
        experimental_measurements_mean_per_timepoint_array{1},experimental_measurements_std_per_timepoint_array{1},'g','Linewidth',1,'Linestyle','none','marker','x')
end
if data_inclusions(2) == 1
    errorbar(unique_time_measurements_array{2},...
        experimental_measurements_mean_per_timepoint_array{2},experimental_measurements_std_per_timepoint_array{2},'k','Linewidth',1,'Linestyle','none','marker','x')
end
if data_inclusions(3) == 1
    errorbar(unique_time_measurements_array{3},...
        experimental_measurements_mean_per_timepoint_array{3},experimental_measurements_std_per_timepoint_array{3},'m','Linewidth',1,'Linestyle','none','marker','x')
end
title('Experimental measurements: mean +- standard deviation')
xlabel('time')
ylabel('radius')
legend('Experimental','Location','northwest')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])
ylim([0,max(400,max(y_measurements_full_array{1}))])


xlim([0,22])
xticks([0,5,10,15,20])
yticks([0,100,200,300,400])
grid on
legend off
box on


%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig2_experimentalmeanstd' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig2_experimentalmeanstd'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig2_experimentalmeanstd'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig2_experimentalmeanstd'  '.pdf'])

close

%% Fig3_experimentalscatter_v_mle - plot experimental measurements used for profiling (scatter) vs mle


figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_Greenspan_plot,p_mle,filepath_save_figs,3);
hold on
if data_inclusions(1) == 1
    scatter(time_measurements_array{1},y_measurements_array{1},'g','filled')
end
if data_inclusions(2) == 1
    scatter(time_measurements_array{2},y_measurements_array{2},'k','filled')
end
if data_inclusions(3) == 1
    scatter(time_measurements_array{3},y_measurements_array{3},'m','filled')
end
legend('Outer','Necrotic','Inhibited','Location','northwest')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])
ylim([0,max(400,max(y_measurements_full_array{1}))])


xlim([0,22])
xticks([0,5,10,15,20])
yticks([0,100,200,300,400])
grid on
legend off
box on

%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig3_experimentalscatter_v_mle' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig3_experimentalscatter_v_mle'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig3_experimentalscatter_v_mle'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig3_experimentalscatter_v_mle'  '.pdf'])

close

%% Fig4_experimentalmeanstd_v_mle_formatted - plot experimental measurements used for profiling (mean+-std) vs mle

figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_Greenspan_plot,p_mle,filepath_save_figs,3);
hold on
if data_inclusions(1) == 1
    errorbar(unique_time_measurements_array{1},...
        experimental_measurements_mean_per_timepoint_array{1},experimental_measurements_std_per_timepoint_array{1},'g','Linewidth',1,'Linestyle','none','marker','x')
end
if data_inclusions(2) == 1
    errorbar(unique_time_measurements_array{2},...
        experimental_measurements_mean_per_timepoint_array{2},experimental_measurements_std_per_timepoint_array{2},'k','Linewidth',1,'Linestyle','none','marker','x')
end
if data_inclusions(3) == 1
    errorbar(unique_time_measurements_array{3},...
        experimental_measurements_mean_per_timepoint_array{3},experimental_measurements_std_per_timepoint_array{3},'m','Linewidth',1,'Linestyle','none','marker','x')
end
legend('Outer','Necrotic','Inhibited','Location','northwest')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])
ylim([0,max(400,max(y_measurements_full_array{1}))])
box on
grid on
yticks([0,100,200,300,400])
xticks([0,5,10,15,20])
xlim([0,22])
ylim([0,400])
legend off
%Save figure
saveas(gcf, [filepath_save_figs  'Fig4_experimentalmeanstd_v_mle_formatted'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig4_experimentalmeanstd_v_mle_formatted'  '.pdf'])
saveas(gcf, [filepath_save_figs  'Fig4_experimentalmeanstd_v_mle_formatted'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig4_experimentalmeanstd_v_mle_formatted'  '.pdf'])

close



%% FIGURES 3 AND 4 REPEATED USING FULL EXPERIMENTAL DATA (Fig5_experimentalscatter_v_mle and Fig6_experimentalmeanstd_v_mle)

%% Fig5_experimentalscatter_v_mle - experimental measurements (scatter) vs mle



figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_Greenspan_plot,p_mle,filepath_save_figs,3);
scatter(time_measurements_full_array{1},y_measurements_full_array{1},'g','filled')
hold on
scatter(time_measurements_full_array{2},y_measurements_full_array{2},'k','filled')
scatter(time_measurements_full_array{3},y_measurements_full_array{3},'m','filled')
legend('Outer','Necrotic','Inhibited','Location','northwest')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])
ylim([0,max(400,max(y_measurements_full_array{1}))])

xlim([0,22])
xticks([0,5,10,15,20])
yticks([0,100,200,300,400])
grid on
legend off
box on

%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig5_experimentalscatter_v_mle' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig5_experimentalscatter_v_mle'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig5_experimentalscatter_v_mle'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig5_experimentalscatter_v_mle'  '.pdf'])

close

%% Fig6_experimentalmeanstd_v_mle_formatted - experimental measurements ( mean +- std ) vs mle

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


box on

xlim([0,22])
xticks([0,5,10,15,20])
yticks([0,100,200,300,400])
grid on
legend off
box on

%Save figure
saveas(gcf,[filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_formatted' '.pdf']);
saveas(gcf, [filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_formatted'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig6_experimentalmeanstd_v_mle_formatted'  '.jpg'])
close

%% Fig7_evolution_of_standard_deviation_data_used  - plot standard deviation over time ( comparing all vs outer vs necrotic vs inhibited) - data used for profiling

figure
plot(unique_time_measurements_array{1},experimental_measurements_std_per_timepoint_array{1},'g','Linewidth',1,'Linestyle','none','marker','x')
hold on
plot(unique_time_measurements_array{2},experimental_measurements_std_per_timepoint_array{2},'k','Linewidth',1,'Linestyle','none','marker','x')
plot(unique_time_measurements_array{3},experimental_measurements_std_per_timepoint_array{3},'m','Linewidth',1,'Linestyle','none','marker','x')

plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_outer,pooled_standard_deviation_outer], 'g','Linewidth',1);

plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_necrotic,pooled_standard_deviation_necrotic], 'k','Linewidth',1);

plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_inhibited,pooled_standard_deviation_inhibited], 'm','Linewidth',1);


legend('Outer', 'Necrotic', 'inhibited','All','Location','NorthWest')
title('Evolution of standard deviation')
xlabel('time')
ylabel('standard deviation')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])

xlim([0,22])
xticks([0,5,10,15,20])
grid on
legend off
box on

%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig7_evolution_of_standard_deviation_data_used' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig7_evolution_of_standard_deviation_data_used'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig7_evolution_of_standard_deviation_data_used'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig7_evolution_of_standard_deviation_data_used'  '.pdf'])

close



%% Fig7a_evolution_of_standard_deviation_full_data  - plot standard deviation over time ( comparing all vs outer vs necrotic vs inhibited) - all data

figure
plot(unique_time_measurements_full_array{1},experimental_measurements_std_per_timepoint_full_array{1},'g','Linewidth',1,'Linestyle','none','marker','x')
hold on
plot(unique_time_measurements_full_array{2},experimental_measurements_std_per_timepoint_full_array{2},'k','Linewidth',1,'Linestyle','none','marker','x')
plot(unique_time_measurements_full_array{3},experimental_measurements_std_per_timepoint_full_array{3},'m','Linewidth',1,'Linestyle','none','marker','x')


plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_outer,pooled_standard_deviation_outer], 'g','Linewidth',1);

plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_necrotic,pooled_standard_deviation_necrotic], 'k','Linewidth',1);

plot([0,...
    max(time_measurements_Greenspan_plot)],...
    [pooled_standard_deviation_inhibited,pooled_standard_deviation_inhibited], 'm','Linewidth',1);


legend('Outer', 'Necrotic', 'inhibited','All','Location','NorthWest')
title('Evolution of standard deviation')
xlabel('time')
ylabel('standard deviation')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])

xlim([0,22])
xticks([0,5,10,15,20])
grid on
legend off
box on


%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig7a_evolution_of_standard_deviation_full_data' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig7a_evolution_of_standard_deviation_full_data'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig7a_evolution_of_standard_deviation_full_data'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig7a_evolution_of_standard_deviation_full_data'  '.pdf'])

close



%% Fig8_residuals - Plot absolute residual compared to MLE (only using data points used for profiling)

% determine MLE of Greenspan

% sum up absolute residuals for outer, necrotic, inhibited, all
[greenspan_values] = function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle,filepath_save_figs,0);

% y_measurements_all

len_y_measurements_all = length(y_measurements_all);
absolute_residual = inf*ones(len_y_measurements_all,1);

for i=1:len_y_measurements_all
    
    absolute_residual(i) = abs(y_measurements_all(i) - greenspan_values(i));
    
end

% sum unique times
unique_time_measurements_all = unique(time_measurements_all);
len_unique_time_measurements_all = length(unique_time_measurements_all);

sum_absolute_residual = zeros(len_unique_time_measurements_all,1);
sum_absolute_residual_outer = zeros(len_unique_time_measurements_all,1);
sum_absolute_residual_necrotic = zeros(len_unique_time_measurements_all,1);
sum_absolute_residual_fucci = zeros(len_unique_time_measurements_all,1);

for j=1:len_unique_time_measurements_all
    
    times_to_include = (time_measurements_all == unique_time_measurements_all(j));
    
    
    sum_absolute_residual(j) = sum(absolute_residual(times_to_include));
    
    indicator_outer = (variable_id_measurements == 1);
    indicator_necrotic = (variable_id_measurements == 2);
    indicator_fucci = (variable_id_measurements == 3);
    
    sum_absolute_residual_outer_loop = 0;
    sum_absolute_residual_necrotic_loop = 0;
    sum_absolute_residual_fucci_loop = 0;
    
    for k=1:len_y_measurements_all
        if times_to_include(k) == 1
            if indicator_outer(k) == 1
                sum_absolute_residual_outer_loop = sum_absolute_residual_outer_loop + absolute_residual(k) ;
            end
            if indicator_necrotic(k) == 1
                sum_absolute_residual_necrotic_loop = sum_absolute_residual_necrotic_loop + absolute_residual(k);
            end
            if indicator_fucci(k) == 1
                sum_absolute_residual_fucci_loop = sum_absolute_residual_fucci_loop + absolute_residual(k);
            end
        end
    end
    
    sum_absolute_residual_outer(j) = sum_absolute_residual_outer_loop;
    sum_absolute_residual_necrotic(j) = sum_absolute_residual_necrotic_loop;
    sum_absolute_residual_fucci(j) = sum_absolute_residual_fucci_loop;
    
end




figure
hold on
% outer
plot(unique_time_measurements_all,sum_absolute_residual_outer,'g','Linewidth',1,'marker','x')
% necrotic
plot(unique_time_measurements_all,sum_absolute_residual_necrotic,'k','Linewidth',1,'marker','x')
% inhibited
plot(unique_time_measurements_all,sum_absolute_residual_fucci,'m','Linewidth',1,'marker','x')
% all
plot(unique_time_measurements_all,sum_absolute_residual,'y--','Linewidth',1,'marker','x')

title('Sum of absolute residuals')
xlabel('time')
ylabel('Sum of absolute residuals')
legend('outer','necrotic','inhibited','all')
xlim([0,max(24,max(time_measurements_Greenspan_plot))])
box on
xlim([0,22])
xticks([0,5,10,15,20])

%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'Fig8_residuals' '.eps']);
saveas(gcf, [filepath_save_figs  'Fig8_residuals'  '.fig'])
saveas(gcf, [filepath_save_figs  'Fig8_residuals'  '.jpg'])
saveas(gcf, [filepath_save_figs  'Fig8_residuals'  '.pdf'])

close


end