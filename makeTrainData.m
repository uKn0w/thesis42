clc;clear all;close all;
fLvl={'low' 'med' 'high'};
X=[];
Y=[];
for k=1:3
fName=sprintf('%s_train_all.mat',fLvl{k});
load(fName);
% M=load(fName);
% f=fieldnames(M);
X=[X;featTrain];
Y=[Y;y_true_train];

end
save data_train_all X Y;

