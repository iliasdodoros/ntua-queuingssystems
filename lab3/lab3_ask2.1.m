# Task 2 (lamda= 1)

clc;
clear all;
close all;

rand("seed",1);

P = [0,0,0,0,0,0,0,0,0,0,0];
arrivals = [0,0,0,0,0,0,0,0,0,0,0];
total_arrivals = 0; 
current_state = 0;  
previous_mean_clients = 0; 
index = 0;

lamda = 1; 
mu = 5;
threshold = lamda/(lamda + mu); 

transitions = 0; 

while transitions >= 0
  transitions = transitions + 1; 
  
  if mod(transitions,1000) == 0 
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; 
    endfor
    
    mean_clients = 0; 
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  random_number = rand(1); 
  if current_state == 0 || random_number < threshold 
    if current_state < 11
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
      if current_state < 10
        current_state = current_state + 1;
      endif    
    endif   
  else 
    if current_state != 0 
      current_state = current_state - 1;
    endif
  endif
endwhile


figure(1);
plot(to_plot,"g","linewidth",1.3);
title("Average number of clients in the M/M/1 queue: Convergence, lamda=1");
xlabel("transitions in thousands");
ylabel("Average number of clients");

x=[0,1,2,3,4,5,6,7,8,9,10];
figure(2);
bar(x,P,0.4);
title("Probabilities, lamda=1");
display(transitions);
