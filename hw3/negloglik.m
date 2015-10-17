function L = negloglik(theta, X,Y)
[n,p]= size(X);
NlogL = 0.;
for i = 1:n
    et = X(i,:) * theta;
    m = meanfunc(et);
    if Y(i) == 1
        NlogL = NlogL - log(m);
    else
        NlogL = NlogL - log(1-m);
    end
end
    L=NlogL/n;

end