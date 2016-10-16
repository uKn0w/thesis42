clear all;close all;
% load data_train_all;
% tic
% obj=fitcdiscr(abs(X),Y)%,'Cost','square matrix','ClassName',[1:6])
% toc
% tic
% cvmodel=crossval(obj);
% L=kfoldLoss(cvmodel)
% toc
tic
% load myLda
load ldagamma
% load med_check_all
fLvl={'low' 'med' 'high'};
confMat=zeros(6,6);

for Lvl=1:3
    checkFile=sprintf('%s_check_all',fLvl{Lvl});
    load(checkFile);
    X=abs(featCheck);
    Y=y_true_check;
    [oofLabel,score,cost]=predict(obj,abs(X));
    
    for k=1:6
        
        indx=find(Y==k);
        for kk=1:6
            count=0;
            
            for ik=1:length(indx)
                if oofLabel(indx(ik))==kk
                    count=count+1;
                end
                
            end
            confMat(k,kk)=100*count/length(indx);
            
        end
    end
    
    
%     accuracy=ones(6,1);
%     
%     for k=1:6
%         count=0;
%         val=find(Y==k);
%         length(val);
%         for kval=1:length(val)
%             if oofLabel(val(kval))==k
%                 count=count+1;
%             end
%         end
%         accuracy(k)=100*count/length(val);
%     end
%     fprintf('Check against %s Lvl force trained by all channel\n',fLvl{Lvl})
%     table([1:6]',accuracy,100.-accuracy,...
%         'VariableNames',{'Label','Accuracy','Error'})
confMat
%plotconfusion(Y,oofLabel)
end


toc