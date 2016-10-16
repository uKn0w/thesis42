% clc;clear all;close all;

load data_train_all
% load low_check_all
% parpool
options = statset('UseParallel',1);
% featTrain=abs(featTrain);
% bxCon=[.01 .03 .1 .3 1 3];
bxCon=16;
kerScale=6;
lossA=[];
% bkA=[];X=featTrain;Y=y_true_train;
bkA=[];

for k=1:1
count=0;
bk=[];
tic
for i=1:length(bxCon)
    for j=1:length(kerScale)
        count=count+1
        t=templateSVM('Standardize',1,'BoxConstraint',bxCon(i),...
            'KernelScale',kerScale(j),'KernelFunction','gaussian');
        Mdl=fitcecoc(abs(X),Y,'Learners',t,...
            'Coding','onevsall','Options',options,'Verbose',2);
%         CVMdl=crossval(Mdl);
%         oosLoss(count)=kfoldLoss(CVMdl);
        
        bk=[bk;[bxCon(i) kerScale(j)]]
        
    end
end
figure
plot(oosLoss),title(sprintf('trial %d',k))
[M,I]=min(oosLoss);
lossA=[lossA;M];
bkA=[bkA;bk(I,:)];

toc
end
lossA
bkA
%save all data models
% save('trained_byLow.mat');