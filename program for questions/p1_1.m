function p1_1
   a=hilb(6)
   [Q,R]=givenqr(a)
   'Q*Q='
   Q*Q'
   xc=[1,6,0,5,1,2]'
   b=a*xc
   bb=Q'*b;
   x=solve(R,bb)
function x=solve(U,y)
   n=length(y);
   x=zeros(n,1);
   x(n)=y(n)/U(n,n);
   for i=n-1:-1:1
       x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
   end;
function [Q,R]=givenqr(a)
    n=size(a,1);
    R=a;
    Q=eye(n);
    if ~isequal(a,a.')
       error('报错，矩阵不为对称矩阵')
    end;
    for x=1:n-1
        for y=(x+1):n
            T=given(x,x,y,n,R);
            T;
            Q=Q*T';
            R=T*R;  
            R;
        end;
    end;
function T=given(k,i,j,n,R) 
    T=eye(n);
    r=sqrt(R(i,k)^2+R(j,k)^2);
    c=R(i,k)/r;
    s=R(j,k)/r;
    T([j,i],[j,i])=[c,-s;s,c];
