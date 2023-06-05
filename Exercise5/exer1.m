clc;
clear all;
close all;
pkg load queueing

% Initialization
a = 0.001:0.001:0.999;
lambda = 10000; % l = 10*10^3
lambda1 = 10000*a;
lambda2 = 10000*(1-a);
mu1 = 14648;
mu2 = 11718;

total_delay = zeros(size(a));

for i = 1:length(a)
    [U1, R1, Q1, X1, P1] = qsmm1(lambda1(i), mu1);
    [U2, R2, Q2, X2, P2] = qsmm1(lambda2(i), mu2);
    total_requests = Q1 + Q2;
    total_delay(i) = total_requests / lambda;
end
#https://octave.sourceforge.io/queueing/function/qsmm1.html
#U = Server utilization
#S = Server response time
#Q = Average number of requests in the system
#X = Server throughput. If the system is ergodic (mu > lambda), we always have X = lambda
#P = Steady-state probability that there are no requests in the system.
[min_delay, min_index] = min(total_delay);
min_a = a(min_index);

figure(1);
plot(a, total_delay, 'r', 'linewidth', 2);
title('Average Delay Time - Probability a')
xlabel('Probability a');
ylabel('Average Delay Time');
grid on;

disp(['Minimum value of a: ', num2str(min_a)]);
disp(['Minimum total delay: ', num2str(min_delay)]);
