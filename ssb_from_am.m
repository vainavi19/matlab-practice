clc;
clear;
close all;

fc = 2000;
fm = 500;
fs = 10*fc;
wc= 2*fc/fs;
n = 2;
Am = 5;
Ac = 5;

t = 0 : 1/fs : n/fm;
St = Ac * cos(2*pi*fc*t) .* (1 + ((Am/Ac)*cos(2*pi*fm*t)));

subplot(3,1,1)
plot(t,St)

St_ = fft(St,2048);
Sf = fftshift(St_);
w = linspace(-fs/2, fs/2, length(Sf));

subplot(3,1,2)
plot(w, abs(Sf))

h = fir1(1001, 0.18, 'high');
y = filter(h, 1, St);
y_ = fft(y, 2048);
yf = fftshift(y_);

subplot(3,1,3)
plot(w, abs(yf))
