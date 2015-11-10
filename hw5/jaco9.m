function j=jaco9(x1,x2,lam,rho)

j=[ (rho*(32*x1 - 24*x2))/2 - 4*lam + (pi*cos((pi*x1)/12)*cos((pi*x2)/16))/12; 3*lam - (rho*(24*x1 - 18*x2))/2 - (pi*sin((pi*x1)/12)*sin((pi*x2)/16))/16];
end