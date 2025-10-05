clc;
clear all;
close all;

fp = 100;
fs = 300;
rp = 1;
rs = 60;

Fs = 5 * fs;
wp = 2 * fp / Fs;
ws = 2 * fs / Fs;

% [N, wc] = cheb1ord(wp, ws, rp, rs);
% [alc, blc] = cheby1(N, rp, wp, 'low'); 
[N, wc] = cheb2ord(wp, ws, rp, rs);
[alc, blc] = cheby2(N, rs, ws, 'low');

% figure(1);
% freqz(alc, blc);
% title(sprintf('freqz(a,b) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% figure(2);
% subplot(212);
% freqz(alc, blc, 4096); % Ensure consistent coefficient order
% title(sprintf('freqz(a,b,4096) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');

subplot(311);
[H, w] = freqz(alc, blc);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');


save('D:\B.E.(ECE)\semester 4\matlab programmes\LPFcoeff_chebyshev.mat','alc','blc');

% %******
% fp= 100;
% fs= 300;
% rp= 1;
% rs= 100;
% 
% Fs=2.5*fs;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N, wc] = cheb2ord(wp, ws, rp, rs);
% [alc, blc] = cheby2(N, rs, ws, 'low');
% 
% [H,w]= freqz(alc,blc);
% H1_mag= abs(H);
% subplot(312);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% %*********
% fp= 100;
% fs= 300;
% rp= 1;
% rs= 400;
% 
% Fs=2.5*fs;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N, wc] = cheb2ord(wp, ws, rp, rs);
% [alc, blc] = cheby2(N, rs, ws, 'low');
% 
% [H,w]= freqz(alc,blc);
% H1_mag= abs(H);
% subplot(313);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');