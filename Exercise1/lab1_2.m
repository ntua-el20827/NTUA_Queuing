clc;
clear all;
close all;
pkg load statistics;

#Ερώτημα Α
k = 0:0.00001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  expo(i,:) = exppdf(k,lambda(i));
endfor

colors="rbg";
figure(1);
hold on;
for i=1:columns(lambda)
  plot(k,expo(i,:),colors(i),"linewidth",1.2);  #χρησιμοποιώ plot και οχι stem
endfor

hold off;

title("Probability Density Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");


#Ερώτημα Β
#Αθροιστική συνάρτηση κατανομής
k = 0:0.00001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  expo(i,:) = expcdf(k,lambda(i));
endfor

colors="rbg";
figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,expo(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Cumulative Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lambda=0.5","lambda=1","lambda=3");

#Ερώτημα Γ
#Ιδιότητα Απώλειας Μνήμης
k = 0:0.00001:8;
expo = expcdf (k,2.5);
#Υπολογισμός της P(X>30000) = 1 - F(30000)
p1 = 1-expo(30000);
display(p1);
#Υπολογισμός της P(X>50000|X>20000) = [1- F(50000)]/[1-F(20000)]
p2 = (1-expo(50000))./(1-expo(20000));
display(p2);
