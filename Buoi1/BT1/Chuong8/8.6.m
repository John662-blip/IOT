%Đoạn mã này thực hiện một phân tích phương sai một chiều (ANOVA), nhằm so sánh các giá trị trung bình của ba nhóm dữ liệu giả lập: Normotensive, Prehypertensive, và Hypertensive.
u1=rand(100); % simulates feature values extracted from Normtensive subjects
u2=rand(100); % simulates feature values extracted from Prehypertensive subjects
u3=rand(100); % simulates feature values extracted from Hypertensive subjects
U = [u1 u2 u3];
anova1(U)