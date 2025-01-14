%thực hiện chọn lọc đặc trưng tăng dần (Sequential Forward Selection - SFS) dựa trên chỉ số độ phân biệt
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
NumOfRequiredFeatures = 2; % số lượng đặc trưng cần chọn (người dùng xác định)
NofFeatures = 3; % Tổng số đặc trưng có sẵn
J_max=0;% Giá trị độ phân biệt tốt nhất ban đầu
Best_Features=[]; % Tập hợp đặc trưng tốt nhất ban đầu
counter=1;% Biến đếm số lần lặp
while counter <= NumOfRequiredFeatures
    maxJ=0;
    for i=1:NofFeatures
        if isempty(find(Best_Features==i))
            f = [Best_Features i];
        else continue;
         end
        J = MEASURE(x1(i,:),x2(i,:)); % J is the separability measure for any function MEASURE
        if J> maxJ
           J_max = J;
           Best_Features = f;
        end
    end
    counter = counter + 1;
end