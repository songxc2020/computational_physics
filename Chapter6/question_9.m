syms x y
for j=0:3
    subplot(2,4,j+1)
    fplot(hermiteH(j,x)*exp(1)^(-0.5*x^2),'linewidth',1.5)
    %grid on
    %ylabel('ψ_n(x)')
    %legend('ψ_0(x)', 'ψ_1(x)', 'ψ_2(x)', 'ψ_3(x)', 'Location', 'Best')
    %title('谐振子波函数')
end


%--第五章数值解法------------------------------------------------------
n=4;eold=-1;olddpsi=0.5; tol=1e-6;
wlch5fun=@(x,psi,e1)[psi(2);50^2*(-e1-1+x^2/2)*psi(1)];
for k=1:n
    de=2*tol;e1=eold+abs(eold)/70;
    while abs(de)>tol
        xturn=-sqrt(2*(e1+1));kk=(-1)^(k+1)*0.0001;
        [x1,u1]=ode45(@(x,psi)wlch5fun(x,psi,e1),[-1 xturn],[0 kk]);
        [x2,u2]=ode45(@(x,psi)wlch5fun(x,psi,e1),[1 xturn],[0 -0.0001]);
        dpsi=u1(length(x1),2)-u2(length(x2),2);
        de=-dpsi*de/(dpsi-olddpsi);
        olddpsi=dpsi; eold=e1; e1=e1+de;
    end
e(k)=eold;
subplot(2,4,k+4);plot(x1,u1(:,1),x2,u2(:,1),'linewidth',1);
end