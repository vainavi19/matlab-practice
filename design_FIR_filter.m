clc;
clear all;
close all;

% %for LPF and HPF
% fc= input('enter cutoff frequency:'); 
% N= input('enter length of filter:');
% Fs=10*fc;
% wc1=2*fc/Fs;


%for BPF and BSF
fc1= input('enter lower cutoff frequency:'); 
fc2= input('enter upper cutoff frequency:'); 
N= input('enter length of filter:');
Fs = 10 * max(fc1, fc2);
wc1 = 2 * fc1 / Fs;
wc2 = 2 * fc2 / Fs;

figure(1);
h1=fir1(N,[wc1,wc2], boxcar(N+1));
freqz(h1,1);

figure(2);
h2=fir1(N,[wc1,wc2], blackman(N+1));
freqz(h2,1);

figure(3);
h3=fir1(N,[wc1,wc2], bartlett(N+1));
freqz(h3,1);

figure(4);
h4=fir1(N,[wc1,wc2], hann(N+1));
freqz(h4,1);

figure(5);
h5=fir1(N,[wc1,wc2], hamming(N+1));
freqz(h5,1);




% h=fir1(N,wc1,'high', hamming(N+1)); %HPF
% h=fir1(N,[wc1, wc2], hamming(N+1)); %BPF
% h=fir1(N,[wc1, wc2],'stop', (N+1)); %BSF


