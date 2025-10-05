clc;
clear all;
close all;

fs= [1000 3000];
fp= [500 3500];
rp= 1;
rs= 80;

Fs=2.5*max(fp);
wp=2*fp/Fs;
ws=2*fs/Fs;

[N,wc]= buttord(wp,ws,rp,rs);
[a_bsf,b_bsf]= butter(N,wc,'stop');

figure(1);
freqz(a_bsf,b_bsf);
title(sprintf('freqz(a,b) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

figure(2);
subplot(211);
freqz(a_bsf,b_bsf, 4096); % Ensure consistent coefficient order
title(sprintf('freqz(a,b,4096) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

subplot(212);
[H, w] = freqz(a_bsf,b_bsf);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');


save('D:\B.E.(ECE)\semester 4\matlab programmes\BSFcoeff.mat', 'a_bsf', 'b_bsf');

% %******case2
% 
% fs= [200 500];
% fp= [150 550];
% rp= 1;
% rs= 120;
% 
% 
% Fs=2.5*max(fp);
% wp=2*fs/Fs;
% ws=2*fp/Fs;
% 
% [N,wc]= buttord(wp,ws,rp,rs);
% [a1,b1]= butter(N,wc,'stop');
% [H,w]= freqz(a1,b1);
% H1_mag= abs(H);
% 
% subplot(312);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - BSF  100523735060\n(fp=[%d %d], fs=[%d %d],  rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
