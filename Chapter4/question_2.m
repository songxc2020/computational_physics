clear;clc;close all;
x=[-3 -2 0 3 4];
y=[18 10 2 2 5];
p=polyfit(x,y,2);
x1=linspace(-5,5);
y1=polyval(p,x1);
figure
plot(x,y,'o',x1,y1)
legend('data','linear fit')