%sinusoidal
clc;
clear all;
close all;

f0= input('enter frequency of sinusoidal signal(f0):');
q= input('enter number of cycles:');
fs=20*f0;
t=0:1/fs:q/f0;
y0=sin(2*pi*f0*t);

%subplot(312);
stem(t,y0);
title('Sinusoidal of frequency f0');
xlabel('Time');
ylabel('Amplitude');

