function [Yd] = func_nbody(~,Y)
%func_nbody Function calculating the differential equation.
%   In this function we obtain Yd, the derivatie with respect to time of Y.
%   This function is used as an argument of the ode function.
global body
len = length(Y);
n   = len/4;
Yd = zeros(len,1);
G = 6.674*10^-11;
for i=0:n-1
    forc = 0;
    Yd(4*i+1) = Y(4*i+3);
    Yd(4*i+2) = Y(4*i+4);
    for j=0:n-1
        if j~=i&&body(j+1).phys
            dist = [Y(4*i+1)-Y(4*j+1),Y(4*i+2)-Y(4*j+2)];
            forc = forc-G*body(j+1).mass/(norm(dist))^3*dist;
        end
    end
    Yd(4*i+3) = forc(1);
    Yd(4*i+4) = forc(2);
end
end