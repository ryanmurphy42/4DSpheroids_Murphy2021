function [value, isterminal, direction] = myEvent_phase2_of_3_wastes(t,y)

global y_star

value      = double(any(y >= y_star));
isterminal = 1;   % Stop the integration
direction  = 0;

end