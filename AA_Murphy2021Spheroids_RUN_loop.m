%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2021--Murphy et al--Designing and interpreting 4D tumour spheroid experiments
%% Author Ryan J. Murphy
%% Code to generate MLE, profile likelihoods, and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% simulation_num = 7933101 
% Cell line - 793
% Number of cells used to form spheroids - 3, corresponding to 5000 cells
% Resolution A and using all three measurements (outer, necrotic, and inhibited)101


for simulation_num=7933101
    parameters_to_profile =1:5; % perform profile likelihood analysis for all 5 parameters
    for section_to_run=[1,211,212,213,220,230,241,242,243,250,31,32] % run all sections of the code for this parameter (this is all code in A_Murphy2021Spheroids_Main except for custom plots)
        A_Murphy2021Spheroids_Main(simulation_num, parameters_to_profile,section_to_run)
    end
end
