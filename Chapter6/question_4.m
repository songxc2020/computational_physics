clear;clc;
delta_x=0.1;delta_t=0.001;
x=0:delta_x:1;
t=0:delta_t:0.5;
a2=1;
r=delta_t/delta_x^2*a2;
u=zeros(length(x),length(t));
u(2:length(x)-1,1)=sin(pi.*x(2:end-1));
u(1,:)=0;u(length(x),:)=0;
for j=1:length(t)-1
    u(2:length(x)-1,j+1)=(1-2*r)*u(2:length(x)-1,j)+r*(u(1:length(x)-2,j)+u(3:length(x),j));
    plot(x,u(:,j));
    axis([0,1,0,1]);
    pause(0.01)
end
[X,T]=meshgrid(t,x);
meshz(X,T,u)