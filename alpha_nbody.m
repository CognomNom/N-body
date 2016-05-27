clear all; close all; clc
% Body 0 - Alpha Centauri A
body(1).mass = 1.105*1.98855e30; % Mass (in kg)
body(1).name = 'Alpha Centauri A';
body(1).phys = true;
body(1).colo = [0.8 0.8 0.2];
sol0(1,1) = -2.0303e12; % x position
sol0(2,1) = 0; % y position
sol0(3,1) = 0; % x velocity
sol0(4,1) = 1122.2; % y velocity
% Body 2 - Alpha Centauri B
body(2).mass = 0.934*1.98855e30; % Mass (in kg)
body(2).name = 'Alpha Centauri B';
body(2).phys = true;
body(2).colo = [0.8 0.4 0];
sol0(5,1)  = 2.0303e12; % x position
sol0(6,1)  = 0; % y position
sol0(7,1)  = 0; % x velocity
sol0(8,1)  = -1122.2*1.105/0.934; % y velocity 
save('alpha')