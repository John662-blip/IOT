%Mô phỏng tín hiệu PPG bằng kết hợp 2 hàm phân phối chuẩn Gaussian  
a = [0.8,0.4] %Chiều cao của đỉnh 0.8 hoặc 0.4
mu = [25,50] %Trung tâm của đỉnh 25 hoặc 50
sigma = [10,20] %Độ lệch chuẩn 10 hoặc 20
x = 1:1:100
y1 = a(1) * exp(-(((x-mu(1))/sigma(1)).^2)/2)
y2 = a(2) * exp(-(((x-mu(2))/sigma(2)).^2)/2)
y = y1 + y2%Kết hợp 2 hàm Gau
figure; plot(x,y,'b')
hold on; plot(x,y1,'k--');plot(x,y2,'r--')
xlabel("Sampling points")
ylabel("Amplitude")
legend("Synthetic PPG","1^{st} Gaussian","2^{nd} Gaussian")
title("An example of generating a waveform using two Gaussian functions");