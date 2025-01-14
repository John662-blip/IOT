%Mô phỏng tín hiệu PPG bằng sóng hình sin
x = 0:pi/100:2*pi % tạo 1 list từ 0 -> 2*pi sao cho khoản cách của 2 phần từ liền kề nhau là pi/100
wave_1= cos(x*2) %tạo list Ví dụ (2,wave_1(2)) là 1 phần tử của sóng hình sin
figure , plot(wave_1)
xlabel("Angle")
ylabel("Amplitude")
title ("An example of generating a waveform using a sinusoid");