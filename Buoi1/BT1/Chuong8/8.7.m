%phương pháp đo khả năng phân biệt giữa hai nhóm dữ liệu. Đây là một chỉ số quan trọng trong việc đánh giá và chọn đặc trưng cho các bài toán phân loại.
%Nếu giá trị Fisher’s Measure lớn, điều đó cho thấy đặc trưng này có khả năng tốt để phân loại hai nhóm. Nếu nhỏ, đặc trưng này không có nhiều ý nghĩa trong việc phân loại.
F_N = [1 2 3 -8 -6 -2 -9]
F_H = [-9 -2 7 18 -6 -8 -1]
m_N = mean(F_N); % Tính trung bình (mean) của vector F_N (nhóm Normotensive)
m_H = mean(F_H); % Tính trung bình (mean) của vector F_H (nhóm Hypertensive)
v_N = var(F_N);% Tính phương sai (variance) của vector F_N (nhóm Normotensive)
v_H = var(F_H); % Tính phương sai (variance) của vector F_H (nhóm Hypertensive)
J_F = (m_N - m_H)^2 / (v_N + v_H);% Tính Fisher’s Measure J_F
