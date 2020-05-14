clear;clc;
XS10=0.52;XS20=0.35;XS30=-0.53;     %初始位移
m=3; M=4;k=50;
F=@(t,y)[y(4);
         y(5);
         y(6);
         k/m*(y(2)-y(1));
         k/M*(y(3)-y(2))-k/M*(y(2)-y(1));
         k/m*(y(2)-y(3))];
[t,u]=ode45(F,0:0.01:33,[XS10,XS20,XS30,0,0,0]);
%画三个质点的位移
subplot(3,1,1);
plot(t(1:2000),u(1:2000,1))
title('耦合震动曲线')
xlabel('Time(s)');ylabel('Distance(m)');
subplot(3,1,2);
plot(t(1:2000),u(1:2000,2))
xlabel('Time(s)');ylabel('Distance(m)');
subplot(3,1,3);
plot(t(1:2000),u(1:2000,3))
xlabel('Time(s)');ylabel('Distance(m)');
%傅里叶变换求本征频率
Y=fft(u(:,1));
Y(1)=[];
n=length(Y)/2;
power=abs(Y(1:n)).^2/(length(Y).^2);
freq=100*(1:n)/length(Y);
power1=power;
[id1,daa1]=max(power1);
power1(daa1)=0;
[id2,daa2]=max(power1);
WF=2*pi*[freq(daa1),freq(daa2)];

figure
plot(2*pi*freq(1:100),power(1:100))
hold on
title('功率谱')
xlabel('\omega /s^{1}');ylabel('P / m^2')
plot(WF,[power(daa1),power(daa2)],'r','markersize',40)
text(5,7.5e-3,'Frequency1=3.9984')
text(7,6e-3,'Frequency2=6.4736')
