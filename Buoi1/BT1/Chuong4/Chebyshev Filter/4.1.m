% vẽ đáp ứng tần số (frequency response) của Cheby I filter
Fs=200; % Tần số lấy mẫu (Hz)
Fc=6/(Fs/2);% Tần số cắt chuẩn hóa
m=6; % Bậc của bộ lọc
Rs=18; % Gợn sóng trong dải thông (Passband ripple) tính bằng dB
[num, dend]=cheby1(m,Rs,Fc);%Thiết kế bộ lọc Chebyshev Type I
L=logspace(0,2);
Z=freqz(num,dend,L,Fs);
figure, semilogx(L,abs(Z),'K');
grid;
xlabel('Hz');
ylabel('Gain');
title('Chebyshev 2')