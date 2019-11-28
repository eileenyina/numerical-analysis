function p4_1
A1=[1,2,3,2;5,3,1,8;6,2,8,9;4,2,1,7]
disp('乘幂法')
pow(A1)
disp('Rayleigh')
rayleigh(A1)
A2=[7,6,6,6;-5,-6,-9,-9;3,6,10,8;-1,-2,-3,-1]
pow(A2)
disp('Rayleigh')
rayleigh(A2)


function pow(A)
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
    [~,ind]=max(abs(u));
    m=u(ind);  
    u0=u/m;  
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
