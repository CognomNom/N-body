function [T,Y] = solv_nbody(sol0,t0,tf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
options = odeset('RelTol',1e-9);
[T,Y] = ode45('func_nbody',[t0 tf],sol0,options);
end

