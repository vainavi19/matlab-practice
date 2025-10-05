clc;
clear all;
close all;

f0=input('enter freq of input signal:');
a0=input('enter amplitude of input signal:');
n=input('enter no.of cycles:');

fs=100*f0;
t=0:1/fs:n/f0;
x=a0*sin(2*pi*f0*t);
figure;
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
title('Magnitude 100523735060')
xlabel('Frequency');
ylabel('Amplitude');

subplot(313);
plot(w,Xkm_phase);
title('Phase  100523735060')
xlabel('Frequency');
ylabel('Phase');