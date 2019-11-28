function p0_3
i0=0.6321;
s=i0;
for i=1:20
    i;
    s=1-i*s;
end;
i20jisuan=s
i20zhenshi=0.0455
i20=0.0455;
ss=i20;
for i=20:-1:1
    ss=(1-ss)/i;
end;
i0jisuan=ss
i0zhenshi=0.6321