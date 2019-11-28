function p1_3
   A=magic(4);
   [G,Q]=hessen(A)
   hesm=hess(A)
     'Q*Q='
   Q*Q'
function [G,Q]=hessen(A)
n=size(A,1);
G=A;
Q=eye(n);
for k=1:n-2
    x=G(:,k); 
    H=householder(x,k+1,n); 
    G=H*G*H;
    Q=Q*H;
    end
function H=householder(x,k,n)  
   x=x(:);
   s=(x(k)>=0)-(x(k)<0); 
   sigma=s*norm(x(k:n));  
   y=[x(1:k-1);-sigma;zeros(n-k,1)]; 
   U=x-y; 
   H=eye(n)-1/(sigma*(sigma+x(k)))*(U*U.'); 
