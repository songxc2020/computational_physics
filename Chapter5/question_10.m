clear;clc;
%利用dsolve求解
syms y(t);
equ=diff(y,t)==-1000*(y-sin(t))+cos(t);
cond=y(0)==5;
u(t)=dsolve(equ,cond);
m=0:0.01:1;
figure(1)
plot(m,u(m));
title('精确解函数图像')
%%
%利用ode23和ode23s求解
F=@(t,u)[-1000*(u-sin(t))+cos(t)];
[t,y]=ode23(F,[0 1],1);
[ts,ys]=ode23s(F,[0 1],1);
figure(2)
hold on
plot(t,y,'r*','LineWidth',0.5)
plot(ts,ys,'ko','LineWidth',1)
title('ode23和ode23s求解比较')
legend({'ode23的解','ode23s的解'})