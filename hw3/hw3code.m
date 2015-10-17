
for i=1:18
[x,f,it]=newton(@prob,i,20000,1e-6,0,1e-3);
res(i,1)=f;
res(i,2)=it
end

sol=zeros(18,1);

for j=1:18
  [k, xo]=p00_sol(j,p00_n(j));
    sol(j)=p00_f(j, p00_n(j), xo);
end

[x,f,it]=newton(@prob,10,20000,1e-6,0,1e-4);