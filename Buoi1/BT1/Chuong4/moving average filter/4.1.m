%Mô phỏng tín hiệu PPG và áp dụng trung bình động
%ƯU điểm
% + đơn giản
% + Hiệu quả làm mượt
% + thích hợp thời gian thực
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
WindowSize = 4;
for i=1:length(x)-WindowSize
    Filtered_Sig(i) = 1/WindowSize *(Raw_Sig(i)+ Raw_Sig(i+1) + Raw_Sig(i+2) + Raw_Sig(i+3));
end

figure, plot (Raw_Sig,'b');
hold on; plot (Filtered_Sig,'k--');
xlabel('Samples');
ylabel('Amplitude');
title('Moving Average')