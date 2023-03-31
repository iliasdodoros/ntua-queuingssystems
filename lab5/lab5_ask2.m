# Exercise 2

# Task 2

clc;
clear all;
close all;
pkg load queueing


function [r1, r2, r3, r4, r5, e] = intesities(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5)
  r1 = (lamda1/mu1);
  r2 = ((lamda2+(2/7)*lamda1)/mu2);
  r3 = ((4/7)*lamda1/mu3);
  r4 = ((3/7)*lamda1/mu4);
  r5 = (((4/7)*lamda1+lamda2)/mu5);
  if((r1<1) && (r2<1) && (r3<1) && (r4<1) && (r5<1))
    e = 1;
  else 
    e = 0;
  endif
  display("r1=")
  disp(r1)
  display("r2=")
  disp(r2)
  display("r3=")
  disp(r3)
  display("r4=")
  disp(r4)
  display("r5=")
  disp(r5)
endfunction

# Task 3

function [r1, r2, r3, r4, r5, e] = intesities_no_display(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5)
  r1 = (lamda1/mu1);
  r2 = ((lamda2+(2/7)*lamda1)/mu2);
  r3 = ((4/7)*lamda1/mu3);
  r4 = ((3/7)*lamda1/mu4);
  r5 = (((4/7)*lamda1+lamda2)/mu5);
  if((r1<1) && (r2<1) && (r3<1) && (r4<1) && (r5<1))
    e = 1;
  else 
    e = 0;
  endif
endfunction


function [Q1, Q2, Q3, Q4, Q5] = mean_clients(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5)
  [r1, r2, r3, r4, r5, e] = intesities_no_display(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5);
  Q1 = r1/(1-r1);
  Q2 = r2/(1-r2);
  Q3 = r3/(1-r3);
  Q4 = r4/(1-r4);
  Q5 = r5/(1-r5);
endfunction

# Task 4

lamda1 = 4;
lamda2 = 1;
mu1 = 6;
mu2 = 5;
mu3 = 8;
mu4 = 7;
mu5 = 6;
[r1,r2,r3,r4,r5,e]=intesities(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5);


[Q1, Q2, Q3, Q4, Q5] = mean_clients(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5);
display("E(T)=")
disp((Q1+Q2+Q3+Q4+Q5)/(lamda1+lamda2))

# Task 6

maxlamda1 = 6;
for i = 1:1:90;
  lamda1 = (0.1*maxlamda1)+(i-1)*0.01*maxlamda1;
  [Q1, Q2, Q3, Q4, Q5] = mean_clients(lamda1, lamda2, mu1, mu2, mu3, mu4, mu5);
  E(i)= (Q1+Q2+Q3+Q4+Q5)/(lamda1+lamda2);
endfor

lamda1 = (0.1*maxlamda1):(0.01*maxlamda1):(0.99*maxlamda1);
figure(2);
plot(lamda1, E,"r","linewidth",2);
xlabel("lamda1");
ylabel("E(T)");