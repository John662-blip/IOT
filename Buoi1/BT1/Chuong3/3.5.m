%Dùng pspectrum để hiện Spectrogram (hiển thị sự biến đổi của các tần số
%trong tín hiệu PPG theo thời gian)
n = 100; % Số lượng mẫu
Y = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)

figure, pspectrum(Y)