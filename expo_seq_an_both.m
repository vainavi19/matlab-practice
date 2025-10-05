clc;
clear all;
close all;

range = input('Enter range: ');
a = input('Enter value of a (0 < a < 1): ');
n = -range:range;  % Define the time index vector

% **** a^x + a^-x ****
e1 = a.^n + a.^(-n);  % Compute for all n

subplot(411);
stem(n, e1);
axis([-range, range, min(e1)-3, max(e1)+3]); % Corrected y-limits
title('a^x + a^{-x}');
xlabel('Time');
ylabel('Amplitude');

% **** -a^x - a^-x ****
e2 = -a.^n - a.^(-n); % Compute for all n

subplot(412);
stem(n, e2);
axis([-range, range, min(e2)-3, max(e2)+3]); % Corrected y-limits
title('-a^x - a^{-x}');
xlabel('Time');
ylabel('Amplitude');

% **** a^x - a^-x ****
e3 = a.^n - a.^(-n);  % Compute for all n

subplot(413);
stem(n, e3);
axis([-range, range, min(e3)-3, max(e3)+3]); % Corrected y-limits
title('a^x - a^{-x}');
xlabel('Time');
ylabel('Amplitude');

% **** -a^x + a^-x ****
e4 = -a.^n + a.^(-n); % Corrected equation

subplot(414);
stem(n, e4);
axis([-range, range, min(e4)-3, max(e4)+3]); % Corrected y-limits
title('-a^x + a^{-x}');
xlabel('Time');
ylabel('Amplitude');
