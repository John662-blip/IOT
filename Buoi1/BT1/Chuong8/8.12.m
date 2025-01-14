% thực hiện một quy trình chọn tập hợp đặc trưng tốt nhất (Best Feature Selection) dựa trên chỉ số độ phân biệt giữa hai nhóm dữ liệu J giữa hai nhóm dữ liệu
function J = MEASURE(x1, x2)
    mean_x1 = mean(x1);
    mean_x2 = mean(x2);
    var_x1 = var(x1);
    var_x2 = var(x2);
    J = (mean_x1 - mean_x2)^2 / (var_x1 + var_x2);
end
F_N = [1 2 3; -8 -6 -2; -9 5 6]
F_H = [-9 -2 7; 18 -6 -8; -1 4 1]
x1 = F_N; % F_N is the PPG feature matrix (multiple features) for normotensive subjects
x2 = F_H; % F_H is the PPG feature matrix (multiple features) for hypertensive subjects
NumOfRequiredFeatures = 4;  % Số lượng đặc trưng cần chọn
NofFeatures = 100; % Tổng số đặc trưng có sẵn
J_max=0;% Giá trị ban đầu của độ phân biệt cao nhất
Best_Features=[];% Danh sách đặc trưng tốt nhất ban đầu
Combinations_all=nchoosek(1:NofFeatures,NumOfRequiredFeatures);% Tất cả tổ hợp
for i=1:3
 J = MEASURE(x1(i,:),x2(i,:)); % J is the separability measure for any function MEASURE
if J > J_max
 J_max = J;
 Best_Features = Combinations_all(i,:);
 end
end