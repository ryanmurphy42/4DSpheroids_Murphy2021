function function_Greenspan_generate_synthetic_data

%% Generate synthetic data files

%% Reset matlab

clear
clc

%% Load the MLE


simulation_num=7933301;
parameters_to_profile=1;
section_to_run=1;


disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
disp(['section_to_run is ' num2str(section_to_run)])
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


filepath_save = [pwd '\'];

%% Generate 10 measurements of each type every 0.5 days from Day 0 to Day 20

number_measurements_per_timepoint = 10;

time_measure =  0:0.5:20;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle);

% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata1_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata1_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata1_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off



%% Generate 48 measuremetns of each type every 0.5 days from Day 0 to Day 20


number_measurements_per_timepoint = 48;

time_measure =  0:0.5:20;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle);


% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata2_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata2_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata2_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Role of initial condition:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear
clc

%% For 1250, 2500, 5000, 10000

% Calculate initial outer radius for different spheroid sizes - assuming spherical symmetry


load_file_location = [pwd '\'];

simulation_id = 'Sim7931301';
mle_1250  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');

simulation_id = 'Sim7932301';
mle_2500  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');


simulation_id = 'Sim7933301';
mle_5000  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');


simulation_id = 'Sim7934301';
mle_10000  = load([load_file_location simulation_id '\' simulation_id '_exp_MLE3.mat'],...
    'p_mle');

R0_1250  = mle_1250.p_mle(5);
R0_2500  = mle_2500.p_mle(5);
R0_5000  = mle_5000.p_mle(5);
R0_10000 = mle_10000.p_mle(5);



simulation_num=7933301;
parameters_to_profile=1;
section_to_run=1;


disp(['simulation_num is ' num2str(simulation_num)])
disp(['parameters_to_profile is ' num2str(parameters_to_profile)])
disp(['section_to_run is ' num2str(section_to_run)])
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


filepath_save = [pwd '\'];


p_mle_1250 = p_mle;
p_mle_1250(5) = R0_1250;

p_mle_2500 = p_mle;
p_mle_2500(5) = R0_2500;

p_mle_5000 = p_mle;
p_mle_5000(5) = R0_5000;

p_mle_10000 = p_mle;
p_mle_10000(5) = R0_10000;

% Generate synthetic data for Days 0, 1, 2, 3, 4, 5, 6, 7 - 10 measurements of each type

%% 1250

number_measurements_per_timepoint = 10;

time_measure =  0:0.5:7;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle_1250);


% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 1250*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_1250_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 1250*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_1250_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 1250*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_1250_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_1250,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off
close

% Save figure
filepath_save_figs =[pwd '\'];

figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_1250,'',3)
title('Experimental measurements')
xlabel('Time (Days)')
ylabel('Radius')

ylim([0,max(400,max(y_measurements_full_array{1}))])
legend('Experimental','Location','northwest')
ylim([0,400])
box on

xlim([0,7])
xticks([0,1,2,3,4,5,6,7])
yticks([0,100,200,300,400])
grid on
legend off
%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'FigSyn4_1250_cts' '.eps']);
saveas(gcf, [filepath_save_figs  'FigSyn4_1250_cts'  '.fig'])
saveas(gcf, [filepath_save_figs  'FigSyn4_1250_cts'  '.jpg'])
saveas(gcf, [filepath_save_figs  'FigSyn4_1250_cts'  '.pdf'])


close




%% 2500

number_measurements_per_timepoint = 10;

time_measure =  0:0.5:7;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle_2500);


% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 2500*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_2500_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 2500*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_2500_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 2500*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_2500_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_2500,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off

% Save figure
filepath_save_figs =[pwd '\'];

figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_2500,'',3)
title('Experimental measurements')
xlabel('Time (Days)')
ylabel('Radius')

ylim([0,max(400,max(y_measurements_full_array{1}))])
legend('Experimental','Location','northwest')
ylim([0,400])
box on

xlim([0,7])
xticks([0,1,2,3,4,5,6,7])
yticks([0,100,200,300,400])
grid on
legend off
%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'FigSyn4_2500_cts' '.eps']);
saveas(gcf, [filepath_save_figs  'FigSyn4_2500_cts'  '.fig'])
saveas(gcf, [filepath_save_figs  'FigSyn4_2500_cts'  '.jpg'])
saveas(gcf, [filepath_save_figs  'FigSyn4_2500_cts'  '.pdf'])


close


%% 5000


number_measurements_per_timepoint = 10;

time_measure =  0:0.5:7;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle_5000);


% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_5000_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_5000_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 5000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_5000_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_5000,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off


% Save figure
filepath_save_figs =[pwd '\'];

figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_5000,'',3)
title('Experimental measurements')
xlabel('Time (Days)')
ylabel('Radius')

ylim([0,max(400,max(y_measurements_full_array{1}))])
legend('Experimental','Location','northwest')
ylim([0,400])
box on

xlim([0,7])
xticks([0,1,2,3,4,5,6,7])
yticks([0,100,200,300,400])
grid on
legend off
%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'FigSyn4_5000_cts' '.eps']);
saveas(gcf, [filepath_save_figs  'FigSyn4_5000_cts'  '.fig'])
saveas(gcf, [filepath_save_figs  'FigSyn4_5000_cts'  '.jpg'])
saveas(gcf, [filepath_save_figs  'FigSyn4_5000_cts'  '.pdf'])


close

%% 10000


number_measurements_per_timepoint = 10;

time_measure =  0:0.5:7;

variable_id_measurements = [ones(length(time_measure)*number_measurements_per_timepoint,1);2*ones(length(time_measure)*number_measurements_per_timepoint,1);3*ones(length(time_measure)*number_measurements_per_timepoint,1)];
time_measurements_all = repmat(time_measure,1,3*number_measurements_per_timepoint)';

[synthetic_measurements_all] = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p_mle_10000);


% Add noise to measurements
rng('default')
synthetic_measurements_all(variable_id_measurements==1) = synthetic_measurements_all(variable_id_measurements==1) +  normrnd(0,pooled_standard_deviation_outer,length(synthetic_measurements_all(variable_id_measurements==1)),1);
synthetic_measurements_all(variable_id_measurements==3) = synthetic_measurements_all(variable_id_measurements==3) +  normrnd(0,pooled_standard_deviation_inhibited,length(synthetic_measurements_all(variable_id_measurements==3)),1);
synthetic_measurements_all(variable_id_measurements==2) = synthetic_measurements_all(variable_id_measurements==2) +  normrnd(0,pooled_standard_deviation_necrotic,length(synthetic_measurements_all(variable_id_measurements==2)),1);


synthetic_measurements_all(synthetic_measurements_all<0) = 0;

% Save outer radius data

Day = 4 + time_measurements_all(variable_id_measurements==1);
Radius = synthetic_measurements_all(variable_id_measurements==1);
InitialCondition = 10000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_10000_outer' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save inhibited radius data

Day = 4 + time_measurements_all(variable_id_measurements==3);
Radius = synthetic_measurements_all(variable_id_measurements==3);
InitialCondition = 10000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_10000_inhibited' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');

% Save necrotic radius data

Day = 4+  time_measurements_all(variable_id_measurements==2);
Radius = synthetic_measurements_all(variable_id_measurements==2);
InitialCondition = 10000*ones(length(Radius),1);

save([filepath_save 'WM793b_syntheticdata4_10000_necrotic' '.mat'],'-v7.3',...
    'Day',...
    'Radius',...
    'InitialCondition');



% Plot check
figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_10000,'',3)
hold on
scatter(time_measurements_all(variable_id_measurements==1),synthetic_measurements_all(variable_id_measurements==1),'g')
scatter(time_measurements_all(variable_id_measurements==3),synthetic_measurements_all(variable_id_measurements==3),'m')
scatter(time_measurements_all(variable_id_measurements==2),synthetic_measurements_all(variable_id_measurements==2),'k')
ylim([0,400])
legend off

% Save figure
filepath_save_figs =[pwd '\'];

figure
function_Greenspan_model_fmincon_v1(variable_id_measurements,time_measurements_all,p_mle_10000,'',3)
title('Experimental measurements')
xlabel('Time (Days)')
ylabel('Radius')

ylim([0,max(400,max(y_measurements_full_array{1}))])
legend('Experimental','Location','northwest')
ylim([0,400])
box on

xlim([0,7])
xticks([0,1,2,3,4,5,6,7])
yticks([0,100,200,300,400])
grid on
legend off
%Save figure
print(gcf,'-depsc2',[filepath_save_figs  'FigSyn4_10000_cts' '.eps']);
saveas(gcf, [filepath_save_figs  'FigSyn4_10000_cts'  '.fig'])
saveas(gcf, [filepath_save_figs  'FigSyn4_10000_cts'  '.jpg'])
saveas(gcf, [filepath_save_figs  'FigSyn4_10000_cts'  '.pdf'])


close




end