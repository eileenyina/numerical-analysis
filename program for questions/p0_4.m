function p0_4
   cramer(5);
   cramer(10);
function cramer(n)
   for i=1:n
      a(i,i)=-4;
   end
   for i=1:n-1
      a(i,i+1)=1;
      a(i+1,i)=1;
   end
   
   for i=1:n
       p=a;
       for j=1:n
           p(j,i)=-15;
           p(1,i)=-27;
       end;
       p;
       d(i)=det(p);
   end;
   ddet=det(a);
   for i=1:n
       x(i)=d(i)/ddet;
   end;
   ddet
   d
   x
   
