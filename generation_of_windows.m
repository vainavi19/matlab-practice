clc;
clear all;
close all;

N= input('enter length of window:');
range=0:N;

w1=user_rectangle(N);
subplot(511);
plot(range,w1);
title(sprintf('Rectangle Window\n(Window Length = %d)', N));
xlabel('Samples'); ylabel('Magnitude');

w2=user_traingle(N);
subplot(512);
plot(range,w2);
title(sprintf('Triangle Window\n(Window Length = %d)', N));
xlabel('Samples'); ylabel('Magnitude');

w3=user_blackman(N);
subplot(513);
plot(range,w3);
title(sprintf('Blackman Window\n(Window Length = %d)', N));
xlabel('Samples'); ylabel('Magnitude');

w4=user_hamming(N);
subplot(514);
plot(range,w4);
title(sprintf('Hamming Window\n(Window Length = %d)', N));
xlabel('Samples'); ylabel('Magnitude');

w5=user_hanning(N);
subplot(515);
plot(range,w5);
title(sprintf('Hanning Window\n(Window Length = %d)', N));
xlabel('Samples'); ylabel('Magnitude');