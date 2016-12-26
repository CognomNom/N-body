clear; close all; clc
global body
fr = 1e-1; % This represents the extent of the graphical display in 10^9 km
[dat,tf,dt0,dt1] = tui_nbody;
% We load the initial conditions of our problem. 
load(dat)

% Time running
t0 = 0;
intervals = floor((tf-t0)/dt0);
times = t0:dt0:tf;
len = length(body);
h = zeros(len,1); % In order to modify the position of the objects
steps = ceil((times(2)-times(1))/dt1);
Y = zeros(intervals*steps,4*len);
t = zeros(intervals*steps,1);
wb = waitbar(0,'Starting the simulation...');
n = round(sqrt(intervals));
for i = 1:intervals
    tim = linspace(times(i),times(i+1),steps);
    [T,ymat]=solv_nbody(sol0,tim);
    Y(steps*(i-1)+1:steps*i,:) = ymat;
    t(steps*(i-1)+1:steps*i) = T;
    sol0 = ymat(end,:);
    if ~rem(i,n)
        waitbar(i/intervals,wb,['Running... ' num2str(i/intervals*100) '%'])
    end
end
delete(wb)
%% cosas raras
a = fft(Y(:,2)); L = intervals*steps; P2 = abs(a/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = (0:(L/2))/(L*dt1);
figure
loglog(f,P1,'k')
lim = get(gca,'YLim');
hold on
loglog([1 1]/(365.25*24*3600),lim,'b')
loglog([1 1]/(224.701*24*3600),lim,'Color',[0.8,0.4,0])
loglog([1 1]/(87.9691*24*3600),lim,'Color',[0.5,0.5,0.5])
loglog([1 1]/(686.973*24*3600),lim,'r')
loglog([1 1]/(4330.595*24*3600),lim,'c')
loglog([1 1]/(10746.94*24*3600),lim,'g')
loglog([1 1]/(30588.74*24*3600),lim,'Color',[0.5 0.5 1])
loglog([1 1]/(59800*24*3600),lim,'Color',[0 0 0.4])
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