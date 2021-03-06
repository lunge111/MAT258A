X=diabetes(:,1:10);
[n p]=size(X);

Y=diabetes(:,11);
% normalize
X = X-repmat(mean(X),n,1);
X = X*diag(1./sqrt(ones(1,n)*X.^2));
Y = Y-mean(Y);
tic
[beta, A] = lars(X, Y,100, 1e-10);
toc

tic
[x,fval,exitflag,output]=QPlasso(X,Y,100);
toc

QP=zeros(400,10);
LAR=zeros(400,10);
ts=100:300:3700;

tic
for i=1:400
     Xx=QPlasso(X,Y,ts(i));
    QP(i,:)=Xx'; 
end
toc


colorVec = hsv(10);
% Plot and change the color for each line
hold on;
for j = 1:10
    plot(ts,QP(:,j),'Color',colorVec(j,:))
end
hold off;