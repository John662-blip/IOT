% vẽ đáp ứng tần số (frequency response) của  Cheby II filter
Fs=200;
Fc=6/(Fs/2);
m=6;
Rs=18;
% cheby2 filter
[num, dend]=cheby2(m,Rs,Fc);
L=logspace(0,2);
Z=freqz(num,dend,L,Fs);
figure, semilogx(L,abs(Z),'K');
grid;
xlabel('Hz');
ylabel('Gain');
title('Chebyshev 2')