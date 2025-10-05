clc;
clear all;
close all;

x=input('enter causal input sequence:');
n0=input('enter amplitude scale factor:');

n=0:length(x)-1;
subplot(311);
stem(n,x);
title('Input Sequence');
xlabel('Time');
ylabel('Amplitude');

x1=n0*x;
subplot(312);
stem(n,x1);
title('Scaled Input Sequence');
xlabel('Time');
ylabel('Amplitude');
