function y = barrier(A,b,a,x)
v=zeros(100,1);
r=abs(A*x+b);
    v(r<=a) = -a^2*log(1-(power(r(r<=a)/a,2)));
 
    v(r>a)= Inf;


y=sum(v);
end