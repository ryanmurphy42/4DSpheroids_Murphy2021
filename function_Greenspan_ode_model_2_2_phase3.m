function out = function_ode_model_2_2_phase3(t,y,gamma,Q)

out= zeros(2,1);


out(1) =  ( 1 - y(2).^3 - 3*gamma*y(1).^3 )/(9*y(1)./(  (1+2.*y(1)).*(1-y(1))));
out(2) =  1-y(2).^2 -2*y(1).^3*(1-y(2))./y(2) - Q^2*((1-y(1)).^2*(1+2.*y(1)));

end
    
