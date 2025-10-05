clc;
clear all;
close all;


fp= [1000 3000];
fs= [500 3500];
rp= 1;
rs= 80;

Fs=2.5*max(fs);
wp=2*fp/Fs;
ws=2*fs/Fs;

[N,wc]= buttord(wp,ws,rp,rs);
[a_bpf,b_bpf]= butter(N,wc,'bandpass');

figure(1);
freqz(a_bpf,b_bpf);
title(sprintf('freqz(a,b) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

figure(2);
subplot(211);
freqz(a_bpf,b_bpf, 4096); % Ensure consistent coefficient order
title(sprintf('freqz(a,b,4096) - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');

subplot(212);
[H, w] = freqz(a_bpf,b_bpf);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - LPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');


save('D:\B.E.(ECE)\semester 4\matlab programmes\BPFcoeff.mat', 'a_bpf', 'b_bpf');
% %******case2
% fp= [200 500];
% fs= [150 550];
% rp= 1;
% rs= 20;
% 
% 
% Fs=2.5*max(fs);
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% [N,wc]= buttord(wp,ws,rp,rs);
% [a1,b1]= butter(N,wc,'bandpass');
% [H,w]= freqz(a1,b1);
% H1_mag= abs(H);
% 
% subplot(312);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - BPF  100523735060\n(fp=[%d %d], fs=[%d %d],  rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
