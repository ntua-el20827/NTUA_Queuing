clc;
close all;
clear all;
pkg load queueing;

#Ερώτημα Β
lambda = 5; # λ=5
mu = 5.0001 : 0.0001 : 10; # Service rate / 5<μ<=10

[U, R, Q, X, p0] = qsmm1 (lambda, mu);
#https://octave.sourceforge.io/queueing/function/qsmm1.html
#Compute utilization, response time, average number of requests and 
#throughput for a M/M/1 queue.
# U = Server Utilization
# R = Server Response time
# Q = Average number of requests in the system
# X = Server throughput. If the system is ergodic (mu > lambda), 
#     we always have X = lambda
# p0 = Steady-state probability that there are no requests in the system.

#B.1
figure(1);
hold on;
plot(mu,U,"r","linewidth",1.2);
hold off;
title("Server Utilization - Service Rate");
xlabel("Service Rate");
ylabel("Server Utilization");
#B.2
figure(2);
hold on;
plot(mu,R,"r","linewidth",1.2);
axis([5 10 0 100]);
hold off;
title("Server Respose Time - Service Rate");
xlabel("Service Rate");
ylabel("Server Response Time");
#B.3
figure(3);
plot(mu,Q,"r","linewidth",1.2);
axis([5 10 0 100]);
title("Average number of requests - Service Rate");
xlabel("Service Rate");
ylabel("Average number of requests in the system");
#B.4
figure(4);
plot(mu,X,"r","linewidth",1.2);
title("Server throughput - Service Rate");
xlabel("Service Rate");
ylabel("Server throughput");
#Πάντα ίσο με λ=5 αφού λ<μ