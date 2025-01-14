%thực hiện chuẩn hóa dữ liệu bằng cách áp dụng hai bước
%Chia giá trị ban đầu cho một hệ số tỷ lệ r
%Áp dụng hàm sigmoid lên dữ liệu(chuyển các giá trị về khoản [0,1])
Features = [8 5 2 6 9 2 3 4 1 5 6 9]
r = 0.5;
Features=(1.0/r)* Features;
NormalizedFeatures=1.0 ./(1.0+exp(-Features));