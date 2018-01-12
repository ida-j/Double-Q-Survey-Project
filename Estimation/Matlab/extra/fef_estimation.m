%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                FE estimation                %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% beta_fe

s1=0; s2=0;
for i=ids_u'
    
    xi = xx(ids== i,:);
    yi = yy(ids== i,:);
    
    Ti=size(xi,1); li=ones(1,Ti);
    proj=eye(Ti)-li'*li/Ti;
    
    xii=proj*xi;
    yii=proj*yi;
    
    s1=s1+ xii'*xii;
    s2=s2+ xii'*yii;
 
end

beta_fe=s1\s2;

uu=yy-xx*beta_fe; % residuals (not demeaned!)

%% variance of beta_fe


s3=0; s4=0;

for i=ids_u' %1:N
    xi = xx(ids== i,:);
    ui = uu(ids== i,:);
    
    Ti=size(xi,1); li=ones(1,Ti);
    proj=eye(Ti)-li'*li/Ti;
    
    xii=proj*xi;
    ei=proj*ui;
    
    s3=s3 + xii'*xii;
    s4=s4 + xii'*(ei*ei')*xii;   
end



v_beta_fe=s3\s4/s3;  %%%% should the se be adjusted????
std_beta=sqrt(v_beta_fe);

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
  
    si=y2(i)-x2(i,:)'*beta_fe-z2(i,:)*gamma_fef;
    exi_ida(i)=si;
   % Vzz=Vzz+si^2*z2(i,:)*z2(i,:)';
    Vzz=Vzz+si^2*z2(i,:)'*z2(i,:);
end

Vzz=Vzz/N;

%v_gamma=inv(Qzz)/N*(Vzz+Qzx*N*v_beta_fe*Qzx')/Qzz; 
v_gamma=inv(Qzz)/N*(Vzz+Qzx'*N*v_beta_fe*Qzx)/Qzz; 
std_gamma=sqrt(diag(v_gamma));




beta=[beta_fe std_beta];
gamma=[gamma_fef std_gamma];
est=[beta;gamma];

est_alt=zeros(2*(k+1),1);

for i=1:(k+1)
    est_alt((i-1)*2+1,1)=est(i,1);
    est_alt((i-1)*2+2,1)=est(i,2);
    
end
