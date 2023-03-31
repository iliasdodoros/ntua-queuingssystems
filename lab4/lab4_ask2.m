# Exercise 2

clc;
clear all;
close all;
pkg load queueing;

lamda = 1;
m1 = 0.8;
m2 = 0.4;

threshold_0 = lamda/1;
threshold_1a = lamda/(lamda+m1);
threshold_1b = lamda/(lamda+m2);
threshold_2_first = lamda/(lamda+m2+m1);
threshold_2_second = (m1+lamda)/(lamda+m2+m1);

current_state = 0; 
arrivals = zeros(1,4); 
total_arrivals = 0; 
maximum_state_capacity = 2; 
previous_mean_delay = 0; 
delay_counter = 0;
time = 0;

while 1 > 0
  time = time + 1;
  
  if mod(time,1000) == 0
    for i=1:1:4
      P(i) = arrivals(i)/total_arrivals;
    endfor
    
    delay_counter = delay_counter + 1;

    mean_delay = 0*P(1) + 1*P(2) + 1*P(3) + 2*P(4);   
    
    delay_table(delay_counter) = mean_delay;
    
    if abs(mean_delay - previous_mean_delay) < 0.00001
       break;
    endif
    previous_mean_delay = mean_delay;
  endif
  
  random_number = rand(1);
  
  if current_state == 0
    if random_number < threshold_0
      current_state = 1;
      arrivals(1) = arrivals(1) + 1;
      total_arrivals = total_arrivals + 1;
    endif
  elseif current_state == 1
    if random_number < threshold_1a
      current_state = 3;
      arrivals(2) = arrivals(2) + 1;
      total_arrivals = total_arrivals + 1;
    else
      current_state = 0;
    endif
  elseif current_state == 2
    if random_number < threshold_1b
      current_state = 3;
      arrivals(3) = arrivals(3) + 1;
      total_arrivals = total_arrivals + 1;
    else
      current_state = 0;
    endif
  else
      if random_number < threshold_2_first
        arrivals(4) = arrivals(4) + 1;
        total_arrivals = total_arrivals + 1;
      elseif random_number < threshold_2_second
        current_state = 2;
      else
        current_state = 1;
      endif
   endif
  
endwhile

display(P(1));
display(P(2));
display(P(3));
display(P(4));