function [K,B,u]=Ritz
%% initial data
p=1;q=0;
a=0;b=1;
n=10;
x=linspace(0,1,n+1);
h=1/n;
%% matrix K
K=zeros(n+1);
fun1=@(ke)(p./h+h.*q.*((1-ke).^2));
fun2=@(ke)(p./h+h.*q.*(ke.^2));
fun3=@(ke)(-p./h+h.*q.*ke.*(1-ke));
for i=2:(n+1)
    K(i-1,i-1)=K(i-1,i-1)+quad(fun1,a,b);
    K(i,i)=quad(fun2,a,b);
    K(i-1,i)=quad(fun3,a,b);
    K(i,i-1)=quad(fun3,a,b);
end
K=K(2:(n+1),2:(n+1));
%% b
B=zeros(n,1);
for i=2:(n+1)
    f1=@(ke)((pi)^2/4)*sin((x(i-1)+h.*ke)*pi/2).*ke+((pi)^2/4)*sin((x(i)+h.*ke)*pi/2).*(1-ke);
    B(i-1)=h.*quad(f1,a,b);
end
f2=@(ke)((pi)^2/4)*sin((x(n)+h.*ke)*pi/2).*ke;
B(n)=h.*quad(f2,a,b);  
%% u
u=K\B;
u
xx=x;
x(11)=[];
plot(x,u);

