clc;
clear all;
close all;

%CASCADE 1
% ****** LHS ******
freq=[0,0.18,0.2,1]; %frequency-domain representation of input signal x
mag=[1,1,0,0];
x=fir2(101,freq,mag); %generating input time-domain seq by frequency sampling
[Xz,w]=freqz(x,1);

subplot(411); %plot input seq Xz
title('Input sequence'); 
xlabel('time'); ylabel('amplitude');
plot(w/pi, abs(Xz));

xd=downsample(x,3); %downsampling
[Xzd,w]=freqz(xd,1);

subplot(412); %plot down-sampled input seq Xzd
title('LHS- Downsampled sequence(by 3)'); 
xlabel('time'); ylabel('amplitude');
plot(w/pi, abs(Xzd));

h=fir1(21,0.6); %filter
y1=filter(h,1,xd);
[Y1,w]=freqz(y1,1);

subplot(413); %plot down-sampled and filtered signal i.e output y1
title('LHS- Downsampled & Filtered sequence'); 
xlabel('time'); ylabel('amplitude');
plot(w/pi, abs(Y1));

% ****** RHS ******
hu=upsample(h,3); %up-sample filter
v=filter(hu,1,x);
yout=downsample(v,3);
[Y2,w]= freqz(yout,1);
subplot(414);
title('RHS- Downsampled sequence (by 3)'); 
xlabel('time'); ylabel('amplitude');
plot(w/pi, abs(Y2));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %CASCADE 2
% % ****** LHS ******
% freq=[0,0.18,0.2,1]; %frequency-domain representation of input signal x
% mag=[1,1,0,0];
% x=fir2(101,freq,mag); %generating input time-domain seq by frequency sampling
% [Xz,w]=freqz(x,1);
% subplot(411); %plot input seq Xz
% title('Input sequence'); 
% xlabel('time'); ylabel('amplitude');
% plot(w/pi, abs(Xz));
% 
% h=fir1(21,0.45);    %filter
% y1=filter(h,1,x);
% [Y1,w]=freqz(y1,1);
% subplot(412);      %filtered input signal 
% title('LHS- Filtered Input Sequence'); 
% xlabel('time'); ylabel('amplitude');
% plot(w/pi, abs(Y1));
% 
% xu=upsample(x,4);          %upsampling
% [Xzu,w]=freqz(xu,1);
% subplot(413);              %plot filtered + upsampled input seq Xzd
% title('LHS- y[n]'); 
% xlabel('time'); ylabel('amplitude');
% plot(w/pi, abs(Xzu));
% 
% % ****** RHS ******
% hu=upsample(h,4); %up-sample filter
% v=filter(hu,1,x);
% yout=upsample(v,4);
% [Y2,w]= freqz(yout,1);
% subplot(414);
% title('RHS- Upsampled sequence (by 3)'); 
% xlabel('time'); ylabel('amplitude');
% plot(w/pi, abs(Y2));