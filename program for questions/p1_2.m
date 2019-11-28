function p1_2
   a=hilb(6);
   [Q,R]=houseqr(a);
function [Q,R]=houseqr(a)  
   n=size(a,1);  
   R=a;  
   Q=eye(n);
   for i=1:n-1
       x=R(:,i);
       H=householder(x,i,n);
      % H=blkdiag(eye(i-1),h);  
       Q=Q*H;  
       R=H*R;
   end;    
   R
   Q
    'Q*Q='
   Q*Q'
function H=householder(x,k,n)  
   x=x(:);
   s=(x(k)>=0)-(x(k)<0); 
   sigma=s*norm(x(k:n));  
   y=[x(1:k-1);-sigma;zeros(n-k,1)]; 
   U=x-y; 
   H=eye(n)-1/(sigma*(sigma+x(k)))*(U*U.'); 
