clc;
clear all;
close all;
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
rand("seed",1);

lambda = 10; 
mu = 5;
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities

transitions = 0; % holds the transitions of the simulation in transitions steps

% initialization of probabilities and arrivals for each state (11 states because max customers=10)
P = zeros(1,11);
arrivals = zeros(1,11);

while transitions >= 0 
  transitions = transitions + 1; % one more transitions step
  
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    endfor
    
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  %Εκτυπώνω τις πρώτες 30 μεταβάσεις
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    %code for arrival
    % we dont have infinite capacity
    if current_state < 11
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
      if current_state < 10
        current_state = current_state + 1;
      endif    
    endif   
    %end code for arrival
  else % departure
    %code for departure
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
    %end code for departure
  endif
endwhile
% Tranzitions
fprintf('Transitions for λ= %d  are %d\n',lambda,transitions) 

%Average Time Delay and Blocking Probability
est = lambda*(1-P(11)); %estimate of the arrival rate during congestion
average_delay_time = mean_clients / est;
fprintf('Average delay time = %d\n',average_delay_time);
fprintf('Blocking propability = %d\n',P(11));

%Average number of clients in queue
figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence / λ=10");
xlabel("transitions in thousands");
ylabel("Average number of clients");

%Probabilities for every state
display("State propabilities:");
for i=1:1:length(arrivals)
  %display(P(i));
  fprintf('state %d -> %d\n',i-1,P(i)); %Το P ξεκινάει απο 1
endfor
%Plotting probabilities for every state
x = 0:10;
figure(2);
bar(x,P,'r',0.5);
title("Probabilities / λ=10")