clear;close all;clc;
x=0.1:0.1:2;
y=1.7*x.^(3)+2*rand(1,length(x));
lny=log(y);  %lny=a*x+lnb
p=polyfit(x,lny,1)
b=exp(p(2));
a=p(1);
xp=linspace(x(1),x(end));
yp=b*exp(1).^(a*xp);
plot(x,y,'o',xp,yp)