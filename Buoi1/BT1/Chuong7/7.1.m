%đánh giá độ chính xác của một thuật toán phát hiện sự kiện so với dữ liệu sự kiện được chú thích thủ công (do con người chỉ định).


x1 = [1.2, 3.5, 6.0, 8.3, 10.1]; % Sự kiện được chú thích thủ công
x2 = [1.1, 3.4, 5.9, 8.2, 10.2]; % Sự kiện được thuật toán phát hiện
MaxDifference = 0.02; % The maximum difference in judging the accuracy of an event
TP_inAnnotate = [];
TP_inExtracted = [];
FN = [];
FP = [];
for i = 1:length(x1)
    t = find(abs(x1(i) - x2) < MaxDifference);
    if ~isempty(t)
        TP_inAnnotate = [TP_inAnnotate, i];
        TP_inExtracted = [TP_inExtracted, t];
    end
end
TP = length(TP_inAnnotate);%Sự kiện mà thuật toán phát hiện và cũng có trong x1 (với một độ lệch nhỏ hơn MaxDifference).
FN_events = x1;
FN_events(TP_inAnnotate) = [];
FN = length(FN_events);%Sự kiện có trong x1 nhưng không được thuật toán phát hiện.

FP_events = x2;
FP_events(TP_inExtracted) = [];
FP = length(FP_events);% Sự kiện có trong x2 nhưng không có trong x1.

SE = TP / (TP + FN);
PP = TP / (TP + FP); % Precision
