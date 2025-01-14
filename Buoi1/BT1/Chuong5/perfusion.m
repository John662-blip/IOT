%Tính Chỉ số P_SQI có thể được sử dụng để đánh giá chất lượng của tín hiệu đã được lọc, với giá trị càng lớn cho thấy tín hiệu càng "sạch" hoặc "mạnh mẽ". 
%Ví dụ:
%Nếu P_SQI = 50%, có nghĩa là tín hiệu lọc có biên độ thay đổi bằng một nửa giá trị trung bình của nó.
%Nếu P_SQI = 200%, có nghĩa là tín hiệu có biên độ thay đổi gấp đôi giá trị trung bình của nó, cho thấy tín hiệu có sự biến động mạnh.
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
kernel = [0,0, 1/4, 1/4, 1/4, 1/4, 0, 0];%x1/4+x2/4+x3/4+x4/4  khi vào hàm conv
Filtered_Sig = conv(Raw_Sig, kernel, 'same');

P_SQI = (max(Filtered_Sig) - min(Filtered_Sig))/abs(mean(Raw_Sig)) * 100;