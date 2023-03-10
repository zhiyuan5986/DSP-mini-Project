load("Q1.mat")

% downsampling
x_d = downsample(x_N,10);
Fs_d = Fs/10;
% sound(x_d,Fs_d); % There is more noise.

N_d = length(x_d);
N_d_fft = pow2(ceil(log2(N_d)));

time_base_d = 1:1:N_d; 
PlotWave(time_base_d,x_d,"x_d[n]",6)

X_d = fft(x_d, N_d_fft);
X_d = fftshift(X_d);

freq_base_discrete_d = linspace(-1,1,N_d_fft);
PlotSpectrum(freq_base_discrete_d, X_d, "X_d(e^{j\omega})", 7, false);

% upsampling

x_e = upsample(x_N, 10);

N_e = length(x_e);
N_e_fft = pow2(ceil(log2(N_e)));

time_base_e = 1:1:N_e; 
PlotWave(time_base_e,x_e,"x_e[n]",8)

X_e = fft(x_e, N_e_fft);
X_e = fftshift(X_e);

freq_base_discrete_e = linspace(-1,1,N_e_fft);
PlotSpectrum(freq_base_discrete_e, X_e, "X_e(e^{j\omega})", 9, false);

% Change sampling rate.
% We can use 
x_compress = downsample(x_N,2);
Fs_compress = Fs/2;
sound(x_compress,Fs_compress);

N_compress = length(x_compress);
N_compress_fft = pow2(ceil(log2(N_compress)));
X_compress = fft(x_compress, N_compress_fft);
X_compress = fftshift(X_compress);
freq_base_discrete_compress = linspace(-1,1,N_compress_fft);
PlotSpectrum(freq_base_discrete_compress, X_compress, "X_{compress}(e^{j\omega})", 10, false);