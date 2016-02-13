clear all; close all; clc
% We define the initial conditions of our problem. 
% Body 0 - Sun
sol0(1,1) = 1.98855*10^30; % Mass
sol0(2,1) = 0; % x position
sol0(3,1) = 0; % y position
sol0(4,1) = 0; % x velocity
sol0(5,1) = 8.5247; % y velocity
% Body 1 - Earth
sol0(6,1)  = 5.97237*10^24; % Mass
sol0(7,1)  = 152.1*10^9; % x position
sol0(8,1)  = 0; % y position
sol0(9,1)  = 0; % x velocity
sol0(10,1) = 29290; % y velocity 
% Body 2 - Venus
sol0(11,1) = 4.8675*10^24; % Mass
sol0(12,1) = 108.939*10^9; % x position
sol0(13,1) = 0; % y position
sol0(14,1) = 0; % x velocity
sol0(15,1) = 34780; % y velocity 
% Body 3 - Mars
sol0(16,1) = 6.4171*10^23; % Mass
sol0(17,1) = 249.232*10^9; % x position
sol0(18,1) = 0; % y position
sol0(19,1) = 0; % x velocity
sol0(20,1) = 21970; % y velocity 
% Body 4 - Mercury
sol0(21,1) = 6.4171*10^23; % Mass
sol0(22,1) = 69.8169*10^9; % x position
sol0(23,1) = 0; % y position
sol0(24,1) = 0; % x velocity
sol0(25,1) = 38860; % y velocity 
% Body 5 - Jupiter
sol0(26,1) = 1898.3*10^24; % Mass
sol0(27,1) = -816.62*10^9; % x position
sol0(28,1) = 0; % y position
sol0(29,1) = 0; % x velocity
sol0(30,1) = -12440; % y velocity
% Body 6 - Saturn
sol0(31,1) = 568.36*10^24; % Mass
sol0(32,1) = 1514.5*10^9; % x position
sol0(33,1) = 0; % y position
sol0(34,1) = 0; % x velocity
sol0(35,1) = 9090; % y velocity 
% Body 7 - Uranus
sol0(36,1) = 86.816*10^24; % Mass
sol0(37,1) = 3003.62*10^9; % x position
sol0(38,1) = 0; % y position
sol0(39,1) = 0; % x velocity
sol0(40,1) = 6490; % y velocity 
% Body 8 - Neptune
sol0(41,1) = 102.42*10^24; % Mass
sol0(42,1) = 4545.67*10^9; % x position
sol0(43,1) = 0; % y position
sol0(44,1) = 0; % x velocity
sol0(45,1) = 5370; % y velocity 
% Time running
t0 = 0;
tf = 10000000000;
%tf = 100*32*10^6;
[T,Y]=solv_nbody(sol0,t0,tf);
plot(Y(:,2),Y(:,3),'y')
hold on
plot(Y(end,2),Y(end,3),'oy')
plot(Y(:,7),Y(:,8),'b')
plot(Y(end,7),Y(end,8),'ob')
plot(Y(:,12),Y(:,13),'Color',[0.8,0.4,0])
plot(Y(end,12),Y(end,13),'o','Color',[0.8,0.4,0])
plot(Y(:,17),Y(:,18),'r')
plot(Y(end,17),Y(end,18),'or')
plot(Y(:,22),Y(:,23),'Color',[0.5,0.5,0.5])
plot(Y(end,22),Y(end,23),'o','Color',[0.5,0.5,0.5])
plot(Y(:,27),Y(:,28),'c')
plot(Y(end,27),Y(end,28),'co')
plot(Y(:,32),Y(:,33),'g')
plot(Y(end,32),Y(end,33),'go')
plot(Y(:,37),Y(:,38),'Color',[0.5 0.5 1])
plot(Y(end,37),Y(end,38),'o','Color',[0.5 0.5 1])
plot(Y(:,42),Y(:,43),'Color',[0 0 0.4])
plot(Y(end,42),Y(end,43),'o','Color',[0 0 0.4])
axis([-1 1 -1 1]*5000*10^9)
axis square
hold off
% cosas raras
a = fft(Y(:,2)); L = length(T); P2 = abs(a/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs = L/tf; f = Fs*(0:(L/2))/L;
figure
loglog(f,P1,'k')
hold on
loglog([1 1]/(365.25*24*3600),[10^4,10^10],'b')
loglog([1 1]/(224.701*24*3600),[10^4,10^10],'Color',[0.8,0.4,0])
loglog([1 1]/(87.9691*24*3600),[10^4,10^10],'Color',[0.5,0.5,0.5])
loglog([1 1]/(686.973*24*3600),[10^4,10^10],'r')
loglog([1 1]/(4330.595*24*3600),[10^4,10^10],'c')
loglog([1 1]/(10746.94*24*3600),[10^4,10^10],'g')
loglog([1 1]/(30588.74*24*3600),[10^4,10^10],'Color',[0.5 0.5 1])
loglog([1 1]/(59800*24*3600),[10^4,10^10],'Color',[0 0 0.4])
hold off
% % Más cosas raras
% v = VideoWriter('video2.avi','Uncompressed AVI');
% open(v);
% h1 = waitbar(0);
% for k=1:L
%     h = figure;
%     plot(Y(1:k,2),Y(1:k,3),'y');
%     hold on
%     plot(Y(k,2),Y(k,3),'oy')
%     plot(Y(1:k,7),Y(1:k,8),'b')
%     plot(Y(k,7),Y(k,8),'ob')
%     plot(Y(1:k,12),Y(1:k,13),'Color',[0.8,0.4,0])
%     plot(Y(k,12),Y(k,13),'o','Color',[0.8,0.4,0])
%     plot(Y(1:k,17),Y(1:k,18),'r')
%     plot(Y(k,17),Y(k,18),'or')
%     plot(Y(1:k,22),Y(1:k,23),'Color',[0.5,0.5,0.5])
%     plot(Y(k,22),Y(k,23),'o','Color',[0.5,0.5,0.5])
%     hold off
%     axis([-500 500 -500 500]*10^9)
%     axis square
%     F = getframe(h);
%     close(h);
%     writeVideo(v,F);
%     waitbar(k/L,h1);
% end
% close(h1);
% close(v);