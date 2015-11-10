function [f ,j , h]=prob(i,x, lam, rho)
if(i==6)
    f=obj6(x(1), x(2), lam, rho);
    j=jaco6(x(1), x(2), lam, rho);
    h=hess6(x(1), x(2), lam, rho);
elseif (i==7)
    f=obj7(x(1), x(2), lam, rho);
    j=jaco7(x(1), x(2), lam, rho);
    h=hess7(x(1), x(2), lam, rho);
elseif (i==8)
    f=obj8(x(1), x(2), lam, rho);
    j=jaco8(x(1), x(2), lam, rho);
    h=hess8(x(1), x(2), lam, rho);
else
    f=obj9(x(1), x(2), lam, rho);
    j=jaco9(x(1), x(2), lam, rho);
    h=hess9(x(1), x(2), lam, rho);
end
end