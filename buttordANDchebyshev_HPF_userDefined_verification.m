clc;
clear all;
close all;

f01=500;
f02=900;
a0=3;
n=5;

fs=100*f02;
t=0:1/fs:n/f01;
x=a0*(sin(2*pi*f01*t) + sin(2*pi*f02*t));

subplot(311);
stem(t,x);
title('Input signal  100523735060')
xlabel('Time');
ylabel('Amplitude');

%*************Calculating the spectrum*************
Xk= fft(x);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);
Xkm_phase= angle(Xkm);

subplot(312);
plot(w, Xkm_mag);
title('Magnitude of Input signal')
xlabel('Frequency');
ylabel('MAgnitude');

%*************Calculating the spectrum of filtered signal*************
load('cheby1_user_coeff.mat');
x_filtered= filter(b1,a1,x);
x=x_filtered;
Xk= fft(x);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);
Xkm_phase= angle(Xkm);

subplot(313);
plot(w, Xkm_mag);
title('Magnitude of Filtered signal')
xlabel('Frequency');
ylabel('MAgnitude');

