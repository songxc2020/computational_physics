clear;clc;close all;
x=0:0.1:2;
y=1./(7-x.^2+x);
xq=linspace(0,2);
for n=1:4
    subplot(2,2,n)
    %有理函数拟合
    p=polyfit(x,y,n);
    y1=polyval(p,xq);
    %保形内插拟合
    y2=interp1(x,y,xq,"pchip");
    %画图
    plot(x,y,'.k',xq,y1,'r',xq,y2,'b')
    legend('Data',['polyfit',num2str(n)],'interp')
    title([num2str(n),'次多项式拟合'])
end