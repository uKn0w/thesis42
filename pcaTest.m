clc;clear all;
load data_train_all;
[u,s,d]=svd(abs(X));