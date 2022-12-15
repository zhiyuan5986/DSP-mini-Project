% Question1
[x_N, Fs] = audioread('./rose.wav');

% Figure out sample period T
T=1/Fs;
fprintf("The sampling rate is: %d Hz and the sampling period T is: %f s\n",Fs,T)
w_s=2*pi*Fs;
N = length(x_N);
N_fft = pow2(ceil(log2(N)));
Fs_fft = Fs * N / N_fft;

dt = (T * N) / N_fft;
df = 1 / (T * N);

fprintf("The frequency window: %f Hz\n", 1/dt);
sound(x_N,Fs)

% Plot the waveform of x[n]
time_base = 1:1:N; 
PlotWave(time_base,x_N,"x[n]",1)

% Frequency analysis

X = fft(x_N, N_fft);
X = fftshift(X);

freq_base_continuous = linspace(-1/2,1/2,N_fft)*Fs_fft;
PlotSpectrum(freq_base_continuous, X, "X(j\omega)", 2);
PlotSpectrumLocal(5000,Fs_fft,N_fft,X,"X(j\omega)",3);

freq_base_discrete = linspace(-1,1,N_fft)*pi;
PlotSpectrum(freq_base_discrete, X, "X(e^{j\omega})", 4);

f = (0:(N_fft-1)) * df;
H = fft(x_N, N_fft) * dt;
H = H / H(1);
Hmag = 20 * log10(abs(H));

figure(5);
subplot(2,1,1);
plot(f,Hmag(:,1), '-');
subplot(2,1,2)
plot(f,Hmag(:,2), 'r-');

save("Q1.mat")




