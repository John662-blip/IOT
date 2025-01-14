%Dịnh nghĩa một hàm ràng buộc (constraint function) 
function [c,ceq] = ConstrainedFun(para)
    c(1)= para(1) - para(2); % F1 < F2 (đảm bảo giá trị của tham số F1 nhỏ hơn F2)
    c(2)= para(3) - para(4); % W1 < W2 (đảm bảo giá trị của tham số W1 nhỏ hơn W2).
%Linear equality constraints
    ceq = [];
end

objectiveFun = @(para)(1 - calculateAccuracy(AnnotateEvents , DETECTOR(para(1),para(2),para(3),para(4),para(5))))
para0 = [f1_init, f2_init, w1_init, w2_init, beta_init];%Truyền vào
lpara = [f1_min, f2_min,w1_min, w2_min, beta_min];%Truyền vào
upara = [f1_max, f2_max, w1_max, w2_max,beta_max]; %Truyền vào
options = optimoptions('fmincon','Algorithm','interior–point','StepTolerance',1e-10,'ConstraintTolerance',1e-10); 
optimalPara = fmincon(objectiveFun,para0,[],[],[],[],lpara,upara,@ConstrainedFun,options);