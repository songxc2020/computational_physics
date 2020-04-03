clear;clc;close all;
x=[-1.0 -0.75 -0.50 -0.25 0 0.25 0.50 0.75 1.00];
y=[-0.2209 0.3295 0.8826 1.4392 2.0003 2.5645 3.1334 3.7061 4.2836];
p=polyfit(x,y,1);
x1=linspace(-1.5,1.5);
y1=polyval(p,x1);
figure
plot(x,y,'o',x1,y1)
legend('data','linear fit')