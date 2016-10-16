clc;clear all;close all;

nP=9;% #person
nT=5;% #trial
windowLength=300;%150ms@ 2kHz
overlap=100;%50ms
shift=windowLength-overlap;

fName={'th' 'ind' 'thInd' 'thIndMid' 'LRMI' 'ball'};%force name
%th=1 ind=2 thInd=3 thIndMid=4 LRMI=5 ball=6
fLvl={'low' 'med' 'high'};%force level

% nChannel=8;% #Channel

tic
% indx=0;


% y_true_check=[];

% featCheck=[];
for lvlIndx=1:3;%only med & high coz low was done before
    y_true_check=[];
    featCheck=[];
    indx=0;
    tic
    for fIndx=1:6;%length(fName)
        xFeature=[];
        tic
        %fIndx=index of force,typeIndx=index of type
        forceType=sprintf('%s_%s',fName{fIndx},fLvl{lvlIndx})%ind_med etc
        
        
        for k=1:nP   %data of 2 person
            
            for j=4:nT  % 3 trials
                
                
                fileName=sprintf('G:\\MatlabData\\aL4T1\\thesis\\data\\A%d_Force Exp\\%s\\A%d_%s_t%d.mat',k,forceType,k,forceType,j)
                
                M=load(fileName);
                f=fieldnames(M);
                xsig=M.(f{1});
                start_ind=1;
                end_ind=windowLength;
                signal_length=length(xsig);
                
                while end_ind<=signal_length
                    indx=indx+1;
                    xFeature=[xFeature;featureVector(xsig(start_ind:end_ind,:))];
                    start_ind=start_ind+shift;
                    end_ind=end_ind+shift;
                    
                end
                
                
                %                     xFeature=%M.(f{1})=t%d
                %                     indx
                
                
            end
            
            %             y_true_train=[y_true_train;fIndx*ones(4,1)];
            %             y_true_check=[y_true_check;fIndx*ones(1,1)];
            %             featTrain=[featTrain;xFeature(1:4,:)];
            %             featCheck=[featCheck;xFeature(5,:)];
            
        end
        featCheck=[featCheck;xFeature];
        y_true_check=[y_true_check;fIndx*ones(length(xFeature),1)];
        toc
    end
    savName=sprintf('%s_check_all.mat',fLvl{lvlIndx})%low_train_allchannel data
    save(savName,'featCheck','y_true_check');
    toc
end
toc

% save featureTrain.mat featTrain y_true_train;%no of trials r supposed tobe 808
% save featureCheck.mat featCheck y_true_check;