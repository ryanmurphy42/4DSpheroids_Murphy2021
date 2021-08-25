function  [simulation_id, ...
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
    = function_load_simulation_settings(simulation_num)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WM793b
if	simulation_num == 7933101
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x1xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;3;8;12;17];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For exp data and MLE
    simulation_id = 'Sim7933101';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933102
    
    % For exp data and MLE
    simulation_id = 'Sim7933102';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933103
    
    % For exp data and MLE
    simulation_id = 'Sim7933103';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931101
    
    % For exp data and MLE
    simulation_id = 'Sim7931101';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931102
    
    % For exp data and MLE
    simulation_id = 'Sim7931102';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931103
    
    % For exp data and MLE
    simulation_id = 'Sim7931103';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932101
    
    % For exp data and MLE
    simulation_id = 'Sim7932101';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932102
    
    % For exp data and MLE
    simulation_id = 'Sim7932102';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932103
    
    % For exp data and MLE
    simulation_id = 'Sim7932103';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934101
    
    % For exp data and MLE
    simulation_id = 'Sim7934101';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934102
    
    % For exp data and MLE
    simulation_id = 'Sim7934102';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934103
    
    % For exp data and MLE
    simulation_id = 'Sim7934103';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x2xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;3;6;8;10;12;14;17;19];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif	simulation_num == 7933201
    
    % For exp data and MLE
    simulation_id = 'Sim7933201';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933202
    
    % For exp data and MLE
    simulation_id = 'Sim7933202';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933203
    
    % For exp data and MLE
    simulation_id = 'Sim7933203';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931201
    
    % For exp data and MLE
    simulation_id = 'Sim7931201';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931202
    
    % For exp data and MLE
    simulation_id = 'Sim7931202';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931203
    
    % For exp data and MLE
    simulation_id = 'Sim7931203';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932201
    
    % For exp data and MLE
    simulation_id = 'Sim7932201';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932202
    
    % For exp data and MLE
    simulation_id = 'Sim7932202';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932203
    
    % For exp data and MLE
    simulation_id = 'Sim7932203';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934201
    
    % For exp data and MLE
    simulation_id = 'Sim7934201';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934202
    
    % For exp data and MLE
    simulation_id = 'Sim7934202';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934203
    
    % For exp data and MLE
    simulation_id = 'Sim7934203';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x3xx  %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times  [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
elseif	simulation_num == 7933301
    
    % For exp data and MLE
    simulation_id = 'Sim7933301';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933302
    
    % For exp data and MLE
    simulation_id = 'Sim7933302';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933303
    
    % For exp data and MLE
    simulation_id = 'Sim7933303';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931301
    
    % For exp data and MLE
    simulation_id = 'Sim7931301';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931302
    
    % For exp data and MLE
    simulation_id = 'Sim7931302';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931303
    
    % For exp data and MLE
    simulation_id = 'Sim7931303';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932301
    
    % For exp data and MLE
    simulation_id = 'Sim7932301';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932302
    
    % For exp data and MLE
    simulation_id = 'Sim7932302';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932303
    
    % For exp data and MLE
    simulation_id = 'Sim7932303';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934301
    
    % For exp data and MLE
    simulation_id = 'Sim7934301';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934302
    
    % For exp data and MLE
    simulation_id = 'Sim7934302';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934303
    
    % For exp data and MLE
    simulation_id = 'Sim7934303';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WM983b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if	simulation_num == 9833101
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 983x1xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;3;8;12;16];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For exp data and MLE
    simulation_id = 'Sim9833101';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9833102
    
    % For exp data and MLE
    simulation_id = 'Sim9833102';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9833103
    
    % For exp data and MLE
    simulation_id = 'Sim9833103';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 9831101
    
    % For exp data and MLE
    simulation_id = 'Sim9831101';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9831102
    
    % For exp data and MLE
    simulation_id = 'Sim9831102';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9831103
    
    % For exp data and MLE
    simulation_id = 'Sim9831103';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 9832101
    
    % For exp data and MLE
    simulation_id = 'Sim9832101';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9832102
    
    % For exp data and MLE
    simulation_id = 'Sim9832102';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9832103
    
    % For exp data and MLE
    simulation_id = 'Sim9832103';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 9834101
    
    % For exp data and MLE
    simulation_id = 'Sim9834101';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9834102
    
    % For exp data and MLE
    simulation_id = 'Sim9834102';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9834103
    
    % For exp data and MLE
    simulation_id = 'Sim9834103';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;8;12;16];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 983x2xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;3;5;8;10;12;14;16;18];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif	simulation_num == 9833201
    
    % For exp data and MLE
    simulation_id = 'Sim9833201';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9833202
    
    % For exp data and MLE
    simulation_id = 'Sim9833202';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9833203
    
    % For exp data and MLE
    simulation_id = 'Sim9833203';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 9831201
    
    % For exp data and MLE
    simulation_id = 'Sim9831201';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9831202
    
    % For exp data and MLE
    simulation_id = 'Sim9831202';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9831203
    
    % For exp data and MLE
    simulation_id = 'Sim9831203';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 9832201
    
    % For exp data and MLE
    simulation_id = 'Sim9832201';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9832202
    
    % For exp data and MLE
    simulation_id = 'Sim9832202';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9832203
    
    % For exp data and MLE
    simulation_id = 'Sim9832203';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 9834201
    
    % For exp data and MLE
    simulation_id = 'Sim9834201';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9834202
    
    % For exp data and MLE
    simulation_id = 'Sim9834202';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9834203
    
    % For exp data and MLE
    simulation_id = 'Sim9834203';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;3;5;8;10;12;14;16;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 983x3xx  %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times  [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
elseif	simulation_num == 9833301
    
    % For exp data and MLE
    simulation_id = 'Sim9833301';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9833302
    
    % For exp data and MLE
    simulation_id = 'Sim9833302';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9833303
    
    % For exp data and MLE
    simulation_id = 'Sim9833303';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 9831301
    
    % For exp data and MLE
    simulation_id = 'Sim9831301';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9831302
    
    % For exp data and MLE
    simulation_id = 'Sim9831302';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9831303
    
    % For exp data and MLE
    simulation_id = 'Sim9831303';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 9832301
    
    % For exp data and MLE
    simulation_id = 'Sim9832301';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9832302
    
    % For exp data and MLE
    simulation_id = 'Sim9832302';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9832303
    
    % For exp data and MLE
    simulation_id = 'Sim9832303';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 9834301
    
    % For exp data and MLE
    simulation_id = 'Sim9834301';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 9834302
    
    % For exp data and MLE
    simulation_id = 'Sim9834302';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 9834303
    
    % For exp data and MLE
    simulation_id = 'Sim9834303';
    
    data_file_to_use_array{1} = 'WM983b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM983b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM983b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Supplementary experimental designs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if	simulation_num == 7933401
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x4xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;2;3];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For exp data and MLE
    simulation_id = 'Sim7933401';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =  [1;2;3];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933402
    
    % For exp data and MLE
    simulation_id = 'Sim7933402';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933403
    
    % For exp data and MLE
    simulation_id = 'Sim7933403';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931401
    
    % For exp data and MLE
    simulation_id = 'Sim7931401';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.84;0.011;0.13;250.3;126];
    times_to_use =   [1;2;3];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931402
    
    % For exp data and MLE
    simulation_id = 'Sim7931402';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.84;0.011;0.13;250.3;126];
    times_to_use =   [1;2;3];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931403
    
    % For exp data and MLE
    simulation_id = 'Sim7931403';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.84;0.011;0.13;250.3;126];
    times_to_use =   [1;2;3];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932401
    
    % For exp data and MLE
    simulation_id = 'Sim7932401';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932402
    
    % For exp data and MLE
    simulation_id = 'Sim7932402';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932403
    
    % For exp data and MLE
    simulation_id = 'Sim7932403';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934401
    
    % For exp data and MLE
    simulation_id = 'Sim7934401';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934402
    
    % For exp data and MLE
    simulation_id = 'Sim7934402';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934403
    
    % For exp data and MLE
    simulation_id = 'Sim7934403';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x5xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [1;2;3;4;5;6;7;8;9;10];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif	simulation_num == 7933501
    
    % For exp data and MLE
    simulation_id = 'Sim7933501';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933502
    
    % For exp data and MLE
    simulation_id = 'Sim7933502';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933503
    
    % For exp data and MLE
    simulation_id = 'Sim7933503';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931501
    
    % For exp data and MLE
    simulation_id = 'Sim7931501';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931502
    
    % For exp data and MLE
    simulation_id = 'Sim7931502';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931503
    
    % For exp data and MLE
    simulation_id = 'Sim7931503';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932501
    
    % For exp data and MLE
    simulation_id = 'Sim7932501';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932502
    
    % For exp data and MLE
    simulation_id = 'Sim7932502';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932503
    
    % For exp data and MLE
    simulation_id = 'Sim7932503';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934501
    
    % For exp data and MLE
    simulation_id = 'Sim7934501';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934502
    
    % For exp data and MLE
    simulation_id = 'Sim7934502';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934503
    
    % For exp data and MLE
    simulation_id = 'Sim7934503';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;2;3;4;5;6;7;8;9;10];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x6xx  %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times  [10;11;12;13;14;15;16;17;18;19];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
elseif	simulation_num == 7933601
    
    % For exp data and MLE
    simulation_id = 'Sim7933601';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933602
    
    % For exp data and MLE
    simulation_id = 'Sim7933602';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933603
    
    % For exp data and MLE
    simulation_id = 'Sim7933603';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931601
    
    % For exp data and MLE
    simulation_id = 'Sim7931601';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931602
    
    % For exp data and MLE
    simulation_id = 'Sim7931602';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931603
    
    % For exp data and MLE
    simulation_id = 'Sim7931603';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932601
    
    % For exp data and MLE
    simulation_id = 'Sim7932601';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932602
    
    % For exp data and MLE
    simulation_id = 'Sim7932602';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932603
    
    % For exp data and MLE
    simulation_id = 'Sim7932603';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934601
    
    % For exp data and MLE
    simulation_id = 'Sim7934601';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934602
    
    % For exp data and MLE
    simulation_id = 'Sim7934602';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934603
    
    % For exp data and MLE
    simulation_id = 'Sim7934603';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [10;11;12;13;14;15;16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x7xx %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times [16;17;18;19];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif	simulation_num == 7933701
    
    % For exp data and MLE
    simulation_id = 'Sim7933701';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933702
    
    % For exp data and MLE
    simulation_id = 'Sim7933702';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933703
    
    % For exp data and MLE
    simulation_id = 'Sim7933703';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931701
    
    % For exp data and MLE
    simulation_id = 'Sim7931701';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931702
    
    % For exp data and MLE
    simulation_id = 'Sim7931702';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931703
    
    % For exp data and MLE
    simulation_id = 'Sim7931703';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932701
    
    % For exp data and MLE
    simulation_id = 'Sim7932701';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932702
    
    % For exp data and MLE
    simulation_id = 'Sim7932702';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932703
    
    % For exp data and MLE
    simulation_id = 'Sim7932703';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934701
    
    % For exp data and MLE
    simulation_id = 'Sim7934701';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934702
    
    % For exp data and MLE
    simulation_id = 'Sim7934702';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934703
    
    % For exp data and MLE
    simulation_id = 'Sim7934703';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [16;17;18;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% 793x8xx  %% 5000, 1250, 2500, 10000 - o VS o+n VS o+n+f , measurement times  [1;19];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
elseif	simulation_num == 7933801
    
    % For exp data and MLE
    simulation_id = 'Sim7933801';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7933802
    
    % For exp data and MLE
    simulation_id = 'Sim7933802';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7933803
    
    % For exp data and MLE
    simulation_id = 'Sim7933803';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif	simulation_num == 7931801
    
    % For exp data and MLE
    simulation_id = 'Sim7931801';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7931802
    
    % For exp data and MLE
    simulation_id = 'Sim7931802';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7931803
    
    % For exp data and MLE
    simulation_id = 'Sim7931803';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
elseif	simulation_num == 7932801
    
    % For exp data and MLE
    simulation_id = 'Sim7932801';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7932802
    
    % For exp data and MLE
    simulation_id = 'Sim7932802';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7932803
    
    % For exp data and MLE
    simulation_id = 'Sim7932803';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif	simulation_num == 7934801
    
    % For exp data and MLE
    simulation_id = 'Sim7934801';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 7934802
    
    % For exp data and MLE
    simulation_id = 'Sim7934802';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 7934803
    
    % For exp data and MLE
    simulation_id = 'Sim7934803';
    
    data_file_to_use_array{1} = 'WM793b_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.9;3;0.5;175;125];
    times_to_use =   [1;19];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    
    
end



%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SYNTHETIC DATA  (71- 10 measurements, 72- 48 measurements, 74 - different initial conditions first 6 days
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if	simulation_num == 717933101
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x1xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For exp data and MLE
    simulation_id = 'Sim717933101';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =  [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 717933102
    
    % For exp data and MLE
    simulation_id = 'Sim717933102';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 717933103
    
    % For exp data and MLE
    simulation_id = 'Sim717933103';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x2xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif simulation_num == 717933201
    
    
    
    % For exp data and MLE
    simulation_id = 'Sim717933201';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 717933202
    
    % For exp data and MLE
    simulation_id = 'Sim717933202';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =    [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 717933203
    
    % For exp data and MLE
    simulation_id = 'Sim717933203';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =    [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x3xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif simulation_num == 717933301
    
    
    
    % For exp data and MLE
    simulation_id = 'Sim717933301';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =  [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 717933302
    
    % For exp data and MLE
    simulation_id = 'Sim717933302';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 717933303
    
    % For exp data and MLE
    simulation_id = 'Sim717933303';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata1_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata1_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata1_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA  (71- 10 measurements, 72- 48 measurements,
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif	simulation_num == 727933101
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x1xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % For exp data and MLE
    simulation_id = 'Sim727933101';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =  [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 727933102
    
    % For exp data and MLE
    simulation_id = 'Sim727933102';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 727933103
    
    % For exp data and MLE
    simulation_id = 'Sim727933103';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;8;12;17];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x2xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif simulation_num == 727933201
    
    
    
    % For exp data and MLE
    simulation_id = 'Sim727933201';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 727933202
    
    % For exp data and MLE
    simulation_id = 'Sim727933202';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =    [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 727933203
    
    % For exp data and MLE
    simulation_id = 'Sim727933203';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =    [1;3;6;8;10;12;14;17;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 7793x3xx %% 5000 - o VS o+n VS o+n+f , measurement times
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif simulation_num == 727933301
    
    
    
    % For exp data and MLE
    simulation_id = 'Sim727933301';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =  [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 727933302
    
    % For exp data and MLE
    simulation_id = 'Sim727933302';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 727933303
    
    % For exp data and MLE
    simulation_id = 'Sim727933303';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata2_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =   [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,0,0]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata2_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata2_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SYNTHETIC DATA 74793x3xx (compare 1250, 2500, 5000, 10000 first 6 days)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
elseif simulation_num == 747931901
    
    % For exp data and MLE
    simulation_id = 'Sim747931901';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata4_1250_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;125];
    times_to_use =  [1;2;3;4;5;6];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata4_1250_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata4_1250_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 747932901
    
    % For exp data and MLE
    simulation_id = 'Sim747932901';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata4_2500_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;141];
    times_to_use =  [1;2;3;4;5;6];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata4_2500_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata4_2500_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
elseif simulation_num == 747933901
    
    % For exp data and MLE
    simulation_id = 'Sim747933901';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata4_5000_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;179];
    times_to_use =  [1;2;3;4;5;6];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata4_5000_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata4_5000_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 747934901
    
    % For exp data and MLE
    simulation_id = 'Sim747934901';
    
    data_file_to_use_array{1} = 'WM793b_syntheticdata4_10000_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;25;25];
    p_upper_bounds = [0.99999;6;1;350;250];
    p_first_guess = [0.79;0.04;0.15;254;231];
    times_to_use =  [1;2;3;4;5;6];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM793b_syntheticdata4_10000_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM793b_syntheticdata4_10000_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WM164

if simulation_num == 1641101
    
    simulation_id = 'Sim1641101';
    
    data_file_to_use_array{1} = 'WM164_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;200;200];
    p_upper_bounds = [0.99999;6;1;600;700];
    p_first_guess = [  0.8000; 0.10000;    0.5000;  400;  210.0000];
    times_to_use =   [1;2;3;4;5];
    initial_condition = 1250;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM164_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM164_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 1642101
    
    %%
    simulation_id = 'Sim1642101';
    
    data_file_to_use_array{1} = 'WM164_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;200;200];
    p_upper_bounds = [0.99999;6;1;600;700];
    p_first_guess = [  0.8000; 0.10000;    0.5000;  400.0000;  210.0000];
    times_to_use =   [1;2;3;4;5];
    initial_condition = 2500;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM164_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM164_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif simulation_num == 1643101
    %%
    simulation_id = 'Sim1643101';
    
    data_file_to_use_array{1} = 'WM164_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;200;200];
    p_upper_bounds = [0.99999;6;1;600;700];
    p_first_guess =  [  0.8000; 0.10000;    0.4000; 400;  350];
    times_to_use =   [1;2;3;4;5];
    initial_condition = 5000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM164_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM164_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
elseif   simulation_num == 1644101
    
    %%
    simulation_id = 'Sim1644101';
    
    data_file_to_use_array{1} = 'WM164_IncuCyte_confocal_outer.mat';
    data_sheet_to_use_array{1} = '';
    
    p_lower_bounds = [1e-2;1e-2;1e-2;200;200];
    p_upper_bounds = [0.99999;6;1;600;700];
    p_first_guess =  [  0.8000; 0.10000;    0.4000; 400;  350];
    times_to_use =   [1;2;3;4;5];
    initial_condition = 10000;
    filepath_save = [pwd  '/' simulation_id '/'];
    
    
    % For profile likelihoods
    parameter_range_to_profile_custom = [0;0;0;0;0];
    
    data_inclusions = [1,1,1]; %
    
    
    data_file_to_use_array{2} = 'WM164_confocal_necrotic.mat';
    data_sheet_to_use_array{2} = '';
    
    data_file_to_use_array{3}= 'WM164_confocal_inhibited.mat';
    data_sheet_to_use_array{3} = '';
    
end


%% If would like to calculate the profile likelihood at specific points (not used for manuscript)

if  parameter_range_to_profile_custom(1) == 0 % not using custom then set default values
    parameter_range_to_profile_p1 = (p_lower_bounds(1) + p_upper_bounds(1))./2;
    parameter_range_to_profile_p2 = (p_lower_bounds(2) + p_upper_bounds(2))./2;
    parameter_range_to_profile_p3 = (p_lower_bounds(3) + p_upper_bounds(3))./2;
    parameter_range_to_profile_p4 = (p_lower_bounds(4) + p_upper_bounds(4))./2;
    parameter_range_to_profile_p5 = (p_lower_bounds(5) + p_upper_bounds(5))./2;
    parameter_range_to_profile = {parameter_range_to_profile_p1,parameter_range_to_profile_p2,parameter_range_to_profile_p3,parameter_range_to_profile_p4,parameter_range_to_profile_p5};
end


end