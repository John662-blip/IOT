% tìm kiếm toàn diện (exhaustive search) để tìm ra tổ hợp tham số tối ưu (F1, F2, W1, W2, beta) sao cho tối ưu hóa hai chỉ số hiệu suất: độ nhạy (sensitivity - SE) và độ chính xác dương (positive predictivity - PP).

n = 1; % the iterations
for F1 = F1_vector % F1_vector is the selectable values of parameter F1
    for F2 = F2_vector % F2_vector is the selectable values of parameter F2
        for W1 = W1_vector % W1_vector is the selectable values of parameter W1
            for W2 = W2_vector % W2_vector is the selectable values of parameter W2
                for beta = beta_vector % beta_vector is the selectable values of parameter beta
                    ExtractedEvents = DETECTOR(F1 , F2 ,W1,W2, beta ) ; %extract events by TERMA
                    [SE(n) ,PP(n) ] = calculateAccuracy(AnnotateEvents ,ExtractedEvents ) ;%calculate the accuracy SE and +P
                    n = n + 1;
                    parameters (n, :) =[F1,F2,W1,W2, beta];
                end
            end
         end
    end
end
Results = [SE(:),PP(:), parameters];
SortedResults = sortrows ( Results, 'descend');
BestParameters = SortedResults (1, 3: end);