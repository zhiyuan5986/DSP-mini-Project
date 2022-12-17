load("Q1.mat")

wp = 0.12 * pi;% 0.04*pi; % 0.1
ws = 0.17 * pi; % 0.06*pi;% 0.14
ap = 5;
as = 60;

wc = (wp+ws)/2;
delta = min(1-power(10,-ap/20), power(10, -as/20));
A = -20 * log10(delta);
if A > 50
    beta = 0.1102*(A-8.7);
else
    if A <= 50
        beta = 0.584*power(A-21, 0.4) + 0.07886 * (A-21);
    else
        beta = 0;
    end
end

M = ceil((A-8) / 2.285 / (ws-wp));
fprintf("wc = %f, delta = %f, M = %d, beta = %f\n", wc, delta, M, beta);

% 2. kaiser window
h = fir1(M, 0.15, kaiser(M+1,beta));
H = fft(h, 1024);
figure(14)
plot([0:1023]/512, 20*log10(abs(H)));
grid on; 
axis([0, 0.2, -100, 10]);

y = filter(h,1,x_N);
Y = fft(y, N_fft);
Y = fftshift(Y);
freq_base_continuous = linspace(-1/2,1/2,N_fft)*Fs_fft;
PlotSpectrum(freq_base_continuous, Y, "Y_{Kaiser}(j\omega)", 15, true);

sound(y,Fs);
PlotWave(time_base, y, "y_{Kaiser}[n]", 16)
audiowrite("spring_kaiser.wav", y, Fs);