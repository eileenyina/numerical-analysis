function p1_4
   A=[6.5 8;8 10];
   [Q,R]=qr(A)
   b=[0.8 1]';
   bb=Q'*b;
   disp('原方程:')
   x=solve(R,bb);
   x'
   bb=[0.79 1.01]';
   bb=Q'*bb;
   xx=solve(R,bb);  
   disp('扰动后:')
   xx'
   dx=x-xx;
   db=b-bb;
   disp('估计的条件数最小值')
   ca=norm(dx,inf)/norm(x,inf)/(norm(db,inf)/norm(b,inf))
   disp('条件数')
   cond(A)
   disp('A的逆')
   AA=inv(A)
   disp('A的范数乘A的逆的范数')
   norm(A,inf)*norm(AA,inf)
   function x=solve(U,y)
   n=length(y);
   x=zeros(n,1);
   x(n)=y(n)/U(n,n);
   for i=n-1:-1:1
       x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
   end;
   disp('A')