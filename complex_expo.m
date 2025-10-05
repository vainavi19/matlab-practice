%complex exponential
clc;
clear all;
close all;

f1 = input('Enter the frequency of the complex exponential signal: ');
b= input('enter number of cycles:');
z1=input('enter decay rate:');
z2=input('enter rise rate:');

fs = 20 * f1; % Sampling frequency
t = 0:1/fs:b/f1; % Time vector

%decay 
y1 = exp(-z1*t).*cos( 2 * pi * f1 * t); 
% plot decaying complex expo
figure;
subplot(211);
stem(t, y1); 
title('Decaying Complex Exponential Sequence');
xlabel('Time');
ylabel('Amplitude');

%growing 
y2 = exp(z2*t).*cos( 2 * pi * f1 * t);
%plot growing complex expo
subplot(212);
stem(t, y2); 
title('Growing Complex Exponential Sequence');
xlabel('Time');
ylabel('Amplitude');