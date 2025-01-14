%sử dụng hàm classify trong MATLAB để phân loại các đặc trưng (feature) vào các nhóm (Group) dựa trên phương pháp phân loại tuyến tính (linear classifier).
Feature1=[1.12 0.11];
Feature2=[0.7 0.33];
Feature3=[1.01 0.10];
Feature4=[0.6 0.3];
feature=[Feature1;Feature2;Feature3;Feature4];
Group=['Class 1';'Class 2';'Class 1';'Class 2'];
[C,err,P,logp,coeff] = classify(feature,feature,Group,'linear')
%c :Mảng các nhãn lớp đã được phân loại. Mỗi hàng trong mảng này là nhãn lớp mà mỗi đặc trưng trong feature được phân loại vào.
%err: Mức độ lỗi của quá trình phân loại, tính toán theo tỷ lệ các điểm dữ liệu bị phân loại sai.
%P: Xác suất phân loại cho mỗi mẫu. Đây là mảng có xác suất của mỗi nhóm cho từng mẫu trong feature.
%logp: Logarit của xác suất phân loại
%coeff: Các hệ số (coefficients) của phân loại tuyến tính.