clear; close all; clc
% We define the initial conditions of our problem. 
% Body 0 - Sun
body(1).mass = 1.98855*10^30; % Mass (in kg)
body(1).name = 'Sun';
body(1).phys = true;
body(1).colo = [1 1 0];
sol0(1,1) = 0; % x position
sol0(2,1) = 0; % y position
sol0(3,1) = 0; % x velocity
sol0(4,1) = 8.5247; % y velocity
% Body 1 - Earth
body(2).mass = 5.97237*10^24; % Mass (in kg)
body(2).name = 'Earth';
body(2).phys = true;
body(2).colo = [0 0 1];
sol0(5,1)  = 152.1*10^9; % x position
sol0(6,1)  = 0; % y position
sol0(7,1)  = 0; % x velocity
sol0(8,1)  = 29290; % y velocity 
% Body 2 - Venus
body(3).mass = 4.8675*10^24; % Mass (in kg)
body(3).name = 'Venus';
body(3).phys = true;
body(3).colo = [0.8,0.4,0];
sol0(9,1)  = 108.939*10^9; % x position
sol0(10,1) = 0; % y position
sol0(11,1) = 0; % x velocity
sol0(12,1) = 34780; % y velocity 
% Body 3 - Mars
body(4).mass = 6.4171*10^23; % Mass (in kg)
body(4).name = 'Mars';
body(4).phys = true;
body(4).colo = [1 0 0];
sol0(13,1) = 249.232*10^9; % x position
sol0(14,1) = 0; % y position
sol0(15,1) = 0; % x velocity
sol0(16,1) = 21970; % y velocity 
% Body 4 - Mercury
body(5).mass = 3.3011*10^23; % Mass (in kg)
body(5).name = 'Mercury';
body(5).phys = true;
body(5).colo = [0.5,0.5,0.5];
sol0(17,1) = 69.8169*10^9; % x position
sol0(18,1) = 0; % y position
sol0(19,1) = 0; % x velocity
sol0(20,1) = 38860; % y velocity 
% Body 5 - Jupiter
body(6).mass = 1898.3*10^24; % Mass (in kg)
body(6).name = 'Jupiter';
body(6).phys = true;
body(6).colo = [0,1,1];
sol0(21,1) = -816.62*10^9; % x position
sol0(22,1) = 0; % y position
sol0(23,1) = 0; % x velocity
sol0(24,1) = -12440; % y velocity
% Body 6 - Saturn
body(7).mass = 568.36*10^24; % Mass (in kg)
body(7).name = 'Saturn';
body(7).phys = true;
body(7).colo = [0,1,0];
sol0(25,1) = 1514.5*10^9; % x position
sol0(26,1) = 0; % y position
sol0(27,1) = 0; % x velocity
sol0(28,1) = 9090; % y velocity 
% Body 7 - Uranus
body(8).mass = 86.816*10^24; % Mass (in kg)
body(8).name = 'Uranus';
body(8).phys = true;
body(8).colo = [0.5,0.5,1];
sol0(29,1) = 3003.62*10^9; % x position
sol0(30,1) = 0; % y position
sol0(31,1) = 0; % x velocity
sol0(32,1) = 6490; % y velocity 
% Body 8 - Neptune
body(9).mass = 102.42*10^24; % Mass (in kg)
body(9).name = 'Neptune';
body(9).phys = true;
body(9).colo = [0,0,0.4];
sol0(33,1) = 4545.67*10^9; % x position
sol0(34,1) = 0; % y position
sol0(35,1) = 0; % x velocity
sol0(36,1) = 5370; % y velocity
save('solar_system')