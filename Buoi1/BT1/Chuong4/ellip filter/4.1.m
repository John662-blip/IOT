% vẽ đáp ứng tần số (frequency response) của Elliptic filter
Fs=200;%Tần số lấy mẫu
Fc=6/(Fs/2);% Tần số cắt chuẩn hóa
m=6;%Bật 
Rp=0.5;  % Gợn sóng trong dải thông (Passband ripple) (dB)
Rc=20; % Suy giảm trong dải chắn (Stopband attenuation) (dB)
[num, dend]= ellip(m,Rp,Rc,Fc); % Tạo bộ lọc
L=logspace(0,2);
Z=freqz(num,dend,L,Fs);
figure, semilogx(L,abs(Z),'K');
grid;
xlabel('Hz');
ylabel('Gain');
title('Elliptic')