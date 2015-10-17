function thet = gradient(X,Y,theta0,maxiter,L,tol)
[n,p]=size(X);
thet=theta0;
oldNlog = 0;
for i= 1:maxiter
    J=zeros(p,1);
    for j = 1:n
         et = X(j,:)* thet;
        J=J+(meanfunc(et)-Y(j))* X(j,:)';
    end
    thet= thet-L*J;
    Nlog=negloglik(thet,X,Y);
    if abs((oldNlog-Nlog)/Nlog)< tol
        break
    end
    oldNlog=Nlog;
end


end