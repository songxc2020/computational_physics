clear;clc;close all;
x=0:0.1:2;
y=[0 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0 0 0 0 0 0 0 0 0 0];
%8个不同的傅里叶级数拟合
for m=1:8
    subplot(2,4,m)
    f=fit(x',y',['fourier',num2str(m)]);
    plot(f,x,y)
    legend('Data',[num2str(m),' terms'])
    title(['Fourier Fit with',num2str(m),' terms'])
end

%保形内插法拟合
x=0:0.1:2;
y=[0 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0 0 0 0 0 0 0 0 0 0];
figure
xq=linspace(0,2);
yq = interp1(x,y,xq,'pchip');
plot(x,y,'o',xq,yq,':.r')
legend('data','Spline Interpolation')

%fft and ifft
x=0:0.1:2;
y=[0 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0 0 0 0 0 0 0 0 0 0];
f=fft(y);
ff=ifft(f);
plot(x,ff)