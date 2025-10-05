clc;
clear all;
close all;

fp= 300;
fs= 100;
rp= 1;
rs= 60;

Fs=20*fp;
wp=2*fp/Fs;
ws=2*fs/Fs;

[N1,wc]= buttord(wp,ws,rp,rs);
[ah,bh]= butter(N1,wc,'high');

% figure(1);
% freqz(ah, bh);
% title(sprintf('freqz(a,b) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% figure(2);
% subplot(212);
% freqz(ah, bh, 4096); % Ensure consistent coefficient order
% title(sprintf('freqz(a,b,4096) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');

subplot(212);
[H, w] = freqz(ah, bh);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');


save('D:\B.E.(ECE)\semester 4\matlab programmes\HPFcoeff.mat','ah','bh');


%******cas2
fp= 500;
fs= 100;
rp= 1;
rs= 40;

Fs=20*fs;
wp=2*fp/Fs;
ws=2*fs/Fs;

[N2,wc]= buttord(wp,ws,rp,rs);
[ah,b1]= butter(N2,wc,'high');
[H,w]= freqz(ah,b1);
H1_mag= abs(H);

subplot(312);
plot(w*Fs/(2*pi), 20*log10(H1_mag));
title(sprintf('Frequency Response - HPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

%*********case3
fp= 700;
fs= 100;
rp= 1;
rs= 40;

Fs=20*fs;
wp=2*fp/Fs;
ws=2*fs/Fs;

[N3,wc]= buttord(wp,ws,rp,rs);
[a2,b2]= butter(N3,wc,'high');
[H,w]= freqz(a2,b2);
H1_mag= abs(H);
subplot(313);
plot(w*Fs/(2*pi), 20*log10(H1_mag));
title(sprintf('Frequency Response - HPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');