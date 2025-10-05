clc;
clearvars;
close all;

x = input('Enter sequence: ');

% Step 1: Determine the length of the output signal
m = length(x);
l = 2*m - 1;  % Corrected length

% Step 2: Append zeros at the end of x1 and at the beginning of x2
x2 = [x, zeros(1, m-1)];
x1 = [zeros(1, m-1), x];

% Step 3: Compute the correlation using shifting and multiplication
y = zeros(1, l);  % Preallocate output vector

for i = 1:l
    x2_s = [zeros(1,i-1), x2(1:end-i+1)]; % Correct shift
    y(i) = sum(x1 .* x2_s);
end

% Step 4: Display results
disp('User-defined logic output:');
disp(y);

disp('Predefined logic output:');
disp(xcorr(x));

% Step 5: Plot the waveforms
figure;

subplot(2,1,1);
stem(0:m-1, x);
title('Input Sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2);
stem(0:l-1, y);
title('Output Sequence');
xlabel('Time');
ylabel('Amplitude');

