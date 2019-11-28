function p0_0_3
k=[0:1:63];
a=[2.^k]
ss=sum(a)
s=0;
for i=1:64
    s=s+a(i);
end;
s