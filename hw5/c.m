function vec= c(x,i)
if (i==6)
    vec=10*(x(2)-x(1)^2);
elseif (i==7)
    vec=(1+x(1)^2)^2+x(2)^2-4;
elseif (i==8)
    vec=[x(1)^2+x(2)^2-25;
        x(1)*x(2)-9];
else
    vec=4*x(1)-3*x(2);
end
end