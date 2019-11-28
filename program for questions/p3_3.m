function p3_3
A=eye(3);
B=-1/4*ones(3,3);
x=[1,6,0,5,1,2]';
C=[A,B;B,A];
b=C*x;
b1=b(1:3,1);
b2=b(4:6,1);
x1=zeros(3,1);
N=10000;
ep=1e-6;
disp('jacobi')
jacobi(A,B,b1,b2)
disp('GS')
gs(A,B,b1,b2)
function jacobi(A,B,b1,b2)
maxiter=10000; 
ep=1e-6;  
x1=zeros(3,1);
x2=zeros(3,1);
cishu=0;  
flag=1;  
while flag
   cishu=cishu+1;
    k=[x1;x2];
    x1=b1-B*x2;
    x2=b2-B*k(1:3);
    x=[x1;x2];
    err=norm(x-k,1);
    if err<=ep 
        break 
    end
    if cishu>maxiter 
        flag=0; 
    end
end
if (flag==1) 
    disp('收敛')
end;
if (flag==0) 
    disp('发散')
end;
x
cishu

function gs(A,B,b1,b2)
maxiter=10000; 
ep=1e-6;  
x1=zeros(3,1);
x2=zeros(3,1);
cishu=0;  
flag=1;  
while flag
   cishu=cishu+1;
    k=[x1;x2];
    x1=b1-B*x2;
    x2=b2-B*x1;
    x=[x1;x2];
    err=norm(x-k,1);
    if err<=ep 
        break 
    end
    if cishu>maxiter 
        flag=0; 
    end
end
if (flag==1) 
    disp('收敛')
end;
if (flag==0) 
    disp('发散')
end;
x
cishu

