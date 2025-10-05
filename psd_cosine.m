% Parameters
f = 200;                  % Frequency of cosine
fs = 20*f;                % Sampling frequency (Hz)
cycles = 50;                     % Duration in seconds
t = 0:1/fs:cycles/fs;

% Cosine signal
x = cos(2*pi*f*t);

% Method 2: PSD via autocorrelation and FFT
rxx = xcorr(x);
X= fftshift(fft(rxx));
PSD_corr = abs(X);
%r_freq = (-length(x)+1:length(x)-1)*(Fs/length(rxx));
f_axis= linspace(-fs/2,fs/2,length(X));

% Plot
subplot 211;
stem(t,x);
subplot 212;
plot(f_axis, PSD_corr);
title('PSD using corr() + FFT');
xlabel('Frequency (Hz)');
ylabel('Power');
