%Mô phỏng tín hiệu PPG và áp dụng trung bình động dùng tích chập
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
kernel = [0,0, 1/4, 1/4, 1/4, 1/4, 0, 0];%x1/4+x2/4+x3/4+x4/4  khi vào hàm conv
Filtered_Sig = conv(Raw_Sig, kernel, 'same');
figure, plot (Raw_Sig,'b');
hold on; plot (Filtered_Sig,'k--');
xlabel('Samples');
ylabel('Amplitude');
title('Moving Average')