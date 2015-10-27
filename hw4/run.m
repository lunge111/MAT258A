
res=zeros(18,2)

for i=1:18
[x,f,it]=newton(@prob,i,20000,1e-5,1,1e-4);
res(i,1)=f;
res(i,2)=it
end


res