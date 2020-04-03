function Fibonacci(s)
%Fibonacci 
%求小于任意自然数n的斐波那契数列各项

if (s >= 0) && (fix(s)-s)==0 %判断是否为自然数
    if s==0  %如果输入的自然数为0则直接返回
        return;
    elseif s==1 %如果输入的自然数为1则直接输出1，1
        res=[1,1];
        display(res(1:end))
    else        %输入的自然数为2
        m=1;
        n=1;
        res=[1,1];
        while(n<s)
            val=n;
            n=m+n;
            res(end+1)=n;
            m=val;
        end
        disp(res(1:end-1)) %最后一个大于输入的自然数，所以不输出
    end
else
    fprintf("请输入自然数\n")%输入错误提示
end
end