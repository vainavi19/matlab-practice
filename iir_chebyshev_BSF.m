clc;
clear all;
close all;


fp= [600 1000];
fs= [500 1100];
rp= 2;
rs= 40;

Fs=20*max(fp);
wp=2*fp/Fs;
ws=2*fs/Fs;
 
[N, wc] = cheb1ord(wp, ws, rp, rs);
[a_bsf_c, b_bsf_c] = cheby1(N, rp, wp, 'stop'); 
% [N, wc] = cheb2ord(wp, ws, rp, rs);
% [a_bsf_c, b_bsf_c] = cheby2(N, rs, ws, 'stop');

figure(1);
freqz(a_bsf_c, b_bsf_c);
title(sprintf('freqz(a,b) - BSF  100523735060\n(fp=[%d %d], fs=[%d %d], rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

figure(2);
subplot(212);
freqz(a_bsf_c, b_bsf_c, 4096); % Ensure consistent coefficient order
title(sprintf('freqz(a,b,4096) - BSF  100523735060\n(fp=[%d %d], fs=[%d %d], rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

subplot(212);
[H, w] = freqz(a_bsf_c, b_bsf_c);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - BSF  100523735060\n(fp=[%d %d], fs=[%d %d], rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');



save('D:\B.E.(ECE)\semester 4\matlab programmes\BSFcoeff_chebyshev.mat','a_bsf_c', 'b_bsf_c');
