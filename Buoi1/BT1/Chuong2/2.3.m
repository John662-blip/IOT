%Mô phỏng tín hiệu PPG bằng hàm phân phối chuẩn Gaussian  
a = 1;
mu = 50;
sigma = 10;
x = 1:1:100;%tạo list [1 2 3 .... 100]
y = a * exp(-(((x-mu)/sigma).^2)/2) ; %Hàm gau
figure; plot(x ,y);
xlabel("Sampling points");
ylabel("Amplitude");
title("An example of generating a waveform using one Gaussian function ");

