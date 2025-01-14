% vẽ đáp ứng tần số (frequency response) của Butterworth filter

Fs = 200;% Tần số lấy mẫu của tín hiệu (200 Hz)
Fc = 6 / (Fs / 2);%Tần số cắt chuẩn hóa của bộ lọc (Tần số cắt là ngưỡng mà bộ lọc bắt đầu làm suy giảm tín hiệu.)
m = 6;%Bậc của bộ lọc Butterworth.(Bộ lọc bậc cao hơn sẽ có biên độ đáp ứng dốc hơn tại tần số cắt, giúp phân tách rõ ràng giữa dải tần số giữ lại và dải tần số bị loại bỏ.)
[num, dend] = butter(m, Fc);%Tạo ra một bộ lọc 
L = logspace(0, 2);%Tạo dãi tần số 
Z = freqz(num, dend, L, Fs);%Tính toán 
figure;
semilogx(L, abs(Z), 'k');
grid on;
xlabel('Hz');
ylabel('Gain');
title('Butterworth Filter');
