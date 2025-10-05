clc;
clear all;
close all;


f02=500;
f03=800;
f04=2000;
a0=2;
n=3;

fs=20*f04;
t=0:1/fs:n/f02;
x=a0*(sin(2*pi*f02*t) + sin(2*pi*f03*t) + sin(2*pi*f04*t));

subplot(411);
stem(t,x);
title(sprintf('Input signal  100523735060 \n(f01=%d, f02=%d, f04=%d a0=%d, n=%d)', f02, f04, a0, n));
xlabel('Time');
ylabel('Amplitude');

%*************Calculating the spectrum*************
Xk= fft(x);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);
%Xkm_phase= angle(Xkm);

subplot(412);
plot(w, Xkm_mag);
title('Magnitude of Spectrum 100523735060')
xlabel('Frequency');
ylabel('Magnitude');

%*************Calculating the filtered spectrum - BPF ************
% load('BPFcoeff.mat');
% x_filtered= filter(a_bpf,b_bpf,x);

load('BPFcoeff_chebyshev.mat');
x_filtered= filter(a_bpf_c, b_bpf_c,x);

Xk= fft(x_filtered);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);

subplot(413);
plot(w, Xkm_mag);
title(sprintf('Magnitude of Filtered Spectrum - BPF 100523735060\n(fp= [100 300], fs= [50 350], rp= 1, rs= 80)'));
xlabel('Frequency');ylabel('Magnitude');

%*************Calculating the filtered spectrum - BSF ************
% load('BSFcoeff.mat');
% x_filtered= filter(a_bsf,b_bsf,x);


load('BSFcoeff_chebyshev.mat');
x_filtered= filter(a_bsf_c, b_bsf_c,x);

Xk= fft(x_filtered);
Xkm= fftshift(Xk);

w=linspace(-fs/2,fs/2, length(Xk));

Xkm_mag= abs(Xkm);

subplot(414);
plot(w, Xkm_mag);
title(sprintf('Magnitude of Filtered Spectrum - BSF 100523735060\n(fp= [50 350], fs= [100 300], rp= 1, rs= 80)'));
xlabel('Frequency');ylabel('Magnitude');


