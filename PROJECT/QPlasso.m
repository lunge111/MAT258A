function [x,fval,exitflag,output]= QPlasso(X,Y,t)
[n,p]=size(X)
H=2*X'*X;
f=-2*X'*Y;
Q=[H,-H;-H,H];
c=[f;-f];
A=[ones(1,2*p);-eye(2*p)];
b=[t;zeros(2*p,1)];
[x,fval,exitflag,output]=quadprog(Q,c,A,b);
x=x(1:p)-x((p+1):2*p);
end