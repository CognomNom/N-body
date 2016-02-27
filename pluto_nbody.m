clear all; close all; clc
% We define the initial conditions of our problem. 
% Body 0 - Pluto
body(1).mass = 1.3003*10^22; % Mass (in kg)
body(1).name = 'Pluto';
body(1).phys = true;
body(1).colo = [0.8 0.6 0.4];
sol0(1,1) = 0; % x position
sol0(2,1) = 0; % y position
sol0(3,1) = 0; % x velocity
sol0(4,1) = -25.63; % y velocity
% Body 1 - Charon
body(2).mass = 158.7*10^19; % Mass (in kg)
body(2).name = 'Charon';
body(2).phys = true;
body(2).colo = [0.9 0.8 0.9];
sol0(5,1)  = 19571*10^3; % x position
sol0(6,1)  = 0; % y position
sol0(7,1)  = 0; % x velocity
sol0(8,1)  = 210; % y velocity 
% Body 2 - Styx
body(3).mass = 1; % Mass (in kg)
body(3).name = 'Styx';
body(3).phys = false;
body(3).colo = [0.8,0.8,0.8];
sol0(9,1)  = -42656*10^3; % x position
sol0(10,1) = 0; % y position
sol0(11,1) = 0; % x velocity
sol0(12,1) = -153.9; % y velocity 
% Body 3 - Nix
body(4).mass = 4.5*10^16; % Mass (in kg)
body(4).name = 'Nix';
body(4).phys = true;
body(4).colo = [1 0 1];
sol0(13,1) = -48694*10^3; % x position
sol0(14,1) = 0; % y position
sol0(15,1) = 0; % x velocity
sol0(16,1) = -142.5; % y velocity 
% Body 4 - Kerberos
body(5).mass = 1; % Mass (in kg)
body(5).name = 'Kerberos';
body(5).phys = false;
body(5).colo = [0.5,0.5,0.5];
sol0(17,1) = -57783*10^3; % x position
sol0(18,1) = 0; % y position
sol0(19,1) = 0; % x velocity
sol0(20,1) = -130.63; % y velocity 
% Body 5 - Hydra
body(6).mass = 4.8*10^16; % Mass (in kg)
body(6).name = 'Hydra';
body(6).phys = true;
body(6).colo = [0.3,0.3,0.3];
sol0(21,1) = -64738*10^3; % x position
sol0(22,1) = 0; % y position
sol0(23,1) = 0; % x velocity
sol0(24,1) = -123.24; % y velocity
save('pluto')