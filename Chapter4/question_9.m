clear;clc;close all;
y=@(x)x^4-4*x^3-6*x^2-16*x+4;
x0=fzero(y,[-1 4])
[minx,miny]=fminbnd(y,-1,4)
figure;
x=linspace(-1,4);
f=x.^4-4*x.^3-6*x.^2-16*x+4;
plot(x,f)