clear all
y = [0.3573, 0.3618, 0.1920, 0.1585, 0.1041, 0.1100, 0.0560, 0.0291, 0.0252, 0.0249, 0.04160];
t = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

sig = .02;
x0 = [0,0]; %starting guess for optimization
n = length(y);

%%%% MLE estimator %%%%%%%
X_MLE = fminsearch(@(x) myfunc(x,sig,t,y),x0);
t_le = linspace(0,1,50);
y_le = X_MLE(1)*exp(-X_MLE(2)*t_le);

%%%%% Conditional mean estimator with gaussian prior %%%%%%%
c = 1/(det(sig^2*eye(2)))*(1/(2*pi))^(n/2+1);

fun1 = @(a,b) c*b.*exp(-1/2*(a.^2/sig^2+b.^2/sig^2)).*exp(-myfunc([a b],sig,t,y));
fun2 = @(a,b) c*a.*exp(-1/2*(a.^2/sig^2+b.^2/sig^2)).*exp(-myfunc([a b],sig,t,y));

X_CM1 = [integral2(fun1,-inf,inf,-inf,inf) integral2(fun2,-inf,inf,-inf,inf)];


%%%%% Conditional mean estimator with uniform prior %%%%%%%

c0 = 0;
c1 = 1;
c = 1/(det(sig^2*eye(2)))*(1/(2*pi))^(n/2+1);

fun1 = @(a,b) c*b.*exp(-1/2*(a.^2/sig^2+b.^2/sig^2)).*exp(-myfunc([a b],sig,t,y));
fun2 = @(a,b) c*a.*exp(-1/2*(a.^2/sig^2+b.^2/sig^2)).*exp(-myfunc([a b],sig,t,y));

X_CM2 = [integral2(fun1,c0,c1,c0,c1) integral2(fun1,c0,c1,c0,c1)];



%%%%%%% MAP estimator with gaussian prior distribution %%%%%%%%%%%%%%%%%%%%

mu = [0 0];
Sigma = sig*eye(2);

lp = @(a) (a-mu)*inv(Sigma)*(a-mu)'+1/(2*sig^2)*myfunc(a,sig,t,y);
X_MAP1 = fminsearch(lp,x0);

%%%%%%%% MAP estimator with uniform prior distribution %%%%%%%%%%%%%%%%%%%

% uniform distribution with parameters 0 and 1
lu = @(a) -log(U_prior(a,5,10)) + myfunc(a,sig,t,y); % I through away all the constant value sice they are not affacting the optimization problme
X_MAP2 = fminsearch(lu,x0);

%%%%%%% Marginal densities of a and b %%%%%%%%%%%%%%%%%%%%
% We first consider a gaussian prior with the parameters mu and Sigma below
mu = [0 2];
sig = 2;
p = @(a,b) (2*pi*det(sig^2*eye(2)))^.5*(exp(-1/2*(a-mu(1)).^2-1/2*(b-mu(2)).^2)/sig^2);

fa = @(a)integral(@(b)p(a,b),-inf,inf,'ArrayValued',true);
fb = @(b)integral(@(a)p(a,b),-inf,inf,'ArrayValued',true);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Visualizations %%%%%%%%%%%%%%%%%%%%%%%%%

% marginal densities
x = -5:.1:5;
% figure()
% plot(x,fa(x),'b',x,fb(x),'-r',linewidth = 2)
% legend('density of a', 'density of b')


% % data and ground thruth
% figure()
% plot(t,y,'o--b')
% figure()
% ksdensity(y), hold on
% hist(y), hold off



%%%%%%%% plot the estimated curves %%%%%%%%%
y_MLE = X_MLE(1)*exp(-X_MLE(2)*t);
y_MAP1 = X_MAP1(1)*exp(-X_MAP1(2)*t); % MAP with Gaussian prior
y_MAP2 = X_MAP2(1)*exp(-X_MAP2(2)*t); % MAP with Uniform prior
% figure()
% plot(t,y,'*b'), hold on
% plot(t,y_MLE,'g',t,y_MAP1,'--r',t,y_MAP2,'ob',LineWidth=2)
% legend('data','MLE','MAP1','MAP2')

%%%%%%%  Parameter tunning %%%%%%%%%%%%%%%%%%%%

% %tunning the mean first
% sig = .02;
% Sigma = sig*eye(2);
% l = [0 10 50 100];
% for k = l
% 
%     mu = [k 2*k];
%     lt = @(a) (a-mu)*inv(Sigma)*(a-mu)'+1/(2*sig^2)*myfunc(a,sig,t,y);
%     X_MAPt = fminsearch(lt,x0);
%     y_MAPt = X_MAPt(1)*exp(-X_MAPt(2)*t);
%     figure()
%     plot(t,y,'*b'), hold on
%     plot(t,y_MLE,'g',t,y_MAPt,'--r',LineWidth=2)
%     legend('data','MLE','MAP')
% end

%tunning the variance

mu = [0 0];
Sig = [.02 .1 .25 .5];

for sig = Sig
    Sigma = sig*eye(2);
    lt = @(a) (a-mu)*inv(Sigma)*(a-mu)'+1/(2*sig^2)*myfunc(a,sig,t,y);
    X_MAPt = fminsearch(lt,x0);
    y_MAPt = X_MAPt(1)*exp(-X_MAPt(2)*t);
    figure()
    plot(t,y,'*b'), hold on
    plot(t,y_MLE,'g',t,y_MAPt,'--r',LineWidth=2)
    legend('data','MLE','MAP')
end

%%%%% function to return the norm2 of f(t,\theta) %%%%%%%
function s = myfunc(a,sig,t,y)
    n = length(t);
    c =  n/2*log(2*pi*sig^2);
    s = 0;
    for i = 1:n 
    
        s = s + 1/(2*sig^2)*(y(i)-a(1)*exp(-a(2)*t(i)))^2;
    
    end
    s = s+c;
end

   


