function p2_4
A=[9,-36,30;-36,192,-180;30,-180,180]
B=hilb(6)
LA=choll(A)'
LB=choll(B)'
LAjisuan=chol(A)
LBjisuan=chol(B)
function L=choll(A)
n=size(A,1); 
L=zeros(n); 
for k=1:n
    L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1).'); 
    L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1).')/L(k,k); 
end

