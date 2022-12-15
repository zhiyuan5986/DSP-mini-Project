function PlotSpectrumLocal(f,Fs,N,y,string,num)
% This function is used to plot the spectrum of each signal
% in a fixed frequency domain
% Format of calls: PlotSpectrumLocal(bound_frequency,frequency_of_signal,spectrum_length,spectrum,spectrum_name,figure_num)

Fs_base = -f:Fs/N:f;
figure(num)
y = y(int32((-f:Fs/N:f)*N/Fs+N/2),:); % cut
title(string)

subplot(2,2,1)
plot(Fs_base,abs(y(:,1)),'-')
title(sprintf("Magnitude of $%s$ (Channel 1)",string),'Interpreter',"latex")
xlabel("frequency/Hz")

subplot(2,2,2)
plot(Fs_base,abs(y(:,2)),'r-')
title(sprintf("Magnitude of $%s$ (Channel 2)",string),'Interpreter',"latex")
xlabel("frequency/Hz")

subplot(2,2,3)
plot(Fs_base,angle(y(:,1)),'-')
title(sprintf("Phase of $%s$ (Channel 1)",string),'Interpreter',"latex")
xlabel("frequency/Hz")

subplot(2,2,4)
plot(Fs_base,angle(y(:,2)),'r-')
title(sprintf("Phase of $%s$ (Channel 2)",string),'Interpreter',"latex")
xlabel("frequency/Hz")
end