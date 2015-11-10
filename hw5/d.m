syms x1 x2 rho lam

jacobian((1-x1)^2+rho/2*(10^2*(x2-x1^2)^2)-lam*10*(x2-x1^2), [x1;x2])
hessian((1-x1)^2+rho/2*(10^2*(x2-x1^2)^2)-lam*10*(x2-x1^2), [x1;x2])