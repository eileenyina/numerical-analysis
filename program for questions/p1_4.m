function p1_4
   A=[6.5 8;8 10];
   [Q,R]=qr(A)
   b=[0.8 1]';
   bb=Q'*b;
   disp('ԭ����:')
   x=solve(R,bb);
   x'
   bb=[0.79 1.01]';
   bb=Q'*bb;
   xx=solve(R,bb);  
   disp('�Ŷ���:')
   xx'
   dx=x-xx;
   db=b-bb;
   disp('���Ƶ���������Сֵ')
   ca=norm(dx,inf)/norm(x,inf)/(norm(db,inf)/norm(b,inf))
   disp('������')
   cond(A)
   disp('A����')
   AA=inv(A)
   disp('A�ķ�����A����ķ���')
   norm(A,inf)*norm(AA,inf)
   function x=solve(U,y)
   n=length(y);
   x=zeros(n,1);
   x(n)=y(n)/U(n,n);
   for i=n-1:-1:1
       x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
   end;
   disp('A')