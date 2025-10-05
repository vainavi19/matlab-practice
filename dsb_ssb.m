clc;
clear all;
close all;

%% DSB 
cycles=100;
fc= 1000; ac=5;
fm= 100; am=5;
fs= 10*fc;
t=0:1/fs: cycles/fm;

m= cos(2*pi*fm*t);
c= cos(2*pi*fc*t);

s1= (1+ (am/ac)*m).*c;
s2= (1- (am/ac)*m).*c;

dsb= s1-s2;

M= fftshift(fft(m));
C= fftshift(fft(c));
s_dsb= fftshift(fft(dsb));
w= linspace(-fs/2, fs/2, length(s_dsb));

figure (1);
subplot(311);
plot(w, abs(M));

subplot(312);
plot(w, abs(C));

subplot(313);
plot(w, abs(s_dsb));

%% SSB

s_ussb= (ac*am/2)*cos(2*pi*(fc+fm)*t);
s_lssb= (ac*am/2)*cos(2*pi*(fc-fm)*t);

figure(2);
S_USSB= fftshift(fft(s_ussb));
S_LSSB= fftshift(fft(s_lssb));
w_ssb= linspace(-fs/2, fs/2, length(s_ussb));

subplot(411);
plot(w_ssb, abs(M));

subplot(312);
plot(w_ssb, abs(C));

subplot(413);
plot(w_ssb, abs(S_USSB));

subplot(414);
plot(w_ssb, abs(S_LSSB));



