clear all
clc
close all
addpath(genpath('~/Dropbox/Double Q Survey Replication/'))

%% load data & define variables


panel=importdata('~/Dropbox/Double Q Survey Replication/Data/csv/panel_fetef.csv');
resp=[0 456 942]; %no of response patters
filenames=cell(1,3);
filenames{1}='~/Dropbox/Double Q Survey Replication/tex/fetef_0.tex';
filenames{2}='~/Dropbox/Double Q Survey Replication/tex/fetef_456.tex';
filenames{3}='~/Dropbox/Double Q Survey Replication/tex/fetef_942.tex';

for s=1:3
d=panel.data;
vars=d(:,3:end);
vars_wk=vars(:,1:12);
vars_fef=vars(:,13:24);
zz=vars(:,25:(25+6+resp(s)));  

filename=filenames{s};

ids=d(:,1);
ids_u=unique(ids);
N=length(ids_u); % no. of unique individuals
time=d(:,2); 
T=max(time); % max no. of time periods

% variables for beta_FETE

xx_e_wk=vars_wk(:,1); yy_e_wk=vars_wk(:,2:4);
xx_g_wk=vars_wk(:,5); yy_g_wk=vars_wk(:,6:8);
xx_h_wk=vars_wk(:,9); yy_h_wk=vars_wk(:,10:12);

% variables for second stage

xx_e=vars_fef(:,1); yy_e=vars_fef(:,2:4);
xx_g=vars_fef(:,5); yy_g=vars_fef(:,6:8);
xx_h=vars_fef(:,9); yy_h=vars_fef(:,10:12);

k=size(zz,2);   % no. of time-invariant regressors
disp(['No. of time invariant variables is equal to ',num2str(k)]);       
%%%%%%%%%%%%% equity estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx_wk=xx_e_wk;
xx=xx_e;

yy_wk=yy_e_wk(:,1);
yy=yy_e(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est1e=est_alt;

yy_wk=yy_e_wk(:,2);
yy=yy_e(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est2e=est_alt;

yy_wk=yy_e_wk(:,3);
yy=yy_e(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est3e=est_alt;

%%%%%%%%%%%%% gold estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx_wk=xx_g_wk;
xx=xx_g;

yy_wk=yy_g_wk(:,1);
yy=yy_g(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est1g=est_alt;

yy_wk=yy_g_wk(:,2);
yy=yy_g(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est2g=est_alt;

yy_wk=yy_g_wk(:,3);
yy=yy_g(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est3g=est_alt;

%%%%%%%%%%%%% house estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx_wk=xx_h_wk;

yy_wk=yy_h_wk(:,1);
xx=xx_h;
yy=yy_h(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est1h=est_alt;

yy_wk=yy_h_wk(:,2);
yy=yy_h(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est2h=est_alt;

yy_wk=yy_h_wk(:,3);
yy=yy_h(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fetef_estimation.m'
est3h=est_alt;

est_all=[est1e est1g est1h est2e est2g est2h est3e est3g est3h];
est=est_all(1:(2+2*7),:);


k2=7;

est_tst=est;

for i=2:2:(2*k2+2)
est_tst(i,:)=est(i-1,:)./est(i,:);   
     
end

stars=cell(2*k2+2,9);

for i=2:2:(2*k2+2)
    for j=1:9
    
        if abs(est_tst(i,j))>1.65 && abs(est_tst(i,j))<=1.96
            stars(i-1,j)={'*'};
            
        elseif abs(est_tst(i,j))>1.96 && abs(est_tst(i,j))<=2.58
            stars(i-1,j)={'**'};
            
        elseif abs(est_tst(i,j))>2.58
            stars(i-1,j)={'***'};
        
        end
        
    end
        
end 






caption = '\\begin{table}[!h]\\caption{Filtered FE-TE estimates}\\centering \n';
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/FEF_2_latex.m'



end





