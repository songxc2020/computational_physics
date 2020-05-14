a=1;b=0.05;
%定义水星进动方程
F=@(theta,u)[u(2);-u(1)+a+b*u(1)^2];
%画太阳
line(0,0,'marker','.','markersize',30,'color','r');
axis equal
hold on
[theta,u]=ode45(F,0:pi/100:36*pi,[0.1 0]);
[X,Y]=pol2cart(theta,1./u(:,1)); %极坐标转换直角坐标
plot(X,Y) %运动轨迹作图