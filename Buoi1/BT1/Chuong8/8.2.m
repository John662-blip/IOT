% thực hiện chuẩn hóa Min-Max (Min-Max Scaling) để chuyển đổi các giá trị của đặc trưng (features) trong ma trận Features vào một khoảng cố định, được xác định bởi MinVal và MaxVal
MinVal = 0; % desired minimum value
MaxVal = 1; % desired maximum value 
Features = [
    1 2 3;
    4 5 6;
    7 8 9];
for i=1:3
 theMin=min(Features(i,:));
 theMax=max(Features(i,:));
 NormalizedFeatures(i,:)=MinVal+((MaxVal-MinVal)*(Features(i,:)-theMin))/(theMax-theMin);
end