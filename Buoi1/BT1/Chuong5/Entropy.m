%Entropy đo lường mức độ không chắc chắn hoặc độ hỗn loạn của một tín hiệu. Hàm E_SQI này có thể được sử dụng để tính toán entropy của tín hiệu
%Giá trị E_SQI càng cao cho thấy tín hiệu càng hỗn loạn hoặc có tính không chắc chắn lớn.
%Giá trị E_SQI càng thấp cho thấy tín hiệu có tính đồng nhất hoặc ít không chắc chắn hơn.
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n);

E_SQI = -sum((Raw_Sig.^2) .* log(Raw_Sig.^2));

