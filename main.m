clc;
clear all;
close all;

load A1_ball_low_t1.mat
load A1_ball_low_t2.mat
load A1_ball_low_t3.mat
load A1_ball_low_t4.mat
load A1_ball_low_t5.mat

featWin=14000;

load featureTrain.mat
load featureCheck.mat
featureV=featureVector(t1(1:featWin,:));
featureV=[featureV;featureVector(t2(1:featWin,:))];
featureV=[featureV;featureVector(t3(1:featWin,:))];
featureV=[featureV;featureVector(t4(1:featWin,:))];
featureV=[featureV;featureVector(t5(1:featWin,:))];
y_true_train=[y_true_train;ones(4,1)];
y_true_check=[y_true_check;ones(1,1)];
featTrain=[featTrain;featureV(1:4,:)];
featCheck=[featCheck;featureV(5,:)];
save featureTrain.mat featTrain y_true_train;
save featureCheck.mat featCheck y_true_check;