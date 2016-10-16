clc;clear all;close all;
load med_train_all;
tic
obj=fitcdiscr(abs(featTrain),y_true_train)%,'Cost','square matrix','ClassName',[1:6])
toc
% tic
% cvmodel=crossval(obj);
% L=kfoldLoss(cvmodel)
% toc



tic 
% load myLda
% load med_check_all
load high_check_all
X=abs(featCheck);
Y=y_true_check;
oofLabel=predict(obj,abs(X));

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