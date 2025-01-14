%Đánh giá hiệu suất của mô hình phân loại dựa trên ma trận nhầm lẫn
t = zeros(150,2);
y = zeros(150,2);
%t và y là hai ma trận có kích thước 150×2 được dùng để biểu diễn nhãn (labels) trong bài toán phân loại nhị phân.
t(1:75,1) = 1;
t(76:150,2) = 1;
%. Gán nhãn cho dữ liệu thực tế t
y(1:44,1) = 1;
y(44:75,2) =1;
y(76:90,1) =1;
y(90:150,2) =1;
% Gán nhãn cho dữ liệu dự đoán y
conmat_1 = confusionmat(t(:,1),y(:,1));
disp(conmat_1)
% Tạo ma trận nhầm lẫn
figure;
plotconfusion(t(:,1)',y(:,1)');