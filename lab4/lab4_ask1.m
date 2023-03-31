# Exercise 1
clc;
clear all;
close all;
pkg load queueing;

% r = lamda / mu
% c: number of servers 

function p = erlangb_factorial (r,c)
  s = 0;
  for k = 0:1:c
    s = s + (power(r,k)/factorial(k));
  endfor
  p = (power(r,c)/factorial(c))/s;
endfunction


function p = erlangb_iterative (r,c)
  p = 1;
  for i=0:1:c
    p = ((r*p)/((r*p)+i));
  endfor
endfunction

display("Erlangb_factorial(9,9) =");
disp(erlangb_factorial(9,9));

display("Erlangb(9,9) =");
disp(erlangb(9,9));

display("Erlangb_iterative(9,9) =");
disp(erlangb_iterative(9,9));

display("Erlangb_factorial(1024,1024) =");
disp(erlangb_factorial(1024,1024));

display("Erlangb_iterative(1024,1024) =");
disp(erlangb_iterative(1024,1024));

P = zeros(0,200);

for i = 1:1:200
  P(i) = erlangb_iterative (i*(23/60),i)
endfor




figure(1);
stem(P,'b',"linewidth",0.4);
title("Blocking Probabilities")
xlabel("Servers");
ylabel("Blocking probability");
