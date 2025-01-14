%tính toán một số chỉ số quan trọng liên quan đến biến động nhịp tim
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
Fs = 125; %sampling frequency of MIMIC Database
peakLocs = findpeaks(Raw_Sig); % phất hiện các đỉnh 
intervals = diff(peakLocs)/Fs;
SDNN = std(intervals)*1000; % SDNN là độ lệch chuẩn của các khoảng cách giữa các nhịp tim (NN intervals). Nó phản ánh mức độ biến động tổng thể của nhịp tim. milis
diffNN = diff(intervals)*1000; % iffNN là sự thay đổi giữa các khoảng cách NN liên tiếp. milis
RMSSD = rms(diffNN);%RMSSD đo độ biến thiên ngắn hạn của nhịp tim, phản ánh mức độ thay đổi nhanh chóng của nhịp tim từ một nhịp tim đến nhịp tim kế tiếp.
SDSD = std(diffNN);SDSD %đo độ lệch chuẩn của sự thay đổi liên tiếp giữa các khoảng cách NN.
NN50 = length(find(abs(diffNN)>50));%NN50 là số lượng các sự thay đổi giữa các khoảng cách NN lớn hơn 50 ms.
pNN50 = NN50/length(intervals);%pNN50 là tỷ lệ các sự thay đổi giữa các khoảng cách NN lớn hơn 50 ms trong tổng số các khoảng cách NN.
NN20 = length(find(abs(diffNN)>20));%NN20 tương tự như NN50, nhưng thay vì 50 ms, nó sử dụng ngưỡng 20 ms để đếm các sự thay đổi lớn hơn 20 ms.
pNN20 = NN20/length(intervals);%pNN20 là tỷ lệ các sự thay đổi giữa các khoảng cách NN lớn hơn 20 ms trong tổng số các khoảng cách NN.
