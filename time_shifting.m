clc;
clear all;
close all;

x=input('enter causal input sequence:');
n0=input('enter time shift factor:');

n=0:length(x)-1;
subplot(311);
stem(n,x);
title('Input Sequence');
xlabel('Time');
ylabel('Amplitude');

n=0-n0:length(x)-1-n0;
subplot(312);
stem(n,x);
title('Advanced Input Sequence');
xlabel('Time');
ylabel('Amplitude');

n=0+n0:length(x)-1+n0;
subplot(313);
stem(n,x);
title('Delayed Input Sequence');
xlabel('Time');
ylabel('Amplitude');