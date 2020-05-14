clear;clc;
omega=1.5;
dx=1/3;dy=1/5;
x=0:dx:2;
y=0:dy:1;
Nx=length(x);
Ny=length(y);
phi(:,Nx)=2*exp(1).^y';
phi(1,:)=x;
phi(Ny,:)=exp(1).*x;
for N=1:100
    for i=2:Ny-1
        for j=2:Nx-1
            ph=(phi(i+1,j)+phi(i-1,j)+phi(i,j+1)+phi(i,j-1));
            phi(i,j)=(1-omega)*phi(i,j)+0.25*omega*(ph-dx*dy*x(i)*exp(1)^y(i));
        end
    end
end
surf(x,y,phi,'EdgeColor','none')