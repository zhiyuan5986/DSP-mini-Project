load("Q1.mat")

wp = 0.1; % 0.1
ws = 0.14;% 0.14
ap = 5;
as = 60;

wc = (wp+ws)/2;
delta = min(1-power(10,-ap/20), power(10, -as/20));
M = ceil(8 * pi / 2 / (ws-wp));

% 1. hamming window
h = fir1(M, wc, hamming(M+1));
H = fft(h, 512);
figure(11)
plot([0:511]/256, 20*log10(abs(H)));
grid on; 
axis([0.1, 0.2, -60, 10]);

y = filter(h,1,x_N);
Y = fft(y, N_fft);
Y = fftshift(Y);
freq_base_continuous = linspace(-1/2,1/2,N_fft)*Fs_fft;
PlotSpectrum(freq_base_continuous, Y, "Y(j\omega)", 12, true);

sound(y,Fs);
PlotWave(time_base, y, "y[n]", 13)




