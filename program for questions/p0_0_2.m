function p0_0_2(n)
k=fib(n)
function k=fib(i)
 if i==0 k=0;
      elseif i==1 k=1;
       elseif i==2 k=1;
       else k=fib(i-1)+fib(i-2);
end;
