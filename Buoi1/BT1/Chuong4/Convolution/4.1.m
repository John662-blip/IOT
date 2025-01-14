% Cải thiện chất lượng PPG bằng tích chập conv
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
template =  sin(2 * pi * (1:n) / 20);
f = template; % Dữ liệu mẫu tốt nhất
g = Raw_Sig; % Dữ liệu thô cần cải thiện
g = resample(Raw_Sig, length(f), length(g)); % thay đổi độ dài của tín hiệu Raw_Sig (ký hiệu là g) sao cho nó có cùng số mẫu với tín hiệu mẫu f.

conv_f_g = conv(f, g);
conv_g_f = conv(g, f);

figure;
subplot(4,1,1)
plot(f, 'k--');
title('f: Template');
subplot(4,1,2);
plot(g, 'r--');
title('g: Raw signal');
subplot(4,1,3);
plot(conv_f_g);
title('f * g');
subplot(4,1,4);
plot(conv_g_f);
title('g * f');
sgtitle('Convolution');
