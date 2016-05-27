function [dat,tf] = tui_nbody
%tui_nbody Function handling user interaction to define several parameters
%   Detailed explanation goes here
dat = define_archive;
tf  = define_time;

end
function tf = define_time
stf = input('For how long do you want the simulation to run? ','s');
tf  = str2double(stf);
if isnan(tf)
    fprintf('We didn''t understand the number you typed.\n\n')
    tf = define_time;
else
    fprintf('Simulation time: %.2g s %.2g y\n',tf,tf/(365.25*24*3600))
end
end
function dat = define_archive
ar = dir('*.mat');
fprintf('List of available files:\n')
len = length(ar);
for i=1:len
    fprintf('%s\n',ar(i).name)
end
dat1 = input('Write name of file: ','s');
if length(dat1)<5
    fprintf('We didn''t understand the name of the archive.')
    dat = define_archive;
else
    val = false;
    if ~strcmpi(dat1(end-4:end),'.mat')
        dat1 = [dat1 '.mat'];
    end
    for i=1:len
        val = val||strcmpi(dat1,ar(i).name);
    end
    if ~val
        fprintf('We didn''t understand the name of the archive.\n\n')
        dat = define_archive;
    else
        dat = dat1;
    end
end
end
