function [T,Y] = solv_nbody(sol0,times)
%solv_nbody Function solving the differential equation
%   Arguments: times and initial conditions
options = odeset('RelTol',1e-9);
[T,Y] = ode45('func_nbody',times,sol0,options);
end

