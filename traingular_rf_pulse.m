clc;
clear;
close all;

% Parameters
fc = 100;               % Carrier frequency (Hz)
fs = 10 * fc;           % Sampling frequency
t = 0:1/fs:1;           % Time vector

% Generate 1-cycle triangular waveform using triang
t_en= triang(length(t))';
c= cos(2*pi*fc*t);
s=t_en.*c;

figure(1);
subplot 311
plot(t,t_en);
title('Triangular Envelope');
xlabel('Time (s)');
ylabel('Amplitude');

subplot 312
plot(t,c);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot 313
plot(t,s);
title('Triangular RF Pulse (1 Second)');
xlabel('Time (s)');
ylabel('Amplitude');
