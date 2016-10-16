% tic
% X=featTrain;
% Y=y_true_train;
% isLabels = unique(Y);
% nLabels = numel(isLabels)
% [n,p]=size(X)
% options=statset('UseParallel',1);
% oofLabel = kfoldPredict(CVMdl,'Options',options);
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
% toc


accuracy=ones(6,1);
% lab=
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















% x=[x;y]';
% windowLength=30;
% start_ind=1;
% overlap=10;
% end_ind=windowLength;
% shift=windowLength-overlap;
% len=length(x);
% x_win=[];
% while end_ind<=len
%     x_win=x(start_ind:end_ind,:)
%     start_ind=start_ind+shift;
%     end_ind=end_ind+shift;
%     
%     
% end
