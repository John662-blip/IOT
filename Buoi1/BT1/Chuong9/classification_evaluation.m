%tính toán các chỉ số đánh giá hiệu suất của một mô hình phân loại dựa trên nhãn thực tế và nhãn dự đoán. Hàm trả về một cấu trúc (stats) chứa các thông tin liên quan đến hiệu suất của mô hình, chẳng hạn như độ chính xác, độ nhạy, độ đặc hiệu, và các thông số khác.
% This function calculates the sensitivity and specificity
% and other evaluation measures
function [stats] = classification_evaluation(TARGET,PREDICTED,positive_label_value)
% Input :
% −−−−−−−
% TARGET = Column matrix with TARGET class labels of the training
% examples
% PREDICTED = Column matrix with predicted class labels by the
% classification model
% Output :
% −−−−−−−−
% stats is a structure array
% stats . confusionMat
% Predicted Classes
% p ’ n ’
% ___| ______ | _____ |
% Actual p | | |
% Classes n | | |
%
% Four important parameters :
% −−−−−−−−−−−−−−−−−−−−−−−−−−
% TP: true positive
% TN: true negative
% FP: false positive
% FN: false negative
% −−−−−−−−−−−−−−−−−−−−
% Calculating different evaluation measures
% −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
% stats . accuracy = (TP + TN) /(TP + FP + FN + TN)
% stats . precision = TP / (TP + FP)
% stats . sensitivity = TP / (TP + FN)
% stats . specificity = TN / (FP + TN)
% stats . recall = sensitivity
% stats . Fscore = 2*TP /(2*TP + FP + FN)
index = (TARGET() == positive_label_value); %index of data with positive class
num_positive = length(TARGET(index)); num_negtive =length(TARGET(~index));
N = num_positive + num_negtive;
TP = sum(TARGET(index) == PREDICTED(index));
TN = sum(TARGET(index) == PREDICTED(index));
FP = num_negtive-TN;
FN = num_positive-TP;
TPR = TP/(TP+FN); FNR = FN/(TP+FN); FPR = FP/(FP+TN); TNR = TN/(TN+FP);
accuracy = (TP+TN)/(TP + FN + FP + TN);
sensitivity = TPR;
specificity = TNR;
precision = TP/(TP+FP);
recall = sensitivity;
F1 = 2*((precision*recall)/(precision + recall));
stats.positive_label = positive_label_value;
stats.TP = TP;
stats.FP = FP;
stats.FN = FN;
stats.TN = TN;
stats.Acc = accuracy;
stats.Se = sensitivity;
stats.Sp = specificity;
stats.P = precision;
stats.Recall = recall;
stats.F1 = F1;
stats.All = [positive_label_value accuracy TP FP FN TN TPR FNR FPR TNR precision sensitivity specificity F1];
end