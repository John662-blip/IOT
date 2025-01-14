%Đoạn mã này thực hiện các bước phân tích và tính toán các đặc trưng của tín hiệu nhịp tim

n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
Fs = 125; %sampling frequency of MIMIC Database
peakLocs = findpeaks(Raw_Sig); % phất hiện các đỉnh 
intervals = diff(peakLocs)/Fs;
%% Interpolation
%Tín hiệu PPG có thể không đều về thời gian lấy mẫu (sampling). Phần mã này thực hiện việc nội suy (interpolation) để tạo ra một tín hiệu đều đặn, làm mịn tín hiệu và có thể phân tích dễ dàng hơn.
f_interplotion = 4;
t = zeros(1,length(intervals));
for j = 1:1:length(intervals)
    t(j) = sum(intervals(1:j));
end
t2 = t(1):1/f_interplotion:t(length(t)); % Time values for interpolation
y = interp1(t, intervals, t2', 'spline')'; % Cubic spline interpolation

%% Power Spectral Density
%Tính phổ công suất của tín hiệu sau khi đã nội suy. PSD cung cấp thông tin về tần số và cường độ của các thành phần tần số trong tín hiệu.
y1 = y - mean(y); % Remove mean
NFFT = max(256, 2^nextpow2(length(y1))); % The number of FFT points
[pxx, f] = pwelch(y1, length(t2), length(t2)/2, (NFFT*2)-1, f_interplotion); % Using Welch method to calculate the power spectrum

%% HRV
%Tính toán các chỉ số liên quan đến biến động nhịp tim (Heart Rate Variability - HRV), cụ thể là các thành phần tần số như VLF (Very Low Frequency), LF (Low Frequency), và HF (High Frequency).
f_VLF = [0 0.04]; % Frequency range of VLF
f_LF = [0.04 0.15]; % Frequency range of LF
f_HF = [0.15 0.4]; % Frequency range of HF
VLF = trapz(f(f >= f_VLF(1) & f <= f_VLF(2)), pxx(f >= f_VLF(1) & f <= f_VLF(2))) * 1e6; % The unit of VLF is ms^2
LF = trapz(f(f >= f_LF(1) & f <= f_LF(2)), pxx(f >= f_LF(1) & f <= f_LF(2))) * 1e6; % The unit of LF is ms^2
HF = trapz(f(f >= f_HF(1) & f <= f_HF(2)), pxx(f >= f_HF(1) & f <= f_HF(2))) * 1e6; % The unit of HF is ms^2
ratio_LF_HF = LF / HF;

%% Plot
figure;
plot(f(f >= f_VLF(1) & f <= f_VLF(2)), pxx(f >= f_VLF(1) & f <= f_VLF(2)), 'color', 'k');
hold on;
plot(f(f >= f_LF(1) & f <= f_LF(2)), pxx(f >= f_LF(1) & f <= f_LF(2)), 'color', 'r');
plot(f(f >= f_HF(1) & f <= f_HF(2)), pxx(f >= f_HF(1) & f <= f_HF(2)), 'color', 'b');
set(gca, 'XTick', [0, 0.04, 0.15, 0.4]);
set(gca, 'XTickLabel', {'0', '0.04', '0.15', '0.4'});
