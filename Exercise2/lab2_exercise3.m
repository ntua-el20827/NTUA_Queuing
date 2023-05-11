% system M/M/1/4
% when there are 3 clients in the system, the capability of the server doubles.

clc;
clear all;
close all;
pkg load queueing;
#Ερώτημα Β
#Β.i
lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D)
#https://octave.sourceforge.io/queueing/function/ctmcbd.html

#Β.ii
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
#https://octave.sourceforge.io/queueing/function/ctmc.html
#Compute stationary or transient state occupancy probabilities for a 
# continuous-time Markov chain.
printf("Probabilities: \n")
for i=1:5
 display(P(i));
endfor
% plot the ergodic probabilities (bar for bar chart)
figure(1);
bar(states, P, "r", 0.5); 
title("Ergodic probabilities for M/M/1/4");
xlabel("States");
ylabel("Probabilities");


#Β.iii
mo_of_clients = 0;
for i = 1 : 1 : 5
  mo_of_clients = mo_of_clients + P(i)*(i-1);
endfor
display(mo_of_clients);

#Β.iv
display("P[blocking] = ");
display(P(5)); # P(4) όμως το index ξεκιναει απο 1

#Β.v
#for loop that plots 5 different diagrams
for i = 1:1:5
  index = 0; 
  #creating
  for T = 0 : 0.01 :50
    index = index + 1; # keep track of iterations
    P_i= ctmc(transition_matrix, T, initial_state);
    #vector of steady-state probabilities of the Markov chain at a particular time T
    Prob_i(index) = P_i(i);
    if P_i - P < 0.01
      break;
    endif
  endfor
  #plotting
  t = 0 : 0.01 : T; # μεχρι να τελειώσει
  figure(i+1);
  plot(t, Prob_i, "r", "linewidth", 1.3); 
  title(sprintf('Probability Diagram for state %d',i-1));
  xlabel("Time");
  ylabel("Probability");
endfor
