%Kurtosis là một chỉ số thống kê giúp đánh giá hình dạng của phân phối dữ liệu, đặc biệt là độ nhọn của nó. Nó cho bạn biết liệu phân phối của tín hiệu có tập trung nhiều ở trung tâm (đỉnh) hay có đuôi dài.
%Kurtosis = 3: Phân phối có dạng chuẩn (Gaussian). Đây là giá trị kurtosis của phân phối chuẩn.
%Kurtosis > 3: Phân phối có đỉnh nhọn hơn so với phân phối chuẩn, tức là tín hiệu có xu hướng tập trung nhiều hơn ở trung tâm và có đuôi dài hơn (phân phối leptokurtic).
%Kurtosis < 3: Phân phối có đỉnh phẳng hơn so với phân phối chuẩn, tức là tín hiệu có xu hướng ít tập trung hơn ở trung tâm và có đuôi ngắn hơn (phân phối platykurtic).

windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n);

K_SQI = kurtosis(Raw_Sig);
