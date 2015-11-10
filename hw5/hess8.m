function h=hess8(x1,x2,lam,rho)
h=[ 4*rho(1)*x1^2 - 2*lam(1) + rho(2)*x2^2 + 2*rho(1)*(x1^2 + x2^2 - 25),          rho(2)*(x1*x2 - 9) - lam(2) + 4*rho(1)*x1*x2 + rho(2)*x1*x2;
          rho(2)*(x1*x2 - 9) - lam(2) + 4*rho(1)*x1*x2 + rho(2)*x1*x2, 4*rho(1)*x2^2 - 2*lam(1) + rho(2)*x1^2 + 2*rho(1)*(x1^2 + x2^2 - 25)];
end