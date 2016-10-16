clc;clear all;close all;
% load data_train_all;
% tic
% obj=fitcdiscr(abs(X),Y)%,'Cost','square matrix','ClassName',[1:6])
% toc
% tic
% cvmodel=crossval(obj);
% L=kfoldLoss(cvmodel)
% toc
tic
load svm_by_all
% load med_check_all
fLvl={'low' 'med' 'high'};
options=statset('UseParallel',1);
for Lvl=1:3
    tic
    checkFile=sprintf('%s_check_all',fLvl{Lvl})
    load(checkFile);
    X=abs(featCheck);
    Y=y_true_check;
    oofLabel=predict(Mdl,abs(X),'Options',options,'Verbose',1);
    
    accuracy=ones(6,1);
    totalC=0;
    for k=1:6
        count=0;
        val=find(Y==k);
        length(val);
        for kval=1:length(val)
            if oofLabel(val(kval))==k
                count=count+1;
                totalC=totalC+1;
            end
        end
        accuracy(k)=100*count/length(val);
    end
    totalC
    fprintf('\nCheck against %s Lvl force trained by all channel\n',fLvl{Lvl})
    table([1:6]',accuracy,100.-accuracy,...
        'VariableNames',{'Label','Accuracy','Error'})
    toc
end




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