clc,clear all,close all;
% tic
% load trained_byLow
% load low_check_all
% X=abs(featCheck);
% Y=y_true_check;
% labels=predict(Mdl,X);
% 
% toc
load trained_byLow
load low_check_all
X=abs(featCheck);
Y=y_true_check;
tic
% X=featTrain;
% Y=y_true_train;
isLabels = unique(Y);
nLabels = numel(isLabels)
[n,p]=size(X)
options=statset('UseParallel',1);
oofLabel = predict(Mdl,X);
ConfMat = confusionmat(Y,oofLabel);

% Convert the integer label vector to a class-identifier matrix.
[~,grp] = ismember(oofLabel,isLabels);
oofLabelMat = zeros(nLabels,n);
idxLinear = sub2ind([nLabels n],grp,(1:n)');
oofLabelMat(idxLinear) = 1; % Flags the row corresponding to the class
YMat = zeros(nLabels,n);
idxLinearY = sub2ind([nLabels n],grp,(1:n)');
YMat(idxLinearY) = 1;

figure;
plotconfusion(YMat,oofLabelMat);
h = gca;
h.XTickLabel = [num2cell(isLabels); {''}];
h.YTickLabel = [num2cell(isLabels); {''}];
toc
