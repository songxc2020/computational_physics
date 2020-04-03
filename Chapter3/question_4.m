clear
a=1;    %圆环半径
q=1;    %电荷量
[x,y,z]=meshgrid(-1.5:0.08:1.5);
for k=1:41
    theta=pi/20*(k-1);
    R=sqrt((x-a*cos(theta)).^2+y.^2+(z-a*sin(theta)).^2);
    V0(:,:,:,k)=q./(2*pi.*R);
end
V=pi/40*trapz(V0,4);    %对dv积分分得到电势V
[Ex,Ey,Ez]=gradient(-V,0.08); %对电势求梯度得到电场
figure;
%绘制二维等势线
contourf(x(:,:,20),y(:,:,20),V(:,:,20),[0.4:0.05:0.55,0.57,0.6:0.1:0.8]);
%绘制电场
hold on
quiver(x(:,:,20),y(:,:,20),Ex(:,:,20),Ey(:,:,20),'k');
title('二维带电圆环的等势线和电场线')

%绘制三维等势面
figure;
alpha(0.3)
%第1层等势面
p2=patch(isosurface(x(:,:,1:20),y(:,:,1:20),z(:,:,1:20),V(:,:,1:20),0.43));
isonormals(x,y,z,V,p2)
alpha(0.3)
p2.FaceColor='blue';
p2.EdgeColor='none';
lighting none
%第2层等势面
p3=patch(isosurface(x(:,:,1:20),y(:,:,1:20),z(:,:,1:20),V(:,:,1:20),0.47));
isonormals(x,y,z,V,p3)
alpha(0.3)
p3.FaceColor='green';
p3.EdgeColor='none';
lighting none
%第3层等势面
p4=patch(isosurface(x(:,:,1:20),y(:,:,1:20),z(:,:,1:20),V(:,:,1:20),0.5));
isonormals(x,y,z,V,p4)
alpha(0.3)
p4.FaceColor='yellow';
p4.EdgeColor='none';
lighting none
view([24 63]);
title('三维带电圆环等势面')