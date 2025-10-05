%unit_step
clc;
clear all;
close all;

range= input('enter range(unit_step):');
u=[];
n=-range:range;
for m=-range:range
    if m<0
        u=[u,0];
    else
        u=[u,1];
    end
end
subplot(311);
stem(n,u);
axis([-range,range,-1,1.5]);
title('Unit Step Sequence');
xlabel('Time');
ylabel('Amplitude');

%unit_impulse
%clc;
%clear all;
%close all;

range= input('enter range(unit_impulse):');
i=[];
n=-range:range;
for k=-range:range
    if k==0
        i=[i,1];
    else
        i=[i,0];
    end
end
subplot(312);
stem(n,i);
axis([-range,range,-1,1.5]);
title('Unit Impulse Sequence');
xlabel('Time');
ylabel('Amplitude');

%unit_ramp
%clc;
%clear all;
%close all;

range= input('enter range(unit_ramp):');
r=[];
n=-range:range;
for l=-range:range
    if l<0
        r=[r,0];
    else
        r=[r,l];
    end
end
subplot(313);
stem(n,r);
axis([-range,range,-2,15]);
title('Unit Ramp Sequence');
xlabel('Time');
ylabel('Amplitude');

