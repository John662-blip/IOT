%tính một chỉ số đo lường khả năng phân biệt giữa hai nhóm dữ liệu dựa trên trung bình và ma trận hiệp phương sai của chúng. Cụ thể, đây là một công thức liên quan đến Bhattacharyya Distance (khoảng cách Bhattacharyya), một chỉ số dùng để đánh giá sự chồng lấn (overlap) giữa hai phân phối xác suất.
F_N = [1 2 3 -8 -6 -2 -9]
F_H = [-9 -2 7 18 -6 -8 -1]
Cov_N = cov(F_N); % F _ N is the PPG feature matrix (multiple features) for normotensive subjects
Cov_H = cov(F_H); % F_H is the PPG feature matrix (multiple features) for hypertensive subjects
m_N = mean(F_N,1);
m_H = mean(F_H,1);
P1 = (m_N - m_H)
P2 = inv((Cov_N + Cov_H)/2);
P3 = 0.5*log(det(Cov_N + Cov_H)/sqrt(det(Cov_N) +det(Cov_H)));
P4 = (P1' * P2 * P1)/8 + P3;
J_d = P4 / size(F_N,2); % this step normalizes the output; however, it is not present in the equation above.