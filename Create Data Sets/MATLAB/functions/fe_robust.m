[nn mx]=size(x);   %calculating the size of the data, N and T

n=nn/t;           % cross sectional dimension


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


n_beta=size(beta_fe,1);
est_fe=zeros(n_beta*2,1);

for i=1:n_beta
    est_fe((i-1)*2+1,1)=beta_fe(i,1);
    est_fe((i-1)*2+2,1)=std_beta(i,1);
end

est_fe(end+1)=n;
est_fe(end+1)=t;