clc;
clear all;
close all;

range = input('Enter range: ');
a = input('Enter value of a (0 < a < 1): ');
n = -range:range;  % Define the time index vector

% **** a^x ****
e1 = a.^n;  % Compute for all n
e1(n > 0) = 0; % Zero out for positive indices

subplot(222);
stem(n, e1);
axis([-range, range, -1, max(e1)]); % Corrected y-limits
title('a^n');
xlabel('Time');
ylabel('Amplitude');

% **** a^-x ****
e2 = a.^(-n); % Compute for all n
e2(n < 0) = 0; % Zero out for negative indices

subplot(221);
stem(n, e2);
axis([-range, range, -1, max(e2)]); % Corrected y-limits
title('a^{-n}');
xlabel('Time');
ylabel('Amplitude');

% **** -a^x ****
e3 = -a.^n; % Compute for all n
e3(n > 0) = 0; % Zero out for positive indices

subplot(224);
stem(n, e3);
axis([-range, range, min(e3), 1]); % Corrected y-limits
title('-a^n');
xlabel('Time');
ylabel('Amplitude');

% **** -a^-x ****
e4 = -a.^(-n); % Compute for all n
e4(n < 0) = 0; % Zero out for negative indices

subplot(223);
stem(n, e4);
axis([-range, range, min(e4), 1]); % Corrected y-limits
title('-a^{-n}');
xlabel('Time');
ylabel('Amplitude');
