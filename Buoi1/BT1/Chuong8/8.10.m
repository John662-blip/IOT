%ày tính một chỉ số đo lường khả năng phân biệt giữa hai nhóm dữ liệu dựa trên trung bình và ma trận hiệp phương sai của chúng. Cụ thể, đây là một công thức liên quan đến Bhattacharyya Distance 
F_N = [1 2 3 -8 -6 -2 -9]
F_H = [-9 -2 7 18 -6 -8 -1]
Cov_N = cov(F_N,1); % F_N is the PPG feature matrix (multiple features) for normotensive subjects
Cov_H = cov(F_H,1); % F_H is the PPG feature matrix (multiple features) for hypertensive subjects
n1 = size(F_N,1);
n2 = size(F_H,1);
N = n1 + n2;
Sw = ( (n1/N)*Cov_N + (n2/N)*Cov_H );
c = [F_N;F_H];
Sm = cov(c,1);
J_s = trace( inv(Sw)*Sm ) / size(F_N,2);
