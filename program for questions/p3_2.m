function p3_2
N=10;
A=zeros(9,9);
h=1/N;
b=zeros(9);
i=1;
A=eye(9);
A=2*A;
for i=1:9
    b(i)=4*(i*h)*(5*i*h-3);
    if i<9
        A(i+1,i)=-1;
    end
    if i>1
        A(i-1,i)=-1;
    end
end
disp('jacobi')
jacobic(A,b);
disp('Gauss-Seidel')
seidelc(A,b);
disp('sor')
sor(A,b);


function jacobic(A,b)
n=length(b); 
maxiter=1000;
if nargin<4
    ep=1e-6;  
end
x0=ones(n,1);
x0=x0(:); 
x=zeros(n,1); 
cishu=1; 
flag=1; 
xs(cishu,:)=x0; 
err(cishu,1)=nan;  
while flag
    for k=1:n 
        x(k)=(b(k)-A(k,[1:k-1,k+1:n])*x0([1:k-1,k+1:n]))/A(k,k);
    end
    xs(cishu+1,:)=x; 
    err(cishu+1,1)=norm(x-x0); 
    if err(cishu+1,1)<=ep  
        break  
    end
    x0=x; 
    cishu=cishu+1;  
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
%xs

function seidelc(A,b)
n=length(b); 
maxiter=1000; 
ep=1e-6;  
x0=ones(n,1);
x=zeros(n,1);
cishu=1;  
flag=1;  
xs(cishu,:)=x0;
err(cishu,1)=nan; 
while flag
    x1=x0(:);
    for k=1:n  
        x(k)=(b(k)-A(k,[1:k-1,k+1:n])*x1([1:k-1,k+1:n]))/A(k,k);
        x1(k)=x(k);  
    end
    xs(cishu+1,:)=x; 
    err(cishu+1,1)=norm(x-x0(:)); 
    if err(cishu+1,1)<=ep 
        break 
    end
    x0=x; 
    cishu=cishu+1; 
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
%xs

function sor(A,b)
n=length(b);  
maxiter=1000;  
ep=1e-6; 
x0=ones(n,1); 
w=2/(1+sin(pi*1/10));  
x=zeros(n,1);  
cishu=1;  
flag=1; 
xs(cishu,:)=x0;
err(cishu,1)=nan; 
while flag
    x1=x0(:);
    for k=1:n 
        x(k)=(1-w)*x0(k)+...
            w*(b(k)-A(k,[1:k-1,k+1:n])*x1([1:k-1,k+1:n]))/A(k,k);
        x1(k)=x(k); 
    end
    xs(cishu+1,:)=x; 
    err(cishu+1,1)=norm(x-x0(:));  
    if err(cishu+1,1)<=ep 
        break  
    end
    x0=x;  
    cishu=cishu+1; 
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
%xs
   

