function p3_4
A=[1.37 -0.53 -0.05 -0.44 0.30 -0.21;
    -0.53 3.35 -4.63 9.87 -11.54 4.45;
   -0.05 -4.63 30.44 -71.97 79.48 -32.09;
   -0.44 9.87 -71.97 193.64 -213.94 84.77;
   0.30 -11.54 79.48 -213.94 244.03 -96.87;
   -0.21 4.45 -32.09 84.77 -96.87 42.14]
xx=[1 6 0 5 1 2]';
b=A*xx;
disp('最速下降')
fastdown(A,b);
disp('最小残量')
gmr(A,b);
disp('共轭梯度')
conjgrad(A,b);

function fastdown(A,b)
n=length(b);  
maxiter=1000000;  
ep=1e-6;
x0=zeros(n,1); 
x=zeros(n,1); 
cishu=1; 
falg=1; 
xs(cishu,:)=x0; 
err(cishu,1)=nan;
while flag
    r=b(:)-A*x0(:); 
    t=r.'*r/(r.'*A*r); 
    x=x0(:)+t*r;  
    xs(cishu+1,:)=x; 
    err(cishu+1,1)=norm(x-x0(:));  
    if err(cishu+1,1)<=ep 
        break
    end
    x0=x;  
    cishu=cishu+1;  
    if cishu>maxiter 
        falg=0; 
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

function conjgrad(A,b)
n=length(b);  
maxiter=1000000;  
ep=1e-6;
x0=zeros(n,1); 
x=zeros(n,1);  
cishu=1;  
flag=1;
xs(cishu,:)=x0; 
err(cishu,1)=nan;  
r=b(:)-A*x0(:); 
p=r;  
while flag
    alpha=p.'*r/(p.'*A*p);
    x=x0(:)+alpha*p;
    r=r-alpha*A*p;
    beta=p.'*A*r/(p.'*A*p);
    p=r-beta*p;
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

function gmr(A,b)
n=length(b);  
maxiter=1000000;  
ep=1e-6;
x0=zeros(n,1); 
x=zeros(n,1);  
cishu=1;  
flag=1;
xs(cishu,:)=x0; 
err(cishu,1)=nan;  
r=b(:)-A*x0(:); 
while flag
  r=b(:)-A*x0(:); 
    t=(r'*A*r)/(r'*A'*A*r); 
    x=x0(:)+t*r;  
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

