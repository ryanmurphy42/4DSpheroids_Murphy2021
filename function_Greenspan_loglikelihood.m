function [residual] = function_Greenspan_loglikelihood(p,y_measurements_all, variable_id_measurements, time_measurements_all,standard_deviation_vec)

% y_measurements_all - experimental measurements
% variable_id_measurements - defines the type of measurement: 1- outer, 2- necrotic, 3- necrotic
% time_measurements_all - times when experimental measurements taken
% standard_deviation_vec - the standard deviation for that measurement type

y_sample = function_Greenspan_model_fmincon_no_plots_v1(variable_id_measurements,time_measurements_all,p);

residual=0;

y= -log(normpdf(y_measurements_all,y_sample,standard_deviation_vec)); 

residual=sum(y);


end