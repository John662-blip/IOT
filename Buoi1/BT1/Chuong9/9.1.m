%thực hiện phân loại dựa trên Khoảng cách Mahalanobis. Đây là một phương pháp đo khoảng cách giữa một điểm và một phân phối xác suấ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following function performs
% the Mahalanobis distance classification
function [J] = maha_dist(m,V,Feature)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input variables:
% m: mean vector of the normal distribution.
% V: covariance matrix of the normal distribution. (Kx1)
% Feature: the feature that will be tested.
%
% Output variable:
% J: the class label
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
[l,K]=size(m);
[l,F]=size(Feature);
for i=1:F
 for ii=1:K
  J(j)=sqrt((Feature(:,i)-m(:,ii))'*inv(V)*(Feature(:,i)-maxJ(:,ii)));%Tính khoảng cách 
 end
 [num,J(i)]=min(J);
end