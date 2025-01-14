% thực hiện việc tính toán J-divergence (J-divergence measure), một phương pháp đo lường khả năng phân biệt giữa hai nhóm dữ liệu.
F_N = [1 2 3 -8 -6 -2 -9]
F_H = [-9 -2 7 18 -6 -8 -1]
Cov_N = cov(F_N); % Tính ma trận hiệp phương sai của nhóm Normotensive
Cov_H = cov(F_H); % Tính ma trận hiệp phương sai của nhóm Hypertensive
iCov_N = inv(Cov_N);% Ma trận nghịch đảo của hiệp phương sai Normotensive
iCov_H = inv(Cov_H);% Ma trận nghịch đảo của hiệp phương sai Hypertensive
m_N = mean(F_N,1);% Trung bình của đặc trưng nhóm Normotensive
m_H = mean(F_H,1);% Trung bình của đặc trưng nhóm Hypertensive
P1 = trace((iCov_N * Cov_H) + (iCov_H * Cov_N)- 2) /2;
x1 = (m_N - m_H);% Hiệu giữa vector trung bình của hai nhóm
x2 = (iCov_N + iCov_H);% Tổng nghịch đảo ma trận hiệp phương sai
P2 = (x1 * x2 * x1') / 2;
J_d = (P1 + P2) / size(F_N,2); % this step normalizes the output; however, it is not present in the equation above.
