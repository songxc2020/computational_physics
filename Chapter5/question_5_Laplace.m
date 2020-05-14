clear;clc;
syms k M m w XL10 real;

syms XL1(t);            %表示位移XL1
dXL1=diff(XL1,t,1);     %表示XL1的一阶导数
ddXL1=diff(XL1,t,2);    %表示XL1的二阶导数

syms XL2(t);            %表示位移XL2
dXL2=diff(XL2,t,1);     %表示XL2的一阶导数
ddXL2=diff(XL2,t,2);    %表示XL2的二阶导数

syms XL3(t);            %表示位移XL3
dXL3=diff(XL3,t,1);     %表示XL3的一阶导数
ddXL3=diff(XL3,t,2);    %表示XL3的二阶导数

%表示方程
eq1=m*ddXL1-k*(XL2-XL1);           
eq2=M*ddXL2+k*(XL2-XL1)-k*(XL3-XL2);
eq3=m*ddXL3+k*(XL3-XL2);
syms s;
%对方程进行拉普拉斯变换
L1=laplace(eq1,t,s);    
L2=laplace(eq2,t,s);    
L3=laplace(eq3,t,s);

%替换初值
NXL1=subs(L1,{XL1(0),XL2(0),XL3(0),dXL1(0),dXL2(0),...
     dXL3(0)},{XL10,0,0,0,0,0});
NXL2=subs(L2,{XL1(0),XL2(0),XL3(0),dXL1(0)',dXL2(0),...
     dXL3(0)},{XL10,0,0,0,0,0});   
NXL3=subs(L3,{XL1(0),XL2(0),XL3(0),dXL1(0),dXL2(0)',...
     dXL3(0)},{XL10,0,0,0,0,0});

%合并同类项
syms LXL1 LXL2 LXL3
NNXL1=subs(NXL1,{laplace(XL1(t),t,s),laplace(XL2(t),t,s),...
      laplace(XL3(t),t,s)},{LXL1,LXL2,LXL3});  %替换拉氏符号
CXL1=collect(NNXL1,LXL1);
NNXL2=subs(NXL2,{laplace(XL1(t),t,s),laplace(XL2(t),t,s),...
      laplace(XL3(t),t,s)},{LXL1,LXL2,LXL3});  %替换拉氏符号
CXL2=collect(NNXL2,LXL2);
NNXL3=subs(NXL3,{laplace(XL1(t),t,s),laplace(XL2(t),t,s),...
      laplace(XL3(t),t,s)},{LXL1,LXL2,LXL3});  %替换拉氏符号
CXL3=collect(NNXL3,LXL3);
%逆变换求位移XL1
[j1,j2,j3]=solve(CXL1,CXL2,CXL3,LXL1,LXL2,LXL3); %解变形后方程
XL1=ilaplace(j1,s,t);
XL2=ilaplace(j2,s,t);
XL3=ilaplace(j3,s,t);
%求数值结果
XL1=eval(subs(XL1,{m,M,k,XL10},{3,4,50,0.2}));
XL2=eval(subs(XL2,{m,M,k,XL10},{3,4,50,0.2}));
XL3=eval(subs(XL3,{m,M,k,XL10},{3,4,50,0.2}));
%解数值化
XL1=vpa(XL1,4);
XL2=vpa(XL2,4);
XL3=vpa(XL3,4);

XL1=matlabFunction(XL1);
XL2=matlabFunction(XL2);
XL3=matlabFunction(XL3);

L=1;
a=0.2;
t=0:0.01:33;

sp{1}='耦合震动模型';
sp{2}='简正模式1';
sp{3}='简正模式2';

figure
axis([-1,2*L+4*a+1,-1,1]);
hold on

for n=1:3
	cla
    text(1,0.8,sp{n})
    if n==1
    elseif n==2
        XL1=.4e-1*cos(6.456*t);
        XL2=-.6e-1*cos(6.456*t);
        XL3=.4e-1*cos(6.456*t);
    elseif n==3
        XL1=.1*cos(4.082*t);
        XL2=.6e-1*ones(1,1000);
        XL3=-.1*cos(4.082*t);
	end

	qiou1=line(0, 0,'color','r','marker','.','markersize', 50);%画球
    qiou2=line(L+3*a/2,0,'color','b','marker','.','markersize', 80);
    qiou3=line(2*L+3*a,0,'color','r','marker','.','markersize',50);
    xx1=linspace(a/2,L+a/2,10); %改以下画弹簧
    xx2=linspace(L+5*a/2,2*L+5*a/2,10);
    yy1=[0,-0.04,0.04,-0.04,0.04,-0.04,0.04,-0.04,0.04,0];
    yy2=yy1;
    tanhuang1=line(xx1,yy1,'color','g','linestyle','-','linewidth',2);
    tanhuang2=line(xx2,yy2,'color','g','linestyle','-','linewidth',2);
    pause(0.2)
    for i=1:1000 %动画
        xx1=linspace(XL1(i)+a/2,L+a/2+XL2(i),10);
    	xx2=linspace(XL2(i) +L+5*a/2,2*L+5*a/2+XL3(i),10);
        set(tanhuang1,'XData',xx1,'YData',yy1);
        set(tanhuang2,'XData',xx2,'YData',yy2);
        set(qiou1,'XData', XL1(i),'YData',0);
        set(qiou2,'XData',L+3*a/2+XL2(i),'YData',0);
        drawnow;
    end
end
