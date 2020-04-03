clear;close all;clc;
f=@(x)x(1)^2+25*x(2)^2-2*x(1)+50*x(2)+25;
[xymin,fmin]=fminsearch(f,[2 3])