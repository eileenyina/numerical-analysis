function p0_1
n=[1 2 3 5 10 20 100];
x=[0.5 0.9 1.1 1.5];
for i=1:4
    for j=1:7
        s=0;
        v=x(i)-1;
        a=[1:1:n(j)];
        for k=n(j):-1:1
            a(k)=((-1)^(k-1))*1/k;
            s=(s+a(k))*v;
        end;
        l=log(x(i));
        e=log(x(i))-s;
        disp(sprintf('x=%d n=%d s=%d log(x)=%d error=%d',x(i),n(j),s,l,e))
    end;
end;
end

        