function [x l] = newroot(x0,a, maxiter, tol)
fold = a*x0-1;
fnew = fold-1;
x=x0;
iter=0;
while( abs(fnew-fold)>tol && iter< maxiter)
    fold = fnew;
    iter=iter+1;
    x=x-(a*x-1)/a;
    fnew=a*x+1;
end
l=iter;
end