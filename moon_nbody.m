clear all; close all; clc
% Body 0 - Earth
sol0(1,1) = 5.97237*10^24; % Mass
sol0(2,1) = 0; % x position
sol0(3,1) = 0; % y position
sol0(4,1) = 0; % x velocity
sol0(5,1) = -25.0783; % y velocity
% Body 1 - Moon
sol0(6,1)  = 0.07342*10^24; % Mass
sol0(7,1)  = 0.4055*10^9; % x position
sol0(8,1)  = 0; % y position
sol0(9,1)  = 0; % x velocity
sol0(10,1) = 964; % y velocity
% Body 2 - Moon-
sol0(11,1)  = 0.07342*10^24; % Mass
sol0(12,1)  = 0.3633*10^9; % x position
sol0(13,1)  = 0; % y position
sol0(14,1)  = 0; % x velocity
sol0(15,1) = 1076; % y velocity
t0 = 0;
tf = 10000000;
[T,Y] = solv_nbody(sol0,t0,tf);
plot(Y(:,2),Y(:,3))
hold on
plot(Y(end,2),Y(end,3),'o')
plot(Y(:,7),Y(:,8),'Color',[0.5,0.5,0.5])
plot(Y(end,7),Y(end,8),'o','Color',[0.5,0.5,0.5])
plot(Y(:,12),Y(:,13),'Color',[0.3,0.3,0.3])
plot(Y(end,12),Y(end,13),'o','Color',[0.3,0.3,0.3])
axis([-1 1 -1 1]*0.5*10^9)
axis square
hold off