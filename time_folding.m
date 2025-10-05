clc;
clear all;
close all;

x=input('enter causal input sequence:');

n=0:length(x)-1;
subplot(211);
stem(n,x);
title('Input Sequence');
xlabel('Time');
ylabel('Amplitude');

n1=-1*n;
subplot(212);
stem(n1,x);
title('Time folded Sequence');
xlabel('Time');
ylabel('Amplitude');