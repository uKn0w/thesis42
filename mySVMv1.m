clc;clear all;close all;

%%Training
clc;clear all;close all;

load data_train_all
% load low_check_all
% parpool
options = statset('UseParallel',1);
% featTrain=abs(featTrain);
% bxCon=[.01 .03 .1 .3 1 3];
bxCon=160;
kerScale=6;
lossA=[];
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
            'Coding','onevsall','Options',options);
%         CVMdl=crossval(Mdl);
%         oosLoss(count)=kfoldLoss(CVMdl);
        
        bk=[bk;[bxCon(i) kerScale(j)]]
        
    end
end
% figure
% plot(oosLoss),title(sprintf('trial %d',k))
% [M,I]=min(oosLoss);
% lossA=[lossA;M];
% bkA=[bkA;bk(I,:)];

toc
end
lossA
bkA
%save all data models
% save('trained_byLow.mat');
load low_check_all
X=abs(featCheck);
Y=y_true_check;
oofLabel=predict(Mdl,X);

accuracy=ones(6,1);


for k=1:6
    count=0;
    val=find(Y==k);
    length(val)
    for kval=1:length(val)
        if oofLabel(val(kval))==k
         count=count+1;
        end
    end
    accuracy(k)=100*count/length(val);
end
table([1:6]',accuracy,100.-accuracy,...
    'VariableNames',{'Label','Accuracy','Error'})




% isLabels = unique(Y);
% nLabels = numel(isLabels)
% [n,p]=size(X)
% options=statset('UseParallel',1);
% % oofLabel = predict(Mdl,X);
% ConfMat = confusionmat(Y,oofLabel);
% 
% % Convert the integer label vector to a class-identifier matrix.
% [~,grp] = ismember(oofLabel,isLabels);
% oofLabelMat = zeros(nLabels,n);
% idxLinear = sub2ind([nLabels n],grp,(1:n)');
% oofLabelMat(idxLinear) = 1; % Flags the row corresponding to the class
% YMat = zeros(nLabels,n);
% idxLinearY = sub2ind([nLabels n],grp,(1:n)');
% YMat(idxLinearY) = 1;
% 
% figure;
% plotconfusion(YMat,oofLabelMat);
% h = gca;
% h.XTickLabel = [num2cell(isLabels); {''}];
% h.YTickLabel = [num2cell(isLabels); {''}];
toc