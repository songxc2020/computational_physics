T=150;
r0=[10 50 100 150 200 250];     %初始半径r0
theta0=0;   %初始theta角度
k=5000;       %k=G*M
E=-20;   %行星不同的能量
v0=sqrt(2*E+2*k./r0);  %行星的初速度
%行星运动轨迹方程
F=@(t,u)[u(2);u(1).*u(4).^2-k.*u(1).^-2;u(4);-2.*u(2).*u(4)./u(1)];
%星星轨迹作图前准备
figure
xlabel('x');ylabel('y');
%axis([-300 150 -800 800]);
title('相同能量不同角动量的行星围绕恒星的运动');
sun=line(0,0,'color','r','marker','.','markersize',20);
hold on
for i=1:length(r0)
    [t,y]=ode45(F,0:0.01:T,[r0(i) 0 0 v0(i)/r0(i)]);
    [X,Y]=pol2cart(y(:,3),y(:,1));
    plot(X,Y);
end