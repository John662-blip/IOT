%Skewness đo lường sự lệch của phân phối tín hiệu về phía trái hay phải. Nó cho biết liệu tín hiệu có xu hướng lệch sang một phía so với trung bình hay không.
%Nếu skewness > 0, phân phối có xu hướng lệch phải (phần đuôi phải dài hơn phần đuôi trái).
%Nếu skewness < 0, phân phối có xu hướng lệch trái (phần đuôi trái dài hơn phần đuôi phải).
%Nếu skewness = 0, phân phối là đối xứng (giống phân phối chuẩn).
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n);

S_SQI = skewness(Raw_Sig);
