
clc;
clear all;
close all;

x=input('enter causal input sequence:');
nc=input('enter time scale factor for compression (a>0):');
ne=input('enter time scale factor for expansion (0<a<1):');

n= length(x);
ip_len=0:length(x)-1;
subplot(311);
stem(ip_len,x);
title('Input Sequence');
xlabel('Time');
ylabel('Amplitude');

%time compression
ncm=0:1/nc:n(end)/nc;

% Initialize a new vector to store modified values of x
x_comp = []; 

% Assign values of x to the corresponding indices of x_new where n is an integer
for i = 0:1/nc:n(end)/nc 
    if mod(i, 1) == 0  % Check if n is an integer
        x_comp = [x_comp, x(i+1)];  % Assign corresponding value from x
    else
        x_comp = [x_comp, 0];  % Assign 0 if n is not an integer
    end
end

subplot(312);
stem(ncm,x_comp);
title('Scaled Sequence (Compression)');
xlabel('Time');
ylabel('Amplitude');

%time expansion
nem=0:1*ne:n(end)*ne;

% Initialize a new vector to store modified values of x
x_exp = []; 

% Assign values of x to the corresponding indices of x_new where n is an integer
for i = 0:1*ne:n(end)*ne 
    if mod(i, 1) == 0  % Check if n is an integer
        x_exp = [x_exp, x(i+1)];  % Assign corresponding value from x
    else
        x_exp = [x_exp, 0];  % Assign 0 if n is not an integer
    end
end


subplot(313);
stem(nem,x_exp);
title('Scaled Sequence (Expansion)');
xlabel('Time');
ylabel('Amplitude');