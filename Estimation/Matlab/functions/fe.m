[nn mx]=size(x);   %calculating the size of the data, N and T

n=nn/t;           % cross sectional dimension

for i=1:n
    zz(i,:)=z((i-1)*t+1,:);
end

%% fixed effects estimation of beta
y1=y;
s11=0;
s21=0;
for i=1:n
    for s=1:t
        s11=s11+(x((i-1)*t+s,:)-mean(x((i-1)*t+1:i*t,:)))'*(x((i-1)*t+s,:)-mean(x((i-1)*t+1:i*t,:)));
        s21=s21+(x((i-1)*t+s,:)-mean(x((i-1)*t+1:i*t,:)))'*(y1((i-1)*t+s)-mean(y1((i-1)*t+1:i*t)));
    end
end;
beta_fe=inv(s11)*s21;

%calculating the variance of beta_fe
s31=0;
for i=1:n
    err1=(y1((i-1)*t+1:i*t)-mean(y1((i-1)*t+1:i*t)))-(x((i-1)*t+1:i*t,:)-kron(ones(t,1),mean(x((i-1)*t+1:i*t,:))))*beta_fe;
    s31=s31+(x((i-1)*t+1:i*t,:)-kron(ones(t,1),mean(x((i-1)*t+1:i*t,:))))'*err1*err1'*(x((i-1)*t+1:i*t,:)-kron(ones(t,1),mean(x((i-1)*t+1:i*t,:))));
end;

var_beta=inv(s11)*s31*inv(s11);               %variance of the FE estimator
std_beta=sqrt(diag(var_beta));
t_stat_beta=beta_fe./sqrt(diag(var_beta));     % t-stat for the FE estimator    

%% FEF estimation
yy1=zeros(n,1);  % the average of residuals over time as independent variable
for i=1:n
    err11=y1((i-1)*t+1:i*t)-x((i-1)*t+1:i*t,:)*beta_fe;
    yy1(i)=mean(err11);
end;
    
s41=0;
s51=0;

for i=1:n
    s41=s41+(zz(i,:)-mean(zz))'*(zz(i,:)-mean(zz))/n;
    s51=s51+(zz(i,:)-mean(zz))'*(yy1(i)-mean(yy1))/n;
end

gamma_fe=inv(s41)*s51;

% calculating the variance of FEF estimator
s61=0;
s71=0;
for i=1:n
    hh1=mean(y1((i-1)*t+1:i*t))-mean(y1)-(mean(x((i-1)*t+1:i*t,:))-mean(x))*beta_fe-(zz(i,:)-mean(zz))*gamma_fe;
    s61=s61+hh1^2*(zz(i,:)-mean(zz))'*(zz(i,:)-mean(zz))/n;
    s71=s71+(zz(i,:)-mean(zz))'*(mean(x((i-1)*t+1:i*t,:))-mean(x))/n;
end

var_gamma=inv(s41)*(s61+n*s71*var_beta*s71')*inv(s41)/n;
std_gamma=sqrt(diag(var_gamma));
t_stat_gamma=gamma_fe./sqrt(diag(var_gamma));     % t-stat for the FE estimator   



n_beta=size(beta_fe,1);
n_gamma=size(gamma_fe,1);

est_gamma_fe=zeros(n_gamma*2,1);

for i=1:n_gamma
    est_gamma_fe((i-1)*2+1,1)=gamma_fe(i,1);
    est_gamma_fe((i-1)*2+2,1)=std_gamma(i,1);
end

est_gamma_fe(end+1)=n;
est_gamma_fe(end+1)=t;

