clc;
clear all;
close all;
fm = input('Enter message signal frequency (Hz): ');
fc = input('Enter carrier signal frequency (Hz): ');
T= 1;
Fs = 20 * fc; 
t = 0:(1/Fs):T;

% MI < 1
disp('For MI < 1, am1 < ac1');
am1 = input('Enter amplitude of message signal 1: ');
ac1 = input('Enter amplitude of carrier signal 1: ');
MI1 = am1 / ac1;

ym1 = am1 * cos(2*pi*fm*t);
yc1 = ac1 * cos(2*pi*fc*t);
y1 = ac1 * (1 + MI1 * cos(2*pi*fm*t)) .* cos(2*pi*fc*t);

subplot(311)
plot(t, ym1); title('Message Signal 1 (MI < 1)');
subplot(312)
plot(t, yc1); title('Carrier Signal 1');
subplot(313)
plot(t, y1); title('AM Waveform 1');

% MI = 1
disp('For MI = 1, am2 = ac2');
am2 = input('Enter amplitude of message signal 2: ');
ac2 = input('Enter amplitude of carrier signal 2: ');
MI2 = am2 / ac2;

ym2 = am2 * cos(2*pi*fm*t);
yc2 = ac2 * cos(2*pi*fc*t);
y2 = ac2 * (1 + MI2 * cos(2*pi*fm*t)) .* cos(2*pi*fc*t);

figure;
subplot(311)
plot(t, ym2); title('Message Signal 2 (MI = 1)');
subplot(312)
plot(t, yc2); title('Carrier Signal 2');
subplot(313)
plot(t, y2); title('AM Waveform 2');

%MI > 1
disp('For MI > 1, am3 > ac3');
am3 = input('Enter amplitude of message signal 3: ');
ac3 = input('Enter amplitude of carrier signal 3: ');
MI3 = am3 / ac3;

ym3 = am3 * cos(2*pi*fm*t);
yc3 = ac3 * cos(2*pi*fc*t);
y3 = ac3 * (1 + MI3 * cos(2*pi*fm*t)) .* cos(2*pi*fc*t);

figure;
subplot(311)
plot(t, ym3); title('Message Signal 3 (MI > 1)');
subplot(312)
plot(t, yc3); title('Carrier Signal 3');
subplot(313)
plot(t, y3); title('AM Waveform 3');