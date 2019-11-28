function p2_3
A1=hilb(4)
disp('Plu分解')
lup(A1);
disp('机器计算')
[L,U]=lu(A1)
A2=hilb(6)
disp('Plu分解')
lup(A2);
disp('机器计算')
[L,U]=lu(A2)


function lup(A)
n=size(A);
Q=eye(n);
L=eye(n);
for i=1:n-1
    N=A(i:n,i);
    [rows,cols]=find(abs(N)==max(max(abs(N))));
    p=rows(1);
    p=p+i-1;
    q=cols(1);
    q=i;
    T=eye(n);
    T(p,p)=0;  T(q,q)=0;
    T(p,q)=1;  T(q,p)=1;
    Q=T*Q;
    A=T*A;
    G=eye(n);
    for j=1:n
        if j<=i-1
            G(j,i)=0;
        elseif j==i
            G(j,i)=1;
        else
            G(j,i)=-A(j,i)/A(i,i);
        end
    end
    A=G*A;
    R=G*T;
    L=L*inv(R);
end
U=A
L=Q*L
if (n==6)
xx=[1,6,0,5,1,2]';
b=A*xx
b=Q*b;
b=inv(L)*b;
n=length(b);
  x=zeros(n,1);
  x(n)=b(n)/U(n,n);
  for i=n-1:-1:1
      x(i)=(b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
  end
 x
end;
