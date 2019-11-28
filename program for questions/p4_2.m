function p4_2
A=[7,6,6,6;-5,-6,-9,-9;3,6,10,8;-1,-2,-3,-1]
disp('反幂法')
antipow(A)
disp('rayleigh')
rayleigh(A)

function antipow(A)
maxiter=1000;  
ep=1e-6; 
u0=ones(4,1); 
cishu=1;
flag=1; 
us(cishu,:)=u0;  
[~,I]=max(abs(u0)); 
m0=u0(I); 
ms(cishu,1)=m0;  
while 1
    t=3.2512;
    n=(A-t*eye(4))\u0;
    l=abs(n);
    m=max(l);
    u0=n/m;  
    ms(cishu+1,1)=m; 
    us(cishu+1,:)=u0;  
    if abs(m-m0)<=ep  
        break
    end
    m0=m;  
    cishu=cishu+1; 
    if cishu>maxiter  
        flag=0;  
        break   
    end
end
if (flag==1) 
    disp('收敛') 
end;
if (flag==0)
    disp('发散') 
end;
disp('特征值')
m
disp('特征向量')
u0
cishu

function rayleigh(A)
maxiter=1000;  
ep=1e-6; 
u0=ones(4,1); 
cishu=1;
flag=1; 
us(cishu,:)=u0;  
[~,I]=max(abs(u0)); 
m0=u0(I); 
ms(cishu,1)=m0;  
while 1
    u=A*u0(:);  
    m=u.'*A*u/(u.'*u); 
    u0=u/m;  
    ms(cishu+1,1)=m;  
    us(cishu+1,:)=u0; 
    if abs(m-m0)<=ep  
        break 
    end
    m0=m; 
    cishu=cishu+1; 
    if cishu>maxiter  
        exitflag=0;
        break  
    end
end
 if (flag==1) 
    disp('收敛') 
end;
if (flag==0)
    disp('发散') 
end;
disp('特征值')
m
disp('特征向量')
u0
cishu
