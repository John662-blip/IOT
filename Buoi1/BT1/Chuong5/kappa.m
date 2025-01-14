%  tính toán chỉ số Cohen's Kappa (đánh giá mức độ mà các đánh giá hoặc
%  phân loại của hai người hoặc hai hệ thống có sự tương đồng)
n = 100; % Số lượng mẫu
x = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
n = sum(x(:)); % Tinhs tổng các phần tử 
x = x ./ n; % chia trung bình từng phần tử
r = sum(x, 2); %  Tính tổng các phần tử trong từng hàng Ví dụ: Nếu x = [0.1, 0.2; 0.3, 0.4], thì r = [0.3; 0.7].
s = sum(x); % Tính tổng 
Ex = r * s; % Tính hàm mong đợi
pom = sum(min([r'; s])); %  Tính tổng tỷ lệ lớn nhất có thể quan sát 
po = sum(sum(x .* f)); % Tính tỷ lệ quan sát 
pe = sum(sum(Ex .* f)); % Tính tỷ lệ mong đợi 
k = (po - pe) / (1 - pe); % Cohen’s kappa