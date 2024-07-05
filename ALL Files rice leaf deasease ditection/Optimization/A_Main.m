
% EO Algorithm 
clear, clc, close;
% Number of k in K-nearest neighbor
opts.k = 10; 
% Ratio of validation data
ho = 0.3;
% Common parameter settings 
opts.N  = 10;     % number of solutions
opts.T  = 100;    % maximum number of iterations
% Load dataset
% load('fused.mat')
load('fusionfeatures.mat');% fusion

feat=fusionVitself;% features
% feat=feat.;
% feat=feat';
label=testLabelsDL; %label
% label=label.;
% Divide data into training and validation sets
HO = cvpartition(label,'HoldOut',ho); 
opts.Model = HO; 
% Perform feature selection 
FS     = jfs('ja',feat,label,opts);
% Define index of selected features
sf_idx = FS.sf;
SfeatJAFinal=FS.ff;

save SfeatJAFinal.mat
% Accuracy  
%Acc    = jknn(feat(:,sf_idx),label,opts); 
% Plot convergence
plot(FS.c); grid on;
xlabel('Number of Iterations');
ylabel('Fitness Value'); 
title('SMA');

optfeat=im2double(SfeatJAFinal);
optfeat=array2table(optfeat);
optfeat.type=label;
% classificationLear
classificationLearner