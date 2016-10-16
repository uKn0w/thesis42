clc;clear all;close all;
fLvl={'low' 'med' 'high'};
for g=1:11
    LdaName=sprintf('ldaAtgamma%d.mat',g);
    load(LdaName)
    for Lvl=1:1
        checkFile=sprintf('%s_check_all',fLvl{Lvl})
        load(checkFile);
        X=abs(featCheck);
        Y=y_true_check;
        [oofLabel,score,cost]=predict(obj,abs(X));
        
        accuracy=ones(6,1);
        
        for k=1:6
            count=0;
            val=find(Y==k);
            length(val);
            for kval=1:length(val)
                if oofLabel(val(kval))==k
                    count=count+1;
                end
            end
            accuracy(k)=100*count/length(val);
        end
        fprintf('\nCheck against %s Lvl @ gamma=%d force trained by all channel\n',fLvl{Lvl},(g-1)*0.1)
        table([1:6]',accuracy,100.-accuracy,...
            'VariableNames',{'Label','Accuracy','Error'})
    end
    
    
end
% % load med_check_all

% 
