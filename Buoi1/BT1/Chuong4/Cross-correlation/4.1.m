% Cải thiện chất lượng PPG bằng tính toán độ tương quan chéo xcorr
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
template =  sin(2 * pi * (1:n) / 20);
f = template; % % Dữ liệu mẫu tốt nhất(ổn định)
g = Raw_Sig; %  PPG cần cải thiện

g = resample(Raw_Sig, length(f), length(g)); % Resampling the signal to the same length as the template

xcorr_f_g = xcorr(f, g); % Cross-correlation of f and g
xcorr_g_f = xcorr(g, f); % Cross-correlation of g and f

figure;
subplot(4,1,1)
plot(f, 'k--'); % Plot the template
title('f: Template');
subplot(4,1,2);
plot(g, 'r--'); % Plot the raw signal
title('g: Raw signal');
subplot(4,1,3);
plot(xcorr_f_g); % Plot cross-correlation f * g
title('f * g');
subplot(4,1,4);
plot(xcorr_g_f); % Plot cross-correlation g * f
title('g * f');

sgtitle('Cross correlation'); % Use sgtitle for a title across subplots (if supported)
