function j=jaco6(x1,x2,lam,rho)

j=[ 2*x1 + 20*lam*x1 - 200*rho*x1*(- x1^2 + x2) - 2; 50*rho*(- 2*x1^2 + 2*x2) - 10*lam];
end