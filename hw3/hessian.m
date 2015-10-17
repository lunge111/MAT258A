function H=hessian(X,y,thet)
H=zeros(3,3)
for i = 1:400
et = X(i,:)* thet;
H=H+et*(1-et)+X(i,;)*X(i,:)'
end