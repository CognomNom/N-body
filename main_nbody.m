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
figure;
hold on
axis([-1 1 -1 1]*fr*10^9)
axis square
h = zeros(len,1); % In order to modify the position of the objects
for i = 1:intervals
    tic;
    tim = linspace(times(i),times(i+1),ceil((times(i+1)-times(i))/dt1));
    [T,Y]=solv_nbody(sol0,tim);
    sol0 = Y(end,:);
    for j=0:len-1
        plot(Y(:,4*j+1),Y(:,4*j+2),'Color',body(j+1).colo);
        if h(j+1)
            set(h(j+1),'XData',Y(end,4*j+1));
            set(h(j+1),'YData',Y(end,4*j+2));
            if ~j
                set(t,'String',['t = ' num2str(times(i+1)) ' s']);
            end
        else
            h(j+1) = plot(Y(end,4*j+1),Y(end,4*j+2),'o','Color',body(j+1).colo);
            if ~j
                t = text(fr*10^9,fr*10^9,['t = ' num2str(times(i+1)) ' s']);
            end
        end
    end
    ti1 = toc;
    pause(0.1-ti1)
end
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