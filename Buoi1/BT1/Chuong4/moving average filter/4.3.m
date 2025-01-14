%vẽ đáp ứng tần số (frequency response) của một bộ lọc trung bình động 
Fs = 200;% Tần số lấy mẫu (Hz)
windowSize = 5;% Kích thước cửa sổ trung bình (số mẫu)
num = (1/windowSize) * ones(1, windowSize);%Tạo [0.2 0.2 0.2 0.2 0.2] (hệ số bộ lọc)
dend = 1;
L = logspace(0, 2);%: Tạo ra một vector tần số 
Z = freqz(num, dend, L, Fs);% Tính đáp ứng tần số của bộ lọc với các hệ số num (tử số) và dend (mẫu số)
figure;
semilogx(L, abs(Z), 'k');
grid on;
xlabel('Hz');
ylabel('Gain');
title('Moving Average');
