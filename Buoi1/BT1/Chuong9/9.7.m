%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 12.7.6
% START_Classification_DeepLearning .m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Notes:−−−−−−−−BP label
%Label value 1 2
%categories Norm HT
%Dùng deep learning để phân loại 
%% set folder path
clc; clear; close all;
addpath(genpath(pwd));
path.data = '.\DATA\'; path.output ='.\OUTPUT\';
%% Load image classification dataset into imageDatastore
parentDir = path.data;
dataDir = 'data';
allImages = imageDatastore(fullfile(parentDir,dataDir),'IncludeSubfolders',true,'LabelSource','foldernames');
%% Statistics and Data Visualization for dataset
count.Norm = sum(str2num(char(allImages.Labels))== 1);
count.HT = sum(str2num(char(allImages.Labels))== 2);
figure(1); pie3([count.Norm,count.HT],{'NormBP','HT BP'});legend(num2str(count.Norm),num2str(count.HT))
%% Divide the dataset into trainset (60%) ,validation (20%) and testset (20%)
[imgsTrain,imgsValidation,imgsTest] = splitEachLabel(allImages,0.6,0.2,0.2,'randomized');
count.train = numel(imgsTrain.Files);
count.validation = numel(imgsValidation.Files);
count.test = numel(imgsTest.Files);
%% Build Transfer Learning Model using GoogLeNet
%Notice : GoogLeNet requires RGB images of size 224−by−224−by−3.
net = googlenet;
%Extract the layer graph from the network and plot the layer graph .
lgraph = layerGraph(net);
%% Modify GoogLeNet Network Parameters
lgraph = removeLayers(lgraph,{'pool5-drop_7x7_s1','loss3-classifier','prob','output'});
numClasses = numel(categories(imgsTrain.Labels));
newLayers = [
dropoutLayer(0.6,'Name','newDropout')
fullyConnectedLayer(numClasses,'Name','fc',' WeightLearnRateFactor',5,'BiasLearnRateFactor',5)
softmaxLayer('Name','softmax')
classificationLayer('Name','classoutput')];
lgraph = addLayers(lgraph,newLayers);
lgraph = connectLayers(lgraph,'pool5-7x7_s1','newDropout');
%% Training Options Setting
options = trainingOptions('sgdm',...
'MiniBatchSize',64,...
'MaxEpochs',3,...
'InitialLearnRate',1e-4,...
'ValidationData',imgsValidation,...
'ValidationFrequency',10,...
'ValidationPatience',Inf,...
'Verbose',1,...
'ExecutionEnvironment','cpu',...
'Plots','training-progress');
%% Training Model
trainedGN = trainNetwork(imgsTrain,lgraph,options);
%% Testing Model
[YPred,probs] = classify(trainedGN,imgsTest);
%% Performance Evaluation
[stats] = classification_evaluation(str2num(char(imgsTest.Labels)),str2num(char(YPred)),2);
%% Export Classification Results
head_name = {'Norm','HT','train','validation','test','Acc','Sen','Spe','Pre','Recall','F1'};
T=table(count.Norm, count.HT,count.train, count.validation,count.test, ...
    stats.Acc, stats.Se, stats.Sp, stats.P,stats.Recall,stats.F1, ...
    'VariableNames',head_name,'RowNames',{'GoogLeNet'});
writetable(T,[path.output 'classification_result.csv'],'WriteRowNames',true);