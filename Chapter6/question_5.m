clear;clc;
dx=0.02;
dt=0.01; c=dt*dt/dx/dx;
x=0:dx:2;
x=x';
t=0:dt:10;
Nx=length(x);
Nt=length(t);
u=zeros(Nx,Nt);
u(1,:)=0;
u(Nx,:)=0.2*sin(pi*t);
u(1:Nx,1)=0;
u(2:Nx-1,2)=u(2:Nx-1,1)+c/2*(u(3:Nx,1)-2*u(2:Nx-1,1)+u(1:Nx-2,1));
h=plot(x, u(:,1),'linewidth', 3);
uu=u;
for k=2:Nt
    uu(2:Nx-1,k)=u(2:Nx-1,2);
    u(Nx,2)=u(Nx,k);
    u(2:Nx-1,3)=2*u(2:Nx-1,2)-u(2:Nx-1,1)+c*(u(3:Nx,2)-2*u(2:Nx-1,2)+u(1:Nx-2,2));
    u(2:Nx-1,1)=u(2:Nx-1,2);
    u(2:Nx-1,2)=u(2:Nx-1,3);
end
for j=1:Nt
    plot(x, uu(:,j),'linewidth', 3);
    axis([0,2,-0.5,0.5]);
    drawnow()
end