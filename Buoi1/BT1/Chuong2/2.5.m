%Mô phỏng tín hiệu PPG bằng kết hợp 2 hàm phân phối chuẩn Gaussian 
Duration = 1;%Chu kì PPG 1s
Fs = 125; %Tần số lấy mẫu 125Hz
a = [0.82,0.4];%Chiều cao của đỉnh 0.82 hoặc 0.4
mu = [-pi/2,0];%Trung tâm của đỉnh -pi/2 hoặc 0
sigma = [0.6,1.2];%Độ lệch chuẩn 0.6 hoặc 1.2
Samples = Fs/Duration;%Số điểm lấy mẫu (125)
V_angle = 2*pi/Samples;%Tốc độ góc 
angle = -pi+V_angle :V_angle:pi;%lấy các góc từ -pi ->pi
y1 = a(1) * exp(-(((angle-mu(1))/sigma(1)).^2)/2);
y2 = a(2) * exp(-(((angle-mu(2))/sigma(2)).^2)/2);
y = y1 + y2;
figure; plot(angle,y,'b');
hold on; plot(angle,y1,'k--');plot(angle,y2,'r--');
xlabel("Angle");
ylabel("Amplitude");
xlim([-pi,pi]);
set(gca,'xtick',[-pi,0,pi],'xticklabel',{'\pi','0','\pi'});
legend("Synthetic PPG","1^{st} Gaussian", "2^{nd} Gaussian");
title("An example of generating a waveform using angle model");