function p4_3
A=[7,6,6,6;-5,-6,-9,-9;3,6,10,8;-1,-2,-3,-1]
disp('基本QR')
qqr(A)
disp('实用QR')
qrshift(A)



function qqr(A)
ep=1e-6; 
n=size(A,1);
H=hessen(A); 
cishu=1;  
while 1
    [Q,R]=houseqr(H);  
    H=R*Q;  
    if norm(tril(H,-1))<=ep
        break 
    end
    cishu=cishu+1;
end
d=diag(H);  % 特征根
disp('特征值')
d
cishu
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
   

function qrshift(A)
ep=1e-6;  
n=size(A,1); 
H=hessen(A);  
cishu=1;  
I=eye(n);  
while 1
    if cishu>1000 
        break
    end;
    H1=H(n-1:n,n-1:n);  
    d=(H1(1)+H1(4))^2-4*(H1(1)*H1(4)-H1(2)*H1(3));  
    if d<0  
        s=H(n,n);  
    else
        r=(H1(1)+H1(4)+[1;-1]*sqrt(d))/2;
        if abs(r(1)-H(n,n))<abs(r(2)-H(n,n))
            s=r(1); 
        else
            s=r(2);  
        end
    end
    [Q,R]=qr(H-s*I);
    H=R*Q+s*I; 
    if norm(tril(H,-1))<=ep  
        break  
    end
    cishu=cishu+1;
end
d=diag(H); 
disp('特征值')
d
cishu


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
