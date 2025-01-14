%đo lường số lần tín hiệu đi qua giá trị zero (đi qua trục hoành) trong suốt quá trình tín hiệu
%Nếu Z_SQI cao, điều này có thể cho thấy tín hiệu có sự thay đổi mạnh mẽ hoặc dao động liên tục (ví dụ, trong các tín hiệu có tần số cao).
windowSize = 4;
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n);

zeroCrossingNum = 0;
for i = 1:1:(length(Raw_Sig)-1)
    if (Raw_Sig(i)*Raw_Sig(i+1)<=0)
        zeroCrossingNum = zeroCrossingNum +1;
    end
end
Z_SQI = zeroCrossingNum/length(Raw_Sig);


