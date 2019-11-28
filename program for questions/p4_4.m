function p4_4
A=[2,-1,0;-1,2,-1;0,-1,2]
jacobi(A)
%gkjacobi(A)

function jacobi(A)
ep=1e-8; 
n=size(A,1); 
V=eye(n);
while 1
    D=A;  
    D(1:n+1:end)=0; 
    if norm(D)<=ep
        break
    end
    [~,ind]=max(abs(D(:)));  
    [p,q]=ind2sub([n,n],ind); 
    [A,R]=given(A,p,q);  
    V=V*R;  
end
disp('特征值矩阵')
diag(diag(A))
disp('特征向量矩阵')
V

function [A,G]=given(A,i,j)
n=size(A,1);  
G=eye(n);
d=(A(j,j)-A(i,i))/(2*A(i,j));  
if abs(d)<eps  
    t=1; 
else 
    t=sign(d)/(abs(d)+sqrt(d^2+1));
end
c=1/sqrt(t^2+1);  
s=c*t;  
G([i,j],[i,j])=[c,s;-s,c];  
A=G.'*A*G;  

function gkjacobi(A)
ep=1e-8; 
n=size(A,1); 
V=eye(n);
cishu=0;
while 1
    D=A;  
    D(1:n+1:end)=0; 
    if norm(D)<=ep
        break
    end
    cishu=cishu+1;  
    if cishu==1 
        p0 = u0 ;
    else
        t=(u0'*u0)/(p0'*A*p0);
        r1 = u0 - t*A*p0 ;
        p0=u0+(u0'*u0)/(r1'*r1)*p0;
        x1 = x0 + t*p0;
        x0=x1;
        u0=r1;
    end
end
