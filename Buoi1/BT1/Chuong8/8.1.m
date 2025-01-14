%thực hiện chuẩn hóa (normalization) các đặc trưng (features) của một tập dữ liệu, cụ thể là đảm bảo mỗi đặc trưng có trung bình bằng 0 và phương sai bằng 1.

Features = [
    1 2 3;
    4 5 6;
    7 8 9];
for i=1:3
 meanOfFeature=mean(Features(i,:));
 stdOfFeature=std(Features(i,:));
 NormalizedFeatures(i,:)=((Features(i,:)-meanOfFeature)/stdOfFeature);
end