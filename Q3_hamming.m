load("Q1.mat")

wp = 0.12 * pi; % 0.1
ws = 0.17 * pi;% 0.14
ap = 5;
as = 40;

wc = (wp+ws)/2;
delta = min(1-power(10,-ap/20), power(10, -as/20));
M = ceil(8 * pi / 2 / (ws-wp));
fprintf("wc = %f, delta = %f, M = %d\n", wc, delta, M);

% 1. hamming window
h = fir1(2*M, 0.15, hamming(2*M+1));
H = fft(h, 512);
figure(11)
plot([0:511]/256, 20*log10(abs(H)));
grid on; 
axis([0, 0.2, -50, 10]);

y = filter(h,1,x_N);
Y = fft(y, N_fft);
Y = fftshift(Y);
freq_base_continuous = linspace(-1/2,1/2,N_fft)*Fs_fft;
PlotSpectrum(freq_base_continuous, Y, "Y_{Hamming}(j\omega)", 12, true);

sound(y,Fs);
PlotWave(time_base, y, "y_{Hamming}[n]", 13)
audiowrite("spring_hamming.wav", y, Fs);




