clc; clear; close all;

% Step 1: Original signal (e.g., FIR filter as spectrum)
freq = [0 0.4 0.45 1];
mag = [0 1 0 0];
x = fir2(99, freq, mag);  % Design FIR filter as input signal
[H, w] = freqz(x, 1, 512);  % Frequency response

% Step 2: Upsampling by L (zero-stuffing)
L = 40;
x_up = zeros(1, L * length(x));
x_up(1:L:end) = x;
[H_up, w_up] = freqz(x_up, 1, 512);  % Frequency response of upsampled signal

% Step 3: Anti-imaging filter (lowpass)
wc = pi / L;  % Ideal cutoff after upsampling
w = wc / pi;  % Normalize w.r.t Nyquist
h_filter = fir1(99, w, 'low');  % Linear phase lowpass FIR
[H_filter, w_filter] = freqz(h_filter, 1, 512);    % Frequency response

% Step 4: Filter the upsampled signal
x_filtered = conv(x_up, h_filter, 'same');  % Apply anti-imaging filter
[H_final, w_final] = freqz(x_filtered, 1, 512);  % Frequency response

% Step 5: Plotting
figure;

subplot(4,1,1);
plot(w/pi, abs(H));
title('Original Signal Spectrum');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(4,1,2);
plot(w_up/pi, abs(H_up), 'LineWidth', 1.2);
title(['Upsampled by ', num2str(L), ' (with zero-insertion)']);
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(4,1,3);
plot(w_filter/pi, abs(H_filter), 'LineWidth', 1.2);
title('Anti-Imaging Filter Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(4,1,4);
plot(w_final/pi, abs(H_final), 'LineWidth', 1.2);
title('Final Output after Filtering (Anti-Imaging)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;
