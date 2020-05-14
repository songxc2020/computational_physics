clear;clc;
m=1;h=1;
syms y(x) E V A B;
b=2*m*(V-E)/h^2;
equ=-h^2/(2*m)*diff(y,x,2)+V*y==E*y;
%E<V束缚态
y1(x)=subs(equ,[E,V],[2,4]); %E<V
y1_left(x)=dsolve(y1);
y1_right(x)=dsolve(y1);
y1(x)=subs(equ,[E,V],[2,0]);
y1_mid(x)=dsolve(y1);
plot()
%E>V散射态
%y2(x)=subs(y,[E,V],[2,1]); %E>V

%%
clear;clc;
m=1;h=1;V=4;E=2;a=5;
syms y(x) C1 C2 A B;
k_2=2*m*(V-E)/h^2;
k=sqrt(k_2);
y1_l(x)=C1*exp(k*x);
y1_m(x)=A*cos(x)+B*sin(x);
y1_r(x)=C1*exp(-k*x);