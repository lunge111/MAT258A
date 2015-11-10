function [x, it] = Alang(i, x0, lam0, rho0, quas,  maxit, tol, c)
it=0;
[fc, gc, hc]=prob(i,x0,lam0,rho0);
x=x0;
lam=lam0;
rho=rho0;
while (norm(gc) > tol & it <= maxit)
    x=newton(x, @prob, i, 10000, 1e-6, quas,1e-4,lam, rho );
[fc,gc,hc]=prob(i,x , lam, rho)
if(norm(c(x,i))<1e-3)
    lam=lam-rho'*c(x,i);
else
    rho=rho*2;
end
it=it+1;
end
end