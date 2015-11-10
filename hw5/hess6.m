function h=hess6(x1,x2,lam,rho)
h=[ 20*lam + 400*rho*x1^2 - 200*rho*(- x1^2 + x2) + 2, -200*rho*x1;
                                      -200*rho*x1,     100*rho];
end

