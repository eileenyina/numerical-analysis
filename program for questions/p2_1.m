function p2_1
   A1=[2 4 -2;1 -1 5;4 1 -2]
   [L,U]=llu(A1);
   A2=[3 1 0;9 3 1;0 9 3]
   [L,U]=llu(A2);
   A3=[1 2 1 -2;2 5 3 -2;-2 -2 3 5;1 3 2 3]
   [L,U]=llu(A3);



function [L,U]=llu(A);
if det(A)==0
    fprintf('error')
    return;
end
U=A;
n=length(A);  
L=eye(n); 
for k=1:n-1
    m=U(k+1:n,k)/U(k,k);  
    U(k+1:n,k:n)=U(k+1:n,k:n)-m*U(k,k:n);  
    L(k+1:n,k)=m;  
end
L
U
ddet=1;
for i=1:n
    ddet=ddet*L(i,i);
end
disp('det=')
ddet
LL=eye(n);
UU=eye(n);
K=U';
for i=1:n
    LL(i,i)=1/L(i,i);
    UU(i,i)=1/K(i,i);
end
for j=1:n-1
    for i=j+1:n
         LL(i,j)=-(L(i,1:i-1)*LL(1:i-1,j))/L(i,i);
         UU(i,j)=-(K(i,1:i-1)*UU(1:i-1,j))/K(i,i);
    end
end
UU
LL
sss=LL*L
vvv=UU'*U
Xni=UU'*LL

