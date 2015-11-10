function j=jaco7(x1,x2,lam,rho)

j=[ (2*x1)/(x1^2 + 1) - 4*lam*x1*(x1^2 + 1) + 4*rho*x1*(x1^2 + 1)*((x1^2 + 1)^2 + x2^2 - 4); 2*rho*x2*((x1^2 + 1)^2 + x2^2 - 4) - 2*lam*x2 - 1];
end