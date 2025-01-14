%Xác định liệu các đặc trưng trích xuất từ tín hiệu PPG

x = [1 2 3 8]
y = [-5 8 1 6]
%%
% Kiểm tra giả thuyết về sự bằng nhau của trung bình hai mẫu độc lập x và y
%  giả sử các mẫu tuân theo phân phối chuẩn với phương sai bằng nhau nhưng chưa biết
% h1 =1 Bác bỏ giả thuyết H
% h0 =0.Không bác bỏ giả thuyết 
h = ttest2(x,y) 
%%

%%
%Kiểm tra xem dữ liệu trong x có tuân theo phân phối chuẩn (hoặc phân phối tiêu chuẩn hoá) hay không
% 1 : bác bỏ ; 0 : ko bác bỏ.
h = kstest(x)
%%

%%
%Tương tự như kstest, nhưng kiểm định Lilliefors phù hợp hơn khi tham số phân phối chuẩn (trung bình và phương sai) chưa được biết trước
% 1 : ko tuân theo phân phối chuẩn.; 0 : tuân theo
h = lillietest(x)
%%

%%
%Kiểm tra sự khác biệt về trung vị giữa hai mẫu độc lập x và y 
% p<0.05 Bác bỏ ;p>=0.05 ko bác bỏ.
p = ranksum(x,y)
%%
%%
%Xác định kích thước mẫu cần thiết để đạt được một công suất kiểm định (power) nhất định, hoặc ngược lại, tính công suất kiểm định với kích thước mẫu hiện tại.
testtype='t'
p0=[0.04 0.06]
p1=[0.01 0.1]
nout = sampsizepwr(testtype,p0,p1)
%%