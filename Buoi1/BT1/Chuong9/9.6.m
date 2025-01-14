% thực hiện các bước phân loại dữ liệu (classification) dựa trên phương pháp học máy, bao gồm xử lý dữ liệu, chọn đặc trưng, huấn luyện mô hình, đánh giá hiệu suất và lưu kết quả.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Section 12.7.5
% START_Classification .m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Notes:−−−−−−−−−−−−−−−−−−−BP label
%Label value 1 2
%Group Norm HT
%% set folder path Cài đặt đường dẫn
clc; clear; close all;
addpath(genpath(pwd));
path.data = '.\DATA\' ; path.output ='.\OUTPUT\' ;
%% Tải và chuẩn hóa dữ liệu:
dataset = load([path.data,'Norm_vs_HT.csv']);
target_Y = dataset(:,1);%Lay nhãn
feature_X = zscore(dataset(:,2:end)); %lấy các đặt trưng và chuẩn hóa 
%% Hiển thị tổng số mẫu và số lượng mỗi nhóm (Norm và HT) dưới dạng biểu đồ 3D (pie3).
[row,column]= size(dataset);
count.sample = row;
count.feature = column-1;
count.Norm = sum(target_Y==1);
count.HT = sum(target_Y==2);
figure(1); pie3([count.Norm,count.HT],{'NormBP','HT BP'});legend(num2str(count.Norm),num2str(count.HT))
%% Chọn đặc trưng quan trọng Sử dụng phương pháp ReliefF để đánh giá tầm quan trọng của các đặc trưng
[relieff_fList,relieff_weight] = relieff(feature_X,target_Y,10,'method','classification');
figure(2); bar(relieff_weight); xlabel('featureindex');ylabel('feature weight');
%% .Lựa chọn Top-N đặc trưng quan trọng nhất (30% tổng số đặc trưng).
TopN = floor(0.3*count.feature);
opt_feature_X = feature_X(:,relieff_fList(1:TopN));
%% Huấn luyện và kiểm tra mô hình Sử dụng 10-fold cross-validation để chia dữ liệu thành 10 nhóm, lần lượt sử dụng 9 nhóm để huấn luyện và 1 nhóm để kiểm tra.
Kfold = 10;
indices = crossvalind('Kfold',target_Y,Kfold);
%10
sum_Acc = 0; sum_Sen = 0; sum_Spe = 0; sum_Pre =0; sum_Recall= 0;sum_F1 = 0;
for num_CV= 1:1:Kfold
    test = (indices == num_CV); train = ~test;
%% Divide the dataset into trainset (90%) and testset (10%)
    train_X = opt_feature_X(train,:);
    train_Y = target_Y(train,:);
    test_X = opt_feature_X(test,:);
    test_Y = target_Y(test,:);
%% Training Model
    classifier_type = 'KNN';
    switch classifier_type
        case 'LDA' %Classifier 1: Linear Discriminant Analysis (LDA)
            trainedModel = fitcdiscr(train_X,train_Y);
        case 'KNN' %Classifier 2: k−Nearest Neighbor
            trainedModel = fitcknn(train_X,train_Y);
        case 'SVM' %Classifier 3: Support Vector Machine (SVM)
            trainedModel = fitcsvm(train_X,train_Y);
        case 'Tree' %Classifier 4: Decision Tree
            trainedModel = fitctree(train_X,train_Y);
    end
%% Testing Model
    [predicted_Y] = predict(trainedModel,test_X);
%% Performance Evaluation
    [stats] = classification_evaluation(test_Y,predicted_Y,2);
 % In Section 12.7.4
    sum_Acc = sum_Acc + stats.Acc;
    sum_Sen = sum_Sen + stats.Se;
    sum_Spe = sum_Spe + stats.Sp;
    sum_Pre = sum_Pre + stats.P;
    sum_Recall = sum_Recall + stats.P;
    sum_F1 = sum_F1 + stats.F1;
end
%% Averaged Performance Result
mean_Acc = sum_Acc/Kfold;
mean_Sen = sum_Sen/Kfold;
mean_Spe = sum_Spe/Kfold;
mean_Pre = sum_Pre/Kfold;
mean_Recall = sum_Recall/Kfold;
mean_F1 = sum_F1/Kfold;
head_name = {'Kfold','Norm','HT','Acc','Sen','Spe','Pre','Recall','F1'};
T=table(Kfold, count.Norm, count.HT,...
mean_Acc, mean_Sen, mean_Spe, mean_Pre,mean_Recall,mean_F1,...
'VariableNames',head_name,'RowNames',{classifier_type});
writetable(T,[path.output 'classification_result.csv'],'WriteRowNames',true);