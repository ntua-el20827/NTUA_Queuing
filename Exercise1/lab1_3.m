clc;
clear all;
close all;
pkg load statistics;

#Ερώτημα Α
#Counting Process Poisson
lambda = 0.2 #λ=5
r= exprnd(lambda,1,100);
#r = exprnd(mu,sz1,...,szN) generates an arrax of random numbers from the 
#erponential distribution, where sz1,...,szN indicates the size of each dimension.
x = ones(100,1);
for i=1:99
  r(i+1)=r(i+1)+r(i);
  x(i+1)=x(i+1)+x(i);
endfor

figure(1);
stairs(r,x,color = 'r');
title("Counting Process Poisson with λ = 5 events/sec");
xlabel("Seconds");
ylabel("N(t)");

#Ερώτημα Β
#Μεσος Αριθμός Γεγονότων
#i - 200
lambda = 0.2; #λ=5
r = exprnd(lambda,1,200);
x = ones(200,1);
for i=1:199
  r(i+1) = r(i+1) + r(i);
  x(i+1) = x(i+1) + x(i);
endfor
figure(2);
stairs(r,x, color = 'r');
title("Counting Process Poisson with λ = 5 events/s for 200 events");
xlabel("Seconds");
ylabel("N(t)");
display("For 200 events mean = ");
display(200/r(200));

#ii - 300
lambda = 0.2; #λ=5
r = exprnd(lambda,1,300);
x = ones(300,1);
for i=1:299
  r(i+1) = r(i+1) + r(i);
  x(i+1) = x(i+1) + x(i);
endfor
figure(3);
stairs(r,x, color = 'r');
title("Counting Process Poisson with λ = 5 events/s for 300 events");
xlabel("Seconds");
ylabel("N(t)");
display("For 300 events mean = ");
display(300/r(300));

#iii - 500
lambda = 0.2; #λ=5
r = exprnd(lambda,1,500);
x = ones(500,1);
for i=1:499
  r(i+1) = r(i+1) + r(i);
  x(i+1) = x(i+1) + x(i);
endfor
figure(4);
stairs(r,x, color = 'r');
title("Counting Process Poisson with λ = 5 events/s for 500 events");
xlabel("Seconds");
ylabel("N(t)");
display("For 500 events mean = ");
display(500/r(500));

#iv - 1000
lambda = 0.2; #λ=5
r = exprnd(lambda,1,1000);
x = ones(1000,1);
for i=1:999
  r(i+1) = r(i+1) + r(i);
  x(i+1) = x(i+1) + x(i);
endfor
figure(5);
stairs(r,x, color = 'r');
title("Counting Process Poisson with λ = 5 events/s for 1000 events");
xlabel("Seconds");
ylabel("N(t)");
display("For 1000 events mean = ");
display(1000/r(1000));

#v - 10000
lambda = 0.2; #λ=5
r = exprnd(lambda,1,10000);
x = ones(10000,1);
for i=1:9999
  r(i+1) = r(i+1) + r(i);
  x(i+1) = x(i+1) + x(i);
endfor
figure(6);
stairs(r,x, color = 'r');
title("Counting Process Poisson with λ = 5 events/s for 10000 events");
xlabel("Seconds");
ylabel("N(t)");
display("For 10000 events mean = ");
display(10000/r(10000));