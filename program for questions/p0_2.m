function p0_2
a=zheng
xiaoshu=xiaoshu
zhengshu=fix(a)
he=zhengshu+xiaoshu
%disp(sprintf('%d.%d',v,b))
zhijiesuan=dec2bin(2018)
function s=zheng
   k=2018;
   i=0;
   s=0;
   while k>0
       c=mod(k,2);
       k=fix(k/2);
       s=s+c*10^i;
       i=i+1;
   end;
function s=xiaoshu
    k=0.2018;
    s=0;
    i=1;
    while ((k-fix(k))>0)
        k=k*2;
        c=fix(k);
        k=k-fix(k);
        s=s+c*(0.1)^i;
        i=i+1;
    end;
   

        
       
   
   