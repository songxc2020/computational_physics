T=150;
r0=100;     %初始半径r0
theta0=0;   %初始theta角度
k=5000;       %k=G*M
E=[-20 0 20];   %行星不同的能量
v0=sqrt(2.*E+2*k/r0);  %行星的初速度
%行星运动轨迹方程
F=@(t,u)[u(2);u(1).*u(4).^2-k.*u(1).^-2;u(4);-2.*u(2).*u(4)./u(1)];
%星星轨迹作图前准备
figure
xlabel('x');ylabel('y');
axis([-300 150 -800 800]);
title('不同能量的行星围绕恒星的运动');
sun=line(0,0,'color','r','marker','.','markersize',20);
hold on
%能量E小于0的行星
[t,y]=ode45(F,0:0.01:T,[r0 0 0 v0(1)/r0]);
[X,Y]=pol2cart(y(:,3),y(:,1));
h1=plot(X,Y);
set(h1,'color','r')
%能量E等于0的行星
[t,y]=ode45(F,0:0.01:T,[r0 0 0 v0(2)/r0]);
[X,Y]=pol2cart(y(:,3),y(:,1));
X=[X,X];Y=[Y,-Y];
h2=plot(X,Y);
set(h2,'color','g')
%能量E大于0的行星
[t,y]=ode45(F,0:0.01:T,[r0 0 0 v0(3)/r0]);
[X,Y]=pol2cart(y(:,3),y(:,1));
X=[X,X];Y=[Y,-Y];
h3=plot(X,Y);
set(h3,'color','b');