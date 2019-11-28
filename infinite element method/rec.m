%初始化
xend = 1; 
yend = 1;
nx=5;
ny=5;
dx = xend/nx;
dy = yend/ny;
Ne = nx*ny;
nodx = nx + 1; 
nody = ny + 1; 
Np = nodx*nody;
circum =zeros(2*(nx+ny),1);
xx = [0:dx:xend];
yy = [0:dy:yend];
[X, Y] = meshgrid(xx,yy);
X = X';Y = Y';coord = [X(:) Y(:)];
round = getround(nodx,nody)
ebcdof = unique([1:nodx nodx*ny+1:nodx*ny+nodx nodx+1:nodx:nodx*(ny-1)+1 2*nodx:nodx:ny*nodx]); 
bigk = sparse(Np,Np);
fext = sparse(Np,1);    



%%  
for e = 1:Ne 
  ke = bbigk(dx,dy);
  fe = vect(e,4,dx,dy,coord,round);
  sctr = round(e,:);
  bigk(sctr,sctr) = bigk(sctr,sctr) + ke;
  fext(sctr) = fext(sctr) + fe;
end
for i = 1:length(ebcdof)
  n = ebcdof(i);
  for j = 1:Np
    if (isempty(find(ebcdof == j, 1)))
      fext(j) = fext(j) - bigk(j,n)*circum(i);
    end
  end
  bigk(n,:) = 0.0;
  bigk(:,n) = 0.0;
  bigk(n,n) = 1.0;
  fext(n) = circum(i);
end
Al = bigk\fext;
A = reshape(Al,nodx,nody);
A = full(A)
mesh(xx,yy,A);

%%周围节点
function round = getround( nodx,nody)
   xn = 1:(nodx*nody);
   AA = reshape(xn,nodx,nody);
   for i = 1:(nodx-1)*(nody-1)
       xl = rem(i,nodx-1);
       if xl == 0
           xl = nodx-1;
       end
       yd = ceil(i/(nodx-1));
       a = AA(xl:xl+1,yd:yd+1);
       round(i,1:4) = a(:);
   end
end

%%系数矩阵
function [ke] =bbigk(hx,hy)
idp11 = 1/3*(hx/hy+hy/hx);
idp12 = 1/6*hx/hy-1/3*hy/hx;
idp13 = 1/6*hy/hx - 1/3*hx/hy;
idp14 = -1/6*(hy/hx+hx/hy);
ke = diag(repmat(idp12,3,1),1)+diag(repmat(idp13,2,1),2);
ke(1,4) = idp14;ke(2,3)=idp14;
ke = ke + ke'+diag(repmat(idp11,4,1));
return
end


%%载荷向量
function [fe] = vect(e,nel,hx,hy,coord,connect)
fe = zeros(nel,1);
nodes = connect(e,:);
xe = coord(nodes,:); 
ff = @(x,y) fun(x+xe(1,1),y+xe(1,2));
p{1} = @(x,y) (x-hx).*(y-hy)/(hx.*hy);
p{2} = @(x,y) x.*(y-hy)/(-hx.*hy);
p{3} = @(x,y) (x-hx).*y/(-hx.*hy);
p{4} = @(x,y) x.*y/(hx.*hy);
for i = 1:4
   pp = p{i};
   func = @(x,y) (ff(x,y).*pp(x,y));
   fe(i,1) = integral2(func,0,hx,0,hy);
end
end
function bx = fun(x,y)
bx = (2*pi^2)*sin(pi*x).*sin(pi*y);
end



