clc;
clear all;
close all;

fc= input('enter cutoff frequency:'); 
n= input('enter length of filter:');
fs=10*fc;
wc=2*fc/fs;

h1=fir1(n,wc,'high',user_rectangle(n));%rectangular window
h2=fir1(n,wc,'high',user_hamming(n));%hamming window
h3=fir1(n,wc,'high',user_hanning(n));%hanning window
h4=fir1(n,wc,'high',user_blackman(n));%Blackman window
h5=fir1(n,wc,'high',user_traingle(n));%Barlett window

[H1,w] = freqz(h1,1); %1 means 512 point dft
[H2,w] = freqz(h2,1);
[H3,w] = freqz(h3,1);
[H4,w] = freqz(h4,1);
[H5,w] = freqz(h5,1);

H1_mag=abs(H1);
H1_norm=H1_mag/max(H1_mag);
H2_mag=abs(H2);
H2_norm=H2_mag/max(H2_mag);
H3_mag=abs(H3);
H3_norm=H3_mag/max(H3_mag);
H4_mag=abs(H4);
H4_norm=H4_mag/max(H4_mag);
H5_mag=abs(H5);
H5_norm=H5_mag/max(H5_mag);

% frequency response with x-axis as frequency
figure(1);
plot((w*fs)/(pi*2),20*log10(H1_norm),'r',(w*fs)/(pi*2),20*log10(H2_norm),'m',(w*fs)/(pi*2),20*log10(H3_norm),'y',(w*fs)/(pi*2),20*log10(H4_norm),'b',(w*fs)/(pi*2),20*log10(H5_norm),'k');
legend('rectangular window','hamming window','hanning window','Blackman window','Barlett window');
title('Frequency Response with Frequency (Hz) 100523735060');
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');


% frequency response with x-axis as radians
figure(2);
plot(w,20*log10(H1_norm),'r',w,20*log10(H2_norm),'m',w,20*log10(H3_norm),'y',w,20*log10(H4_norm),'b',w,20*log10(H5_norm),'k');
legend('rectangular window','hamming window','hanning window','Blackman window','Barlett window');
title('Frequency Response with Radians  100523735060');
xlabel('Frequency (radians/sample)');ylabel('Magnitude (dB)');
