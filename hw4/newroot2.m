function [x l] = newroot2(x0,a, maxiter, tol)
fold = a*x0-1;
fnew = fold-1;
x=x0;
iter=0;
while( abs(fnew-fold)>tol && iter< maxiter)
    fold = fnew;
    iter=iter+1;
    x=2*x-a*x^2;
    fnew=a*x+1;
end
l=iter;
end