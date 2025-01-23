%Dùng ctw để hiện thị scalogram(Phân tích tín hiệu thành các thành phần
%sóng nhỏ hơn, gọi là wavelets,  với các độ phân giải khác nhau.)
n = 100; % Số lượng mẫu
Y = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
figure, cwt(Y, 'bump');
figure, cwt(Y, 'amor');