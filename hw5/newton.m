function [x,fc,itc] = newton(x0,obj,i,maxit,tol,qusi,eps,lam,rho)
c=0.0001;
n=length(x0);
[fc,gc,hc]=obj(i,x0,lam,rho); 
[P,D]=eig(hc);
if(min(diag(D))<eps)
D=max(D,eps*eye(n));
hc=P*D*P';
end
g0=gc;
xc=x0;
itc=1;
H=inv(hc);
while(norm(gc) > tol*norm(g0) & itc <= maxit)
    p=-H*gc;
	alpha=1.0; xt=xc+alpha*p; ft=obj(i,xt,lam,rho);
	fg= fc + c*alpha*(p'*gc);
    cout=1;
	while(ft > fg) % check Armijo condition
		alpha=alpha/2;
  fg= fc + c*alpha*(gc'*p);
		xt=xc+alpha*p;
		ft=obj(i,xt,lam,rho);
	cout=cout+1;
    if(cout>40)
        break
    end
    end
	xc=xt;
    go=gc;
    [fc,gc,hc]=obj(i,xc,lam,rho);
    itc=itc+1;
    if(qusi)
        s=alpha*p;
        y=gc-go;
        pho=1/(y'*s);
        H=(eye(n)-pho*s*y')*H*(eye(n)-pho*y'*s)+pho*s*s';
    
    else
        [P,D]=eig(hc);
        if(min(diag(D))<eps)
         D=diag(D);          
    D(D<=1e-4)=eps;       
    D=diag(D); 
    hc=P*D*inv(P);
         H=inv(hc);
        end
    end   
end
x=xc;


end