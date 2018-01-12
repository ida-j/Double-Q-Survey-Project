clear all
clc
addpath(genpath('~/Dropbox/Double Q Survey Replication/'))
%c("wave","id","latitude","longitude" ,bubble.1m","crash.1m","bubble.3m","crash.3m", "bubble.1y","crash.1y"))

data_struct=importdata('~/Dropbox/Double Q Survey Replication/Data/csv/data_for_neighbor_indicators_ALT.csv');
data=data_struct.data;

T=11;
n=size(data,1)/T;

x=data(:,5:10);
latlong=data(1:n,3:4);


%% generate distance spatial matrices
Wd=zeros(n,n); %haversine distance between each pair of MSAs

for i=1:n
    for j=1:n
        [km, nmi, mi] = haversine(latlong(i,:),latlong(j,:));
        Wd(i,j)=mi;
    end
end

Wd_50=zeros(n,n);
Wd_100=zeros(n,n);
Wd_200=zeros(n,n);


for i=1:n
    for j=1:n
        if Wd(i,j)<=50 && Wd(i,j)>0
            Wd_50(i,j)=1;
        end
    end
end

for i=1:n
    for j=1:n
        if Wd(i,j)<=100 && Wd(i,j)>0
           Wd_100(i,j)=1;

        end
    end
end

for i=1:n
    for j=1:n
        if Wd(i,j)<=200 && Wd(i,j)>0
           Wd_200(i,j)=1;

        end
    end
end

G=Wd_100;
s=[sum(Wd_100,2)';sum(Wd_200,2)';sum(G,2)'];
for i=1:n        
    if sum(G(i,:))==0
        for j=1:n
            G(i,j)=Wd_200(i,j);
        end
    end
end

s=[s;sum(G,2)'];
counter=0;
for i=1:n        
    if (G(i,:)==0)==ones(1,n)
        counter=counter+1;
           G(i,:)=ones(1,n);
    end
end

for i=1:n
    G(i,i)=0;
    Wd_50(i,i)=0;
    Wd_100(i,i)=0;
    Wd_200(i,i)=0;
end
s=[s;sum(G,2)'];
W=normr(G);
W_50=normr(Wd_50);
W_100=normr(Wd_100);
W_200=normr(Wd_200);



% check if symmetric
%issym=@(x) all(all(x==x.'));

% row-normalized
% W_50=normr(Wd_50);
% W_100=normr(Wd_100);
% W_200=normr(Wd_200);


%% generate neighbor indicator data

tmp = repmat({W},T,1);
mat=blkdiag(tmp{:});
tmp = repmat({W_100},T,1);
mat_100=blkdiag(tmp{:});
tmp = repmat({W_200},T,1);
mat_200=blkdiag(tmp{:});

x_w=mat*x;
x_100=mat_100*x;
x_200=mat_200*x;

x=[x x_w];


cd '~/Dropbox/Double Q Survey Replication/Data/csv/'

csvwrite('x_spatial_ALT.csv',x);

