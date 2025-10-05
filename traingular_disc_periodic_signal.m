% Parameters
F = 200;                  % Frequency in Hz → T = 1/F = 5 ms
Fs = 40 * F;             % Sampling frequency (ensure oversampling)
cycles = 5;               % Number of cycles to generate
T = 1 / F;                % Period in seconds
t= 0:1/Fs:cycles/F- 1/Fs;

% Derived values
N = round(T * Fs);        % Number of samples per period

% One period of the triangular waveform
half_N = floor(N / 2);   % Half-period
tri_half_up = [linspace(0, 1, (half_N)/2) , linspace(1, 0, half_N - (half_N)/2)];
tri_half_dwn = [linspace(0, -1, (half_N)/2) , linspace(-1, 0, half_N - (half_N)/2)];
tri_half= [tri_half_up, tri_half_dwn];

% Repeat to form full signal
tri_full = repmat(tri_half, 1, cycles);

% Plot
stem(t * 1000, tri_full, 'filled');  % Time in milliseconds
xlabel('Time (ms)');
ylabel('Amplitude');
title('Triangular Discrete-Time Periodic Signal (T = 5 ms)');
grid on;
