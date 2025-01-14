%Lưu khoảng cách của các đỉnh 
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
Fs = 125; %sampling frequency of MIMIC Database
peakLocs = findpeaks(Raw_Sig); % phất hiện các đỉnh 
intervals = diff(peakLocs)/Fs;
