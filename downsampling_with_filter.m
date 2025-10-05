clc; clear; close all;

M = 100;

% Step 1: Original signal (e.g., FIR filter as spectrum)
freq = [0 0.4 0.45 1];
mag = [0 1 0 0];
x = fir2(99, freq, mag);  % Design FIR filter as input signal
[H, w] = freqz(x, 1, 512);  % Frequency response

% Step 2: Anti-aliasing filter (lowpass)
wc = pi / M;  % Ideal cutoff after upsampling
w = wc / pi;  % Normalize w.r.t Nyquist
h_filter = fir1(99, w, 'low');  % Linear phase lowpass FIR
[H_filter, w_filter] = freqz(h_filter, 1, 512);    % Frequency response

% Step 3: Filter the input signal
x_filtered = conv(x, h_filter);  % Apply anti-aliasing filter
[H_final, w_final] = freqz(x_filtered, 1, 512);  % Frequency response

% Step 4: Downsampling by M 
x_down= x_filtered(1:M:end) ;
[H_down, w_down] = freqz(x_down, 1, 512);  % Frequency response of upsampled signal


% Step 5: Plotting
figure;

subplot(4,1,1);
plot(w/pi, abs(H));
title('Original Signal Spectrum');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(4,1,2);
plot(w_down/pi, abs(H_down), 'LineWidth', 1.2);
title(['Upsampled by ', num2str(M), ' (with zero-insertion)']);
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
