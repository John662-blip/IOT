%Mô phỏng dữ liệu giả lập
%Normotensive: Tạo một tập dữ liệu giả lập cho nhóm đối tượng huyết áp bình thường
%Hypertensive: Tạo một tập dữ liệu giả lập cho nhóm đối tượng huyết áp cao 
%mu1 và mu2: Trung bình của các đặc trưng trong hai nhóm (nhóm huyết áp bình thường và huyết áp cao).
%var1 và var2: Độ lệch chuẩn của các đặc trưng trong hai nhóm

N1=100; % number of normotensive subjects
N2=40; % number of hypertensive subjects
mu1=3;
mu2=0;
var1=1;
var2=1;
Normtensive=mu1+var1*randn(1,N1);
Hypertensive=mu2+var2*randn(1,N2);
histogram(Normtensive)
hold on, histogram (Hypertensive)
xlabel('Feature value');
ylabel('Frequency');