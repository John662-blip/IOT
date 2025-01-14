
%ính toán các chỉ số trong phân tích Heart Rate Variability (HRV)  và một số chỉ số liên quan đến sự biến động của các khoảng cách giữa các nhịp tim
n = 100; % Số lượng mẫu
Raw_Sig = sin(2 * pi * (1:n) / 20) + 0.5 * randn(1, n)
Fs = 125; %sampling frequency of MIMIC Database
peakLocs = findpeaks(Raw_Sig); % phất hiện các đỉnh 
intervals = diff(peakLocs)/Fs;

%% HRV Analysis (SD1, SD2)


diffNN = diff(intervals);
SD1 = sqrt(0.5*std(diffNN)^2)*1000; % Đại diện cho sự biến động ngắn hạn của khoảng thời gian giữa các nhịp tim liên tiếp. Nó phản ánh các biến động nhanh chóng trong tín hiệu nhịp tim.
SD2 = sqrt(2*(std(intervals)^2) - (0.5*std(diffNN)^2))*1000; % ại diện cho sự biến động dài hạn, phản ánh các xu hướng dài hạn trong tín hiệu nhịp tim.
ratio_SD2_SD1 = SD2/SD1;%ỷ lệ giữa SD2 và SD1 cho biết sự phân bố của các điểm trong đồ thị Poincaré. Một tỷ lệ cao cho thấy sự biến động dài hạn chiếm ưu thế, trong khi một tỷ lệ thấp cho thấy sự biến động ngắn hạn mạnh hơn.

%% Draw Poincare plot
poincare_x = intervals(1:end-1)*1000; %convert to ms
poincare_y = intervals(2:end)*1000; %convert to ms
figure;
plot(poincare_x,poincare_y,'.');
hold on;

% Draw ellipse
phi = pi/4; % The new coordinate system is established at 45 degree to the normal axis
new_x = poincare_x ./ cos(phi); % Translate x to new coordinate
center_new_x = mean(new_x); % Get the center of values along the new x axis
[cnx, cny] = deal(center_new_x * cos(phi), center_new_x * sin(phi)); % Translate center to new x, y

% Plot ellipse
ellipse_width = SD2;
ellipse_height = SD1;
theta = 0:0.01:2*pi;
x1 = ellipse_width * cos(theta);
y1 = ellipse_height * sin(theta);
X = cos(phi) * x1 - sin(phi) * y1;
Y = sin(phi) * x1 + cos(phi) * y1;
X = X + cnx;
Y = Y + cny;
plot(X, Y, 'k--');

% Plot SD1 and SD2 inside the ellipse
line_SD1 = line([cnx cnx], [cny - ellipse_height cny + ellipse_height], 'color', 'g');
rotate(line_SD1, [0, 0, 1], 45, [cnx, cny, 0]);

line_SD2 = line([cnx - ellipse_width cnx + ellipse_width], [cny cny], 'color', 'm');
rotate(line_SD2, [0, 0, 1], 45, [cnx, cny, 0]);
