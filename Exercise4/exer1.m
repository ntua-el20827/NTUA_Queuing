clc;
clear all;
close all;
pkg load queueing;

#Ερώτημα 1
function p = erlangb_factorial (r,c)
  s = 0;
  for k = 0:1:c
    s = s + (power(r,k)/factorial(k));
  endfor
  p = (power(r,c)/factorial(c))/s;
endfunction

#Ερώτημα 2
function p = erlangb_iterative (r,c)
  p = 1;
  for i=0:1:c
    p = ((r*p)/((r*p)+i));
  endfor
endfunction

#Ερώτημα 4
Pblocking = zeros(0,200);

for i = 1:1:200
  Pblocking(i) = erlangb_iterative (i*(23/60),i);
endfor

figure(1);
stem(Pblocking,'b',"linewidth",0.4);
title("Blocking Probabilities - Telephone Lines")
xlabel("Telephone Lines");
ylabel("Blocking Probability");
