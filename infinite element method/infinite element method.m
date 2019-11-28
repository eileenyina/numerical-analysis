st=0;
ed=1;
n=10;
h=(ed-st)/n;
x=[st:h:ed];
x
%x=linspace(0,1,n+1);
p=1;q=1;

K=zeros(n+1);
f11=@(k)(p./h+h.*q.*((1-k).^2));
f12=@(k)(-p./h+h.*q.*k.*(1-k));
f21=@(k)(-p./h+h.*q.*k.*(1-k));
f22=@(k)(p./h+h.*q.*(k.^2));
for i=2:(n+1)
    K(i-1,i-1)=K(i-1,i-1)+quad(f11,0,1);
    K(i,i)=quad(f22,0,1);
    K(i-1,i)=quad(f12,0,1);
    K(i,i-1)=quad(f21,0,1);
end
K=K(2:(n+1),2:(n+1));
K

b=zeros(n,1);
for i=2:(n+1)
    f1=@(k)((pi)^2/4)*sin((x(i-1)+h.*k)*pi/2).*k+((pi)^2/4)*sin((x(i)+h.*k)*pi/2).*(1-k);
    b(i-1)=h.*quad(f1,0,1);
end
f2=@(k)((pi)^2/4)*sin((x(n)+h.*k)*pi/2).*k;
b(n)=h.*quad(f2,0,1);  

u=K\b;
u
xx=x;
yy=sin(xx);
xx(11)=[];
plot(xx,u);
%plot(xx,yy);
xlabel('x');
ylabel('f(x)');

