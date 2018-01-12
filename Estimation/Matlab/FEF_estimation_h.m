clear all
clc
close all
addpath(genpath('~/Dropbox/Double Q Survey Replication/'))

%% load data & define variables

%panel=importdata('~/Dropbox/Double Q Survey Replication/Data/csv/panel_fef_loc_h.csv');
%d=panel.data;
d=xlsread('~/Dropbox/Double Q Survey Replication/Data/csv/panel_fef_loc_h.xlsx');

vars=d(:,3:end);
ids=d(:,1);
ids_u=unique(ids);
N=length(ids_u); % no. of unique individuals
time=d(:,2); 
T=max(time); % max no. of time periods

xx_e=vars(:,1); yy_e=vars(:,2:4);
xx_g=vars(:,5); yy_g=vars(:,6:8);
xx_h=vars(:,9); yy_h=vars(:,10:12);

zz=vars(:,13:13+7);  % time-invariant variables with homeowner
k=size(zz,2);   % no. of time-invariant regressors
                        


%%%%%%%%%%%%% equity estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx=xx_e;
yy=yy_e(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est1e=est_alt;

yy=yy_e(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est2e=est_alt;


yy=yy_e(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est3e=est_alt;

%%%%%%%%%%%%% gold estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx=xx_g;
yy=yy_g(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est1g=est_alt;

yy=yy_g(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est2g=est_alt;

yy=yy_g(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est3g=est_alt;

%%%%%%%%%%%%% house estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx=xx_h;
yy=yy_h(:,1);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est1h=est_alt;

yy=yy_h(:,2);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est2h=est_alt;

yy=yy_h(:,3);
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/fef_estimation.m'
est3h=est_alt;

est_all=[est1e est1g est1h est2e est2g est2h est3e est3g est3h];
est=est_all(1:(2+2*8),:);




k2=8;

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




filename='~/Dropbox/Double Q Survey Replication/tex/FEF_estimates_h.tex';
caption = '\\begin{table}[!h]\\caption{Fixed Effects Filtered estimates}\\centering \n';
run '~/Dropbox/Double Q Survey Replication/Estimation/MATLAB/extra/FEF_2_latex_h.m'









