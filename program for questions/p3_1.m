function p3_1
   A=ones(3,3);
   A=0.5*A;
   for i=1:3
       A(i,i)=1;
   end
   X=[5,1,2]';
   b=A*X
   ss=[0 3 10 100];
   for i=1:4
       disp('s=')
       ss(i)
       disp('jacobi')
       jacobic(A,b,ss(i));
       disp('Gauss-Seidel')
       seidelc(A,b,ss(i));
   end;





function jacobic(A,b)
n=length(b); 
maxiter=500; 
ep=1e-8;  
x0=ones()
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

function seidelc(A,b,s)
n=length(b); 
maxiter=500; 
ep=1e-8;  
x0=[s,s,s];
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
