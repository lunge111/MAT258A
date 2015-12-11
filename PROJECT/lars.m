
function [beta, A] = lars(X, Y,  t, tol)
[n,p] = size(X);
beta = zeros(1,p);
mu = zeros(n,1);   
gamma = [];
A = [];
Ac = 1:p;
numvars = 0;
next = 1;
i = 0;
mu_old = zeros(n,1);
t_prev = 0;
beta_t = zeros(1,p);
ii = 1;
tt = t;

% LARS loop
while numvars < p,
    i = i+1;
    c = X'*(Y-mu); 
    C = max(abs(c));   
    if C < tol || isempty(t), break; end    
    if 1 == i, add = find(C==abs(c)); end
    if next,
        A = [A,add]; % Add one variable to active set
        numvars = numvars+1;
    end
    s_A = sign(c(A));
    Ac = setdiff(1:p,A);  
    nZeros = length(Ac);
    X_A = X(:,A);
    G_A = X_A'*X_A; 
    invG_A = inv(G_A);
    A_A = 1/sqrt(s_A'*invG_A*s_A);
    w_A = A_A*invG_A*s_A; 
    u_A = X_A*w_A; 
    a = X'*u_A; 
    beta_tmp = zeros(p,1);
    gammaTest = zeros(nZeros,2);
    if numvars == p,
        gamma = C/A_A;  
    else
        for j = 1:nZeros,
            jj = Ac(j);
            gammaTest(j,:) = [(C-c(jj))/(A_A-a(jj)), (C+c(jj))/(A_A+a(jj))];
        end
        [gamma, min_i, min_j] = findmin(gammaTest);
        add = unique(Ac(min_i));
    end
    beta_tmp(A) = beta(A)' + gamma*w_A;  
  

    next = 1;
    gammaTest = -beta(A)'./w_A;
    [gamma2, min_i, min_j] = findmin(gammaTest);
    if gamma2 < gamma,   
     gamma = gamma2;
     beta_tmp(A) = beta(A)' + gamma*w_A;  
     beta_tmp(A(unique(min_i))) = 0;
     A(unique(min_i)) = [];  
     numvars = numvars-1;
     next = 0;
    end


        t_now = norm(beta_tmp(A),1);
        if t_prev < t && t_now >= t,
            beta_t(ii,A) = beta(A) + A_A *(t-t_prev)*w_A';   
            t = [];
            ii = ii+1;
        end
        t_prev = t_now;

    mu = mu_old + gamma*u_A; 
    mu_old = mu;
    beta =  beta_tmp';
end

if 1 < ii,
    noCons = (tt > norm(beta_tmp,1));
    if 0 < sum(noCons),
        beta_t(noCons,:) = repmat(beta_tmp',sum(noCons),1);
    end
    beta = beta_t;
   
end
 beta=beta(end,:);
end





