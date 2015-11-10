function h=hess9(x1,x2,lam,rho)
h=[   16*rho - (pi^2*cos((pi*x2)/16)*sin((pi*x1)/12))/144, - 12*rho - (pi^2*cos((pi*x1)/12)*sin((pi*x2)/16))/192;
 - 12*rho - (pi^2*cos((pi*x1)/12)*sin((pi*x2)/16))/192,    9*rho - (pi^2*cos((pi*x2)/16)*sin((pi*x1)/12))/256];
end