clc;
clear all;
close all;


fp= [600 1000];
fs= [500 1100];
rp= 2;
rs= 40;

Fs=20*max(fs);
wp=2*fp/Fs;
ws=2*fs/Fs;

[N, wc] = cheb1ord(wp, ws, rp, rs);
[a_bpf_c, b_bpf_c] = cheby1(N, rp, wp, 'bandpass');
% [N1, wc] = cheb1ord(wp, ws, rp, rs);
% [a_bpf_c, b_bpf_c] = cheby1(N1, rs, ws, 'bandpass');

% figure(1);
% freqz(a_bpf_c, b_bpf_c);
% title(sprintf('freqz(a,b) - BPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% figure(2);
% subplot(212);
% freqz(a_bpf_c, b_bpf_c, 4096); % Ensure consistent coefficient order
% title(sprintf('freqz(a,b,4096) - BPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');

subplot(311);
[H, w] = freqz(a_bpf_c, b_bpf_c);
H_mag = abs(H);
plot(w * Fs / (2 * pi), 20 * log10(H_mag));
title(sprintf('Frequency Response - BPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
xlabel('Frequency'); ylabel('Magnitude');



save('D:\B.E.(ECE)\semester 4\matlab programmes\BPFcoeff_chebyshev.mat','a_bpf_c', 'b_bpf_c');



% fp= [100 700];
% fs= [50 800];
% rp= 1;
% rs= 40;
% 
% Fs=2.5*max(fs);
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N2, wc] = cheb2ord(wp, ws, rp, rs);
% [a_bpf_c, b_bpf_c] = cheby2(N2, rs, ws, 'bandpass');
% 
% [H,w]= freqz(a_bpf_c, b_bpf_c);
% H1_mag= abs(H);
% subplot(312);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - BPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
% 
% %*********
% 
% fp= [100 700];
% fs= [50 1000];
% rp= 1;
% rs= 40;
% 
% 
% Fs=2.5*max(fs);
% wp=2*fp/Fs;
% ws=2*fs/Fs;
% 
% 
% [N3, wc] = cheb2ord(wp, ws, rp, rs);
% [a_bpf_c, b_bpf_c] = cheby2(N3, rs, ws, 'bandpass');
% 
% [H,w]= freqz(a_bpf_c, b_bpf_c);
% H1_mag= abs(H);
% subplot(313);
% plot(w*Fs/(2*pi), 20*log10(H1_mag));
% title(sprintf('Frequency Response - BPF  100523735060\n(fp=%d, fs=%d, rp=%d, rs=%d)', fp, fs, rp, rs));
% xlabel('Frequency'); ylabel('Magnitude');
