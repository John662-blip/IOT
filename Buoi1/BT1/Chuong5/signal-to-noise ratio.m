%Chỉ số N_SQI đánh giá tỷ lệ giữa độ biến thiên của tín hiệu và độ biến thiên của nhiễu
% Khi N_SQI cao, tín hiệu có ít nhiễu và rõ ràng hơn. Ngược lại, khi N_SQI thấp, có thể có nhiều nhiễu trong tín hiệu.
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n);
kernel = [0,0, 1/4, 1/4, 1/4, 1/4, 0, 0];%x1/4+x2/4+x3/4+x4/4  khi vào hàm conv
Filtered_Sig = conv(Raw_Sig, kernel, 'same');

std_signal = std(abs(Filtered_Sig));
std_noise = std(Filtered_Sig);
N_SQI = std_signal/std_noise;


