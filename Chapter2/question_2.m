res=[0,1];
n=3;
for m=1:n
    res=[1/3.*res,2/3+1/3.*res];
end
for m=1:2:2^(n+1)-1
    line([res(m),res(m+1)],[0,0])
end