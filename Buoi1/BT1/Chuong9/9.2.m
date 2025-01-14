% Hàm tính xác suất mật độ (Probability Density) của một phân phối chuẩn nhiều chiều (Multivariate Normal Distribution) tại một điểm đặc trưng Feature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following function calculates
% the probability density of normal distribution
function [p] = Gauss_posteriori (m,V, Feature)
%
% Input variables:
% m: mean vector of the normal distribution.
% V: covariance matrix of the normal distribution.(Kx1)
% Feature: the feature that will be tested .
%
% Output variable:
% p: the value of the normal distribution for the Feature variable.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[K,Z] = size(m);
p = (1/((2*pi)^(K/2)*det(V)^0.5))*exp(-0.5*(Feature-m)'*inv(V)*(Feature-m));
end