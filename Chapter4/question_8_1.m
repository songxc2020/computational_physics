%用对分法编程
clear;
f=@(x)exp(1)^x-4*cos(x); %在pi/4到pi/2上为单调增函数
x0=pi/4;
x1=pi/2;
Delta=0.001;
n=0;
if abs(f(x0))<Delta
    fprintf('方程的根为%.3f\n',f(x0))
elseif abs(f(x1))<Delta
    fprintf('方程的根为%.3f\n',f(x0))
elseif f(x0)*f(x1)>0
    fprintf('方程在此区间无根')
end
while f(x0)*f(x1)<0
    n=n+1;
    mid=(x0+x1)/2;
    if abs(f(mid))<Delta
        fprintf('方程的根为%.3f\n',mid);
        break
    elseif f(mid)*f(x0)>0
        x0=mid;
    else
        x1=mid;
    end
end
fprintf('计算次数为%d\n',n);