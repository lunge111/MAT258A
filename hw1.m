rng(22)
m=100; n=30;
A = randn(m,n);
b = randn(m,1);

%l1 norm
cvx_begin
    variable x1(n)
    minimize(norm(A*x1-b,1))
cvx_end

%l2 norm
cvx_begin
    variable x2(n)
    minimize(norm(A*x2-b,2))
cvx_end

%deadzone penalty
a=0.5

cvx_begin
    variable x3(n)
    minimize(sum(max(abs(A*x3-b)-a,0)))
cvx_end


% parameters for Newton Method & line search
alpha=.01; beta=.5;

% minimize linfty norm to get starting point
cvx_begin
    variable xlb(n)
    minimize norm(A*xlb-b,Inf)
cvx_end
linf = cvx_optval;
A = A/(1.1*linf);
b = b/(1.1*linf);

for iters = 1:50

   yp = 1 - (A*xlb-b);  ym = (A*xlb-b) + 1;
   f = -sum(log(yp)) - sum(log(ym));
   g = A'*(1./yp) - A'*(1./ym);
   H = A'*diag(1./(yp.^2) + 1./(ym.^2))*A;
   v = -H\g;
   fprime = g'*v;
   ntdecr = sqrt(-fprime);
   if (ntdecr < 1e-5), break; end;

   t = 1;
   newx = xlb + t*v;
   while ((min(1-(A*newx -b)) < 0) | (min((A*newx -b)+1) < 0))
       t = beta*t;
       newx = xlb + t*v;
   end;
   newf = -sum(log(1 - (A*newx-b))) - sum(log(1+(A*newx-b)));
   while (newf > f + alpha*t*fprime)
       t = beta*t;
       newx = xlb + t*v;
       newf = -sum(log(1-(A*newx-b))) - sum(log(1+(A*newx-b)));
   end;
   xlb = xlb+t*v;
end
ss = max(abs([A*x1-b; A*x2-b; A*x3-b;  A*xlb-b]));
tt = -ceil(ss):0.03:ceil(ss);  % sets center for each bin
[N1,hist1] = hist(A*x1-b,tt);
[N2,hist2] = hist(A*x2-b,tt);
[N3,hist3] = hist(A*x3-b,tt);
[N4,hist4] = hist(A*xlb-b,tt);


range_max=2.5;  rr=-range_max:1e-3:range_max;

figure(1), clf, hold off
subplot(4,1,1),
bar(hist1,N1);
hold on
plot(rr, abs(rr)*40/3, '-');
ylabel('p=1')
axis([-range_max range_max 0 40]);
hold off

subplot(4,1,2),
bar(hist2,N2);
hold on;
plot(rr,2*rr.^2),
ylabel('p=2')
axis([-range_max range_max 0 10]);
hold off

subplot(4,1,3),
bar(hist3,N3);
hold on
plot(rr,30/3*max(0,abs(rr)-0.5))
ylabel('Deadzone')
axis([-range_max range_max 0 20]);
hold off

subplot(4,1,4),
bar(hist4,N4);
rr_lb=linspace(-1+(1e-6),1-(1e-6),600);
hold on
plot(rr_lb, -3*log(1-rr_lb.^2),rr,2*rr.^2,'--')
axis([-range_max range_max 0 10]);
ylabel('Log barrier'),
xlabel('r')
hold off

