%Dùng hist để hiện PPG kiểu histogram (Biểu đồ tần suất )
n = 100; % Số lượng mẫu
Y = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)

figure, hist(Y)