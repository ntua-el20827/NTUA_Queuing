clc;
clear all;
close all;
pkg load queueing
#Ερώτημα 2
function [r1, r2, r3, r4, r5, return_value] = intesities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  r1 = (lambda1/mu1);
  r2 = ((lambda2+(2/7)*lambda1)/mu2);
  r3 = ((4/7)*lambda1/mu3);
  r4 = ((3/7)*lambda1/mu4);
  r5 = (((4/7)*lambda1+lambda2)/mu5);
  if((r1<1) || (r2<1) || (r3<1) || (r4<1) || (r5<1))
    return_value = 1;
  else 
    return_value = 0;
  endif
endfunction

#Ερώτημα 3
function [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5)
  [r1, r2, r3, r4, r5, e] = intesities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
  Q1 = r1/(1-r1);
  Q2 = r2/(1-r2);
  Q3 = r3/(1-r3);
  Q4 = r4/(1-r4);
  Q5 = r5/(1-r5);
endfunction

#Ερώτημα 4
lambda1 = 4;
lambda2 = 1;
mu1 = 6;
mu2 = 5;
mu3 = 8;
mu4 = 7;
mu5 = 6;
[r1,r2,r3,r4,r5,e]=intesities(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
fprintf('r1 = %f\n', r1);
fprintf('r2 = %f\n', r2);
fprintf('r3 = %f\n', r3);
fprintf('r4 = %f\n', r4);
fprintf('r5 = %f\n', r5);
[Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
fprintf('Average Delay Time = %f\n', (Q1+Q2+Q3+Q4+Q5)/(lambda1+lambda2));

#Ερώτημα 6
maxlambda1 = 6;
for i = 1:1:90;
  lambda1 = (0.1*maxlambda1)+(i-1)*0.01*maxlambda1;
  [Q1, Q2, Q3, Q4, Q5] = mean_clients(lambda1, lambda2, mu1, mu2, mu3, mu4, mu5);
  delay_time(i)= (Q1+Q2+Q3+Q4+Q5)/(lambda1+lambda2);
endfor

lambda1 = (0.1*maxlambda1):(0.01*maxlambda1):(0.99*maxlambda1);
figure(1);
plot(lambda1, delay_time,"r","linewidth",2);
title("Average Delay Time - lambda1")
xlabel("lambda1");
ylabel("Average Delay Time");
