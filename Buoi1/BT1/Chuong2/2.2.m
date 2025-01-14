%Mô phỏng tín hiệu PPG bằng sóng kết hợp từ 2 sóng  
x=0:pi/100:2*pi;  % tạo 1 list từ 0 -> 2*pi sao cho khoản cách của 2 phần từ liền kề nhau là pi/100
wave_2=cos(x*3)+cos(x*7-2)
figure , plot(wave_2)
xlabel("Angle")
ylabel("Amplitude")
title ("How to simulate PPG waveforms using sinusoids in Matlab.");

