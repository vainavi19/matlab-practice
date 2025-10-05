clc;
clear all;
close all;

% Get user inputs
t_dwn = input('Enter the downsampling factor (time domain): ');
t_up = input('Enter the upsampling factor (time domain): ');
f_dwn = input('Enter the upsampling factor (frequency domain): ');
f_up = input('Enter the downsampling factor (frequency domain): ');

%% TIME DOMAIN DOWNSAMPLING
n = 0:49;
x = sin(2*pi*0.031*n);  % input signal
y_t_dwn = x(1:t_dwn:end);  % down-sampled

figure(1);
subplot(2,1,1);
stem(n, x);
%axis([0 50 -1.2 1.2]);
title('Time Domain: Input sequence 100523735060');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2);
stem(0:length(y_t_dwn)-1, y_t_dwn);
%axis([0 50 -1.2 1.2]);
title(['Time Domain: Down-Sampled by ', num2str(t_dwn)]);
xlabel('Time');
ylabel('Amplitude');

%% TIME DOMAIN UPSAMPLING
n = 0:50;
x = sin(2*pi*0.031*n);
y_t_up = zeros(1, t_up * length(x));
y_t_up(1:t_up:end) = x;

figure(2);
subplot(2,1,1);
stem(n, x);
title('Time Domain: Original Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2);
stem(0:length(y_t_up)-1, y_t_up);
title(['Time Domain: Up-Sampled by ', num2str(t_up)]);
xlabel('Time');
ylabel('Amplitude');

%% FREQUENCY DOMAIN DOWNSAMPLING
freq = [0 0.45 0.5 1];
mag = [0 1 0 0];
x = fir2(99, freq, mag);
[H, w] = freqz(x, 1, 512);

y_f_dwn = x(1:f_dwn:end);
[Hd, wd] = freqz(y_f_dwn, 1, 512);

figure(3);
subplot(3,1,1);
plot(w/pi, abs(H));
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Domain: Original Spectrum');

subplot(4,1,2);
plot(wd/pi, abs(Hd));
xlabel('Normalized Frequency');
ylabel('Magnitude');
title(['Frequency Domain: Down-Sampled by ', num2str(f_up)]);

%% FREQUENCY DOMAIN UPSAMPLING
x = fir2(99, freq, mag);
[H, w] = freqz(x, 1, 512);

y_f_up = zeros(1, f_up * length(x));
y_f_up(1:f_up:end) = x;
[Hu, wu] = freqz(y_f_up, 1, 512);

figure(4);
subplot(2,1,1);
plot(w/pi, abs(H));
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Domain: Original Spectrum');

subplot(2,1,2);
plot(wu/pi, abs(Hu));
xlabel('Normalized Frequency');
ylabel('Magnitude');
title(['Frequency Domain: Up-Sampled by ', num2str(f_dwn)]);
