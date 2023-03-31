clc;
clear all;
close all;

pkg load queueing; 


# Task 2.1
lamda = 5;
mu = 10;
states = [0, 1, 2, 3, 4];
initial_state = [1, 0, 0, 0, 0];
births_B = [lamda, lamda/2, lamda/3, lamda/4];
deaths_D = [mu, mu, mu, mu];

transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);

# Task 2.2
P = ctmc(transition_matrix);
for i=1:5
 display(P(i));
endfor
figure(1);
bar(states, P, "m", 0.5);
title("M/M/1/4");
xlabel("Balance states");
ylabel("Balance propabilities");

# Task 2.3
mean_clients = 0;
for i = 1 : 1 : 5
  mean_clients = mean_clients + P(i)*(i-1);
endfor
display(mean_clients);

# Task 2.4
display("Blocking probability = ");
display(P(5));

# Task 2.5
for j = 1:1:5
  index = 0;
  for T = 0 : 0.01 : 50
    index = index + 1;
    P0 = ctmc(transition_matrix, T, initial_state);
    Prob0(index) = P0(j);
    if P0 - P < 0.01
      break;
    endif
  endfor
  
  t = 0 : 0.01 : T;
  figure(j+1);
  plot(t, Prob0, "r", "linewidth", 1.2);
  xlabel("time");
  ylabel("Balance propability");
endfor