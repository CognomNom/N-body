function [Yd] = func_nbody(~,Y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
len = length(Y);
n   = len/5;
Yd = zeros(len,1);
G = 6.674*10^-11;
for i=0:n-1
    forc = 0;
    Yd(5*i+1) = 0;
    Yd(5*i+2) = Y(5*i+4);
    Yd(5*i+3) = Y(5*i+5);
    for j=0:n-1
        if j~=i
            dist = [Y(5*i+2)-Y(5*j+2),Y(5*i+3)-Y(5*j+3)];
            forc = forc-G*Y(5*j+1)/(norm(dist))^3*dist;
        end
    end
    Yd(5*i+4) = forc(1);
    Yd(5*i+5) = forc(2);
end
end