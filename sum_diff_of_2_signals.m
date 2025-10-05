clc;
clear all;
close all;

x1=input('enter 1st causal input sequence:');
x2=input('enter 2nd causal input sequence:');

%plot 1st input sequence
n=0:length(x1)-1;
subplot(411);
stem(n,x1);
title('1st Input Sequence');
xlabel('Time');
ylabel('Amplitude');

%plot 2nd input sequence
n=0:length(x2)-1;
subplot(412);
stem(n,x2);
title('2nd Input Sequence');
xlabel('Time');
ylabel('Amplitude');

%plot sum of input sequences
x_sum=x1+x2;

n=0:length(x_sum)-1;
subplot(413);
stem(n,x_sum);
title('Sum(x1+x2) of given Input Sequences');
xlabel('Time');
ylabel('Amplitude');

%plot difference of input sequences
x_diff=x1-x2;

n=0:length(x_diff)-1;
subplot(414);
axis([-length(x_diff)-1, length(x_diff)+1, -12,1])
stem(n,x_diff);
title('Difference(x1-x2) of given Input Sequences');
xlabel('Time');
ylabel('Amplitude');

