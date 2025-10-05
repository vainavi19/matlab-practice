clc;
clearvars;
close all;

x = input('Enter 1st sequence: ');
h = input('Enter 2nd sequence: ');

% Step 1: Determine the length of the output signal
m = length(x);
n = length(h);
op_len = m + n - 1; % Corrected length

% Step 2: prepend zeros at the end of sequences for convolution
xm = [zeros(1, n-1),x];
hm = [zeros(1, m-1),h];

% Step 3: Fold h[n]
hr = fliplr(hm); % Flipping the sequence

% Step 4: Compute convolution using shifting and multiplication
y = zeros(1, op_len); % Preallocate output vector

for i = 1:op_len
    hrm = [zeros(1,i-1), hr(1:end-i+1)]; 
    y(i) = sum(xm .* hrm);
end

% Step 5: Display results
disp('User-defined logic output:');
disp(y);


disp('Predefined logic output:');
disp(conv(x, h));

% Step 6: Plot the waveforms
figure;

subplot(3,1,1);
stem(0:m-1, x);
title('1st Input Sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,2);
stem(0:n-1, h);
title('2nd Input Sequence');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,3);
stem(0:op_len-1, y);
title('Output Sequence');
xlabel('Time');
ylabel('Amplitude');
