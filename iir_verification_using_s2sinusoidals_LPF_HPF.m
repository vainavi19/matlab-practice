clc;
clear all;
close all;

f01= 100;
f02=400;
f03=800;
f04=1000;
a0=2;
n=3;

%sampling uses maximum freq
% fs=20*f04; %butterworth
fs=5*f04; %chebyshev
t=0:1/fs:n/f01; %time division uses smallest/min freq
x=a0*(sin(2*pi*f01*t) + sin(2*pi*f02*t) + sin(2*pi*f03*t) + sin(2*pi*f04*t));

subplot(411);
stem(t,x);
title(sprintf('Input signal  100523735060 \n(f01=%d, f02=%d, f03=%d, f04=%d a0=%d, n=%d)', f01, f02, f03, f04, a0, n));
xlabel('Time');
ylabel('Amplitude');

%*************Calculating the spectrum*************
Xk= fft(x);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);
%Xkm_phase= angle(Xkm);

subplot(412);
plot(w, Xkm_mag);
title('Magnitude of Spectrum 100523735060')
xlabel('Frequency');
ylabel('Magnitude');

 %*************Calculating the filtered spectrum - LPF ************
% load('LPFcoeff.mat');  %butterworth
% x_filtered= filter(al,bl,x);

load('LPFcoeff_chebyshev.mat'); %chebyshev
x_filtered= filter(alc, blc,x);

Xk= fft(x_filtered);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);

subplot(413);
plot(w, Xkm_mag);
title(sprintf('Magnitude of Filtered Spectrum - LPF 100523735060\n(fp= 100, fs= 300, rp= 1, rs= 40)'));
xlabel('Frequency');ylabel('Magnitude');

%*************Calculating the filtered spectrum - HPF ************
% load('HPFcoeff.mat');  %butterworth
% x_filtered= filter(ah,bh,x);

load('HPFcoeff_chebyshev.mat'); %chebyshev
x_filtered= filter(ahc, bhc,x);

Xk= fft(x_filtered);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);

subplot(414);
plot(w, Xkm_mag);
title(sprintf('Magnitude of Filtered Spectrum - HPF 100523735060\n(fp= 300, fs= 100, rp= 1, rs= 40)'));
xlabel('Frequency');ylabel('Magnitude');

