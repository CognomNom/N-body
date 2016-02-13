clear all; close all; clc
% We define the initial conditions of our problem. 
global body
load('solar_system')
% Time running
t0 = 0;
tf = 10000000000;
%tf = 100*32*10^6;
times = linspace(t0,tf,100000);
[T,Y]=solv_nbody(sol0,times);
plot(Y(:,1),Y(:,2),'y')
hold on
plot(Y(end,1),Y(end,2),'oy')
plot(Y(:,5),Y(:,6),'b')
plot(Y(end,5),Y(end,6),'ob')
plot(Y(:,9),Y(:,10),'Color',[0.8,0.4,0])
plot(Y(end,9),Y(end,10),'o','Color',[0.8,0.4,0])
plot(Y(:,13),Y(:,14),'r')
plot(Y(end,13),Y(end,14),'or')
plot(Y(:,17),Y(:,18),'Color',[0.5,0.5,0.5])
plot(Y(end,17),Y(end,18),'o','Color',[0.5,0.5,0.5])
plot(Y(:,21),Y(:,22),'c')
plot(Y(end,21),Y(end,22),'co')
plot(Y(:,25),Y(:,26),'g')
plot(Y(end,25),Y(end,26),'go')
plot(Y(:,29),Y(:,30),'Color',[0.5 0.5 1])
plot(Y(end,29),Y(end,30),'o','Color',[0.5 0.5 1])
plot(Y(:,33),Y(:,34),'Color',[0 0 0.4])
plot(Y(end,33),Y(end,34),'o','Color',[0 0 0.4])
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