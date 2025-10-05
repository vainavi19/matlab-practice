clc;
clear all;
close all;


fp= 300;
fs= 100;
rp= 1;
rs= 60;

Fs=5*fp;
wp=2*fp/Fs;
ws=2*fs/Fs;

% [N, wc] = cheb1ord(wp, ws, rp, rs);
% [ahc, bhc] = cheby1(N, rp, wp, 'high');
[N, wc] = cheb2ord(wp, ws, rp, rs);
[ahc, bhc] = cheby2(N, rs, ws, 'high');



% figure(1);
% freqz(ahc, bhc);
% title(sprintf('freqz(a,b) - HPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% figure(2);
% subplot(212);
% freqz(ahc, bhc, 4096); % Ensure consistent coefficient order
% title(sprintf('freqz(a,b,4096) - HPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
subplot(311);
[H, w] = freqz(ahc, bhc);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - HPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

% ylim([-rp,rp]); %to check ripples in passband for Chebyshev1
ylim([-rs, rs]);

save('D:\B.E.(ECE)\semester 4\matlab programmes\HPFcoeff_chebyshev.mat','ahc','bhc');

% 
% %******
% fp= 500;
% fs= 100;
% rp= 1;
% rs= 40;
% 
% Fs=2.5*fp;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N, wc] = cheb2ord(wp, ws, rp, rs);
% [ahc, bhc] = cheby2(N, rs, ws, 'high');
% 
% [H,w]= freqz(ahc,bhc);
% H1_mag= abs(H);
% subplot(312);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% %*********
% fp= 1000;
% fs= 100;
% rp= 1;
% rs= 40;
% 
% Fs=2.5*fp;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N, wc] = cheb2ord(wp, ws, rp, rs);
% [ahc, bhc] = cheby2(N, rs, ws, 'high');
% 
% [H,w]= freqz(ahc,bhc);
% H1_mag= abs(H);
% subplot(313);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');