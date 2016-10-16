clc;clear all;close all;
load svm_by_all
options = statset('UseParallel',1);
tic
CVMdl=crossval(Mdl,'Options',options,'KFold',8);
toc
tic
oosLoss = kfoldLoss(CVMdl,'Options',options)
toc