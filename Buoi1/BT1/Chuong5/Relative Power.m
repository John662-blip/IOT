%chỉ số R_SQI (Relative Signal Quality Index) so sánh công suất của tín hiệu trong hai dải tần số

signal = [1 5 2 3 6 9 7 8 5 1 0 12 15 6 9]
Wave = [-5 4 -9 -12 8 12 26 16 3 1 -9 -12 -15 -6 -9]
signal = signal - mean(signal); 
NFFT = max(256, 2^nextpow2(length(Wave)));
Fs = 125; 

[pxx, f] = pwelch(signal, length(signal), length(signal)/2, (NFFT*2)-1, Fs);
%tính mật độ phổ công suất ước lượng từ tín hiệu bằng phương pháp Welch.
F1 = [1 2.25];
F2 = [0 8];
%xác định các dải tần số mà bạn muốn tính toán sức mạnh tín hiệu.

powerF1 = trapz(f(f >= F1(1) & f <= F1(2)), pxx(f >= F1(1) & f <= F1(2)));
% tính tổng công suất trong dải tần số F1.
powerF2 = trapz(f(f >= F2(1) & f <= F2(2)), pxx(f >= F2(1) & f <= F2(2)));
% tính tổng công suất trong dải tần số F2.
R_SQI = powerF1 / powerF2;
