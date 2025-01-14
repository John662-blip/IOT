% đánh giá và xếp hạng các đặc trưng (features) của hai tập dữ liệu dựa trên một tiêu chí phân biệt 
function J = MEASURE(x1, x2)
    mean_x1 = mean(x1);
    mean_x2 = mean(x2);
    var_x1 = var(x1);
    var_x2 = var(x2);
    J = (mean_x1 - mean_x2)^2 / (var_x1 + var_x2);
end
F_N = [1 2 3; -8 -6 -2; -9 5 6]
F_H = [-9 -2 7; 18 -6 -8; -1 4 1]
x1 = F_N; % F _ N is the PPG feature matrix (multiple features) for normotensive subjects
x2 = F_H; % F_H is the PPG feature matrix (multiple features) for hypertensive subjects
for i=1:size(x1,1)
    J = MEASURE(x1(i,:),x2(i,:)); % J is the separability measure for any function MEASURE
    temp(i,1) = J;
    temp(i,2) = i;
end
[RankedFeatures,Index]=sortrows(temp,-1);%% Sắp xếp temp theo cột 1 (giảm dần)