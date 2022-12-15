function PlotWave(x,y,string,num)
% This function is used to plot the waveform of each signal
% Format of calls: PlotWave(base,wave,wave_name,figure_num)

figure(num)
title(string)
subplot(2,1,1)
plot(x,y(:,1),'-')
title(sprintf("Channel 1 of $%s$",string),'interpreter',"latex")
xlabel("n/sample")
subplot(2,1,2)
plot(x,y(:,2),'r-')
title(sprintf("Channel 2 of $%s$",string),'interpreter',"latex")
xlabel("n/sample")
end