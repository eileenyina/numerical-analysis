function p2_2
   L1=[2,0,0;4,-3,0;-2,6,-12];
   L2=[3,0,0;1,4,0;4,-7,5];
   U=[1,2,1,-2;0,5,3,-2;0,0,3,5;0,0,0,3];
   LL1=niL(L1)
   LL2=niL(L2)
   UU=niU(U)
function LL=niL(L)
    n=size(L);
    LL=eye(n);
    for i=1:n
    LL(i,i)=1/L(i,i);
end
for j=1:n-1
for i=j+1:n
         LL(i,j)=-(L(i,1:i-1)*LL(1:i-1,j))/L(i,i);
    end
end
disp('L*LL=')
L*LL
function UU=niU(U)
   n=size(U);
   UU=eye(n);
   K=U';
   for i=1:n
    UU(i,i)=1/K(i,i);
   end
for j=1:n-1
    for i=j+1:n
         UU(i,j)=-(K(i,1:i-1)*UU(1:i-1,j))/K(i,i);
    end
end
UU=UU'
disp('U*UU=')
U*UU

        
        