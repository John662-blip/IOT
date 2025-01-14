%Sử dụng hàm Gauss
% Extracting two features from two PPG signals
function [p] = Gauss_posteriori (m,V, Feature)
    [K,Z] = size(m);
    p = (1/((2*pi)^(K/2)*det(V)^0.5))*exp(-0.5*(Feature-m)'*inv(V)*(Feature-m));
end
Feature1 = [1.12 0.11]';
Feature2 = [0.7 0.33]';
% the probability of getting either classes is equal
P1 = 0.5; % a priori probability of class 1
P2 = 0.5; % a priori probability of class 2
% to clarify the idea of using Gauss function
% let ’s means m1 and m2
m1 = [1.12 0.11]';
m2 = [0.7 0.33]';
% Coveriance matrix is identity matrix
V = eye(2);
% Calculating the posteriori probabilities
p1 = P1*Gauss_posteriori(m1,V,Feature1)
p2 = P2*Gauss_posteriori(m2,V,Feature1)
p3 = P1*Gauss_posteriori(m1,V,Feature2)
p4 = P2*Gauss_posteriori(m2,V,Feature2)