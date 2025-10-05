clc;
clear all;
close all;

fp= 100;
fs= 300;
rp= 1;
rs= 40;

Fs=20*fs;
wp=2*fp/Fs;
ws=2*fs/Fs;

[N,wc]= buttord(wp,ws,rp,rs);
[al,bl]= butter(N,wc);

figure(1);
freqz(al, bl);
title(sprintf('freqz(a,b) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

figure(2);
subplot(212);
freqz(al, bl, 4096); % Ensure consistent coefficient order
title(sprintf('freqz(a,b,4096) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

subplot(212);
[H, w] = freqz(al, bl);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

save('D:\B.E.(ECE)\semester 4\matlab programmes\LPFcoeff.mat','al','bl');

% %******
% fp= 100;
% fs= 300;
% rp= 1;
% rs= 100;
% 
% Fs=20*fs;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% [N,wc]= buttord(wp,ws,rp,rs);
% [a1,b1]= butter(N,wc);
% [H,w]= freqz(a1,b1);
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
% Fs=20*fs;
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% [N,wc]= buttord(wp,ws,rp,rs);
% [a2,b2]= butter(N,wc);
% [H,w]= freqz(a2,b2);
% H1_mag= abs(H);
% subplot(313);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');