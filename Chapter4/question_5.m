clear;clc;close all;
x=[1 2 3 4 5 6 7 8];
y=[15.3 20.5 27.4 36.6 49.1 65.6 87.87 117.6];
%y=b*e^(ax)
lny=log(y);  %lny=a*x+lnb
p=polyfit(x,lny,1)
b=exp(p(2));
a=p(1);
xp=linspace(1,8);
yp=b*exp(1).^(a*xp);
plot(x,y,'o',xp,yp)