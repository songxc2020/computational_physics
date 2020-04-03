clear;close all;clc;
x=[0.3871 0.7233 1.0000 1.5237 5.2028 9.5388];
y=[0.2408 0.6152 1.0000 1.8808 11.862 29.475];
%幂函数拟合
subplot(2,2,1)
p=fit(x',y','Power1');
plot(p,x,y,'o')
legend('Data','Power Fit')
title('Power Fit')
%三次多项式拟合
subplot(2,2,2)
p=fit(x',y','poly3');
plot(p,x,y,'o')
legend('Data','Polynomial Fit')
title('Polynomial Fit')
%1项傅里叶级数拟合
subplot(2,2,3)
p=fit(x',y','fourier1');
plot(p,x,y,'o')
legend('Data','Fourier Fit')
title('Fourier Fit')
%指数拟合
subplot(2,2,4)
p=fit(x',y','exp2');
plot(p,x,y,'o')
legend('Data','Exponential Fit')
title('Exponential Fit')