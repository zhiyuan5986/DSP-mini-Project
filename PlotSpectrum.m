function PlotSpectrum(x,y,string,num, isContinuous)
% This function is used to plot the spectrum of each signal
% Format of calls: PlotWave(base,spectrum,spectrum_name,figure_num, Continuous_or_not)

figure(num)
title(string)
subplot(2,2,1)
plot(x,abs(y(:,1)),'-')
title(sprintf("Magnitude of $%s$ (Channel 1)",string),'Interpreter',"latex")
if isContinuous
    xlabel("frequency/Hz")
else
    xlabel("$\omega$", "Interpreter","latex")
end
subplot(2,2,2)
plot(x,abs(y(:,2)),'r-')
title(sprintf("Magnitude of $%s$ (Channel 2)",string),'Interpreter',"latex")
if isContinuous
    xlabel("frequency/Hz")
else
    xlabel("$\omega$", "Interpreter","latex")
end

subplot(2,2,3)
plot(x,angle(y(:,1)),'-')
title(sprintf("Phase of $%s$ (Channel 1)",string),'Interpreter',"latex")
if isContinuous
    xlabel("frequency/Hz")
else
    xlabel("$\omega$", "Interpreter","latex")
end
subplot(2,2,4)
plot(x,angle(y(:,2)),'r-')
title(sprintf("Phase of $%s$ (Channel 2)",string),'Interpreter',"latex")
if isContinuous
    xlabel("frequency/Hz")
else
    xlabel("$\omega$", "Interpreter","latex")
end
end