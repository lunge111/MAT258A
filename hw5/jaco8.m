function j=jaco8(x1,x2,lam,rho)

j=[ 2*rho(1)*x1*(x1^2 + x2^2 - 25) - lam(2)*x2 - 2*lam(1)*x1 + rho(2)*x2*(x1*x2 - 9); 2*rho(1)*x2*(x1^2 + x2^2 - 25) - lam(2)*x1 - 2*lam(1)*x2 + rho(2)*x1*(x1*x2 - 9)];
end