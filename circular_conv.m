    clc;
    clear all;
    close all;
   
    x= input('enter 1st sequence:');
    h= input('enter 2nd sequence:');  
    
    % step1: determine the length of the output signal
    op_len= length(x); %same as input length
    
    % step2: flip the bits of h[n] i.e perform folding operation
    hr=[h(1),fliplr(h(2:end))];
    
    % step3: perform shit right of values 
    % (i) perform shit right of h[n]
    % (ii) multiplication of the x[n] and shifted sequence of h[n]
    for i=1:op_len
        hrm= circshift(hr, [0,i-1]);
        %hrm= circshift(hr,i-1);
    
        y(i)= sum(x.*hrm);
    end
    
    % step5: diaplay the output 
    display('User defined logic output:')
    y
    display('Predefined logic output:')
    cconv(x,h,op_len)

    subplot(3,1,1);
stem(0:op_len-1, x);
title('1st Input Sequence');
xlabel('Index');
ylabel('Amplitude');

subplot(3,1,2);
stem(0:op_len-1, h);
title('2nd Input Sequence');
xlabel('Index');
ylabel('Amplitude');

subplot(3,1,3);
stem(0:op_len-1, y);
title('Output Sequence (Circular Convolution)');
xlabel('Index');
ylabel('Amplitude');