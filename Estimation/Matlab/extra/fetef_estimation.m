%% OLS estimation with robust standard errors


xbar=mean(xx_wk);
ybar=mean(yy_wk);
nobs=size(yy_wk,1);

s1=0; s2=0;

for i=1:nobs
    s1=s1+(xx_wk(i,:)-xbar)'*(xx_wk(i,:)-xbar);
    s2=s2+(xx_wk(i,:)-xbar)'*(yy_wk(i,:)-ybar);

end

beta_wk=s1\s2;

y=yy_wk-ones(nobs,1)*ybar; x=xx_wk-ones(nobs,1)*xbar;
u=y -x*beta_wk;

s3=0; s4=0;

for i=1:N
    xi=x(ids== i,:);
    ui=u(ids== i,:);
    
    s3=s3+xi'*xi;
    
    s4=s4+(xi'*ui)*(ui'*xi);
      
end


v_beta_wk=inv(s3)*s4*inv(s3);
std_beta=sqrt(diag(v_beta_wk));

uu=yy-xx*beta_wk; % residuals (not demeaned!)


%% Filtered FE estimation of gamma

u=[]; z=zeros(0,k); x=[]; y=[];

for i=ids_u' 
    zi = zz(ids== i,:);
    ui = uu(ids== i,:);
    xi = xx(ids== i,:);
    yi = yy(ids== i,:);
    
    z(end+1,:)=zi(1,:);
    u(end+1,1)=mean(ui); % calculate average residual for each individual
    x(end+1,1)=mean(xi);
    y(end+1,1)=mean(yi);
    
end

dm=eye(N)-ones(N,1)*ones(1,N)/N;

% calculate y_bar_i - y_i, z, u & x

z2=dm*z; u2=dm*u; x2=dm*x; y2=dm*y;

gamma_fef=inv(z2'*z2)*z2'*u2;

%% Variance of gamma_fef


Qzz=z2'*z2/N;
Qzx=x2'*z2/N;

Vzz=0;

exi_ida=0;

for i=1:length(ids_u) %1:N
  
    si=y2(i)-x2(i,:)'*beta_wk-z2(i,:)*gamma_fef;
    exi_ida(i)=si;
   % Vzz=Vzz+si^2*z2(i,:)*z2(i,:)';
    Vzz=Vzz+si^2*z2(i,:)'*z2(i,:);
end

Vzz=Vzz/N;

%v_gamma=inv(Qzz)/N*(Vzz+Qzx*N*v_beta_fe*Qzx')/Qzz; 
v_gamma=inv(Qzz)/N*(Vzz+Qzx'*N*v_beta_wk*Qzx)/Qzz; 
std_gamma=sqrt(diag(v_gamma));




beta=[beta_wk std_beta];
gamma=[gamma_fef std_gamma];
est=[beta;gamma];

est_alt=zeros(2*(k+1),1);

for i=1:(k+1)
    est_alt((i-1)*2+1,1)=est(i,1);
    est_alt((i-1)*2+2,1)=est(i,2);
    
end
