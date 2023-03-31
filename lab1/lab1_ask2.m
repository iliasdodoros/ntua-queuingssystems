clc;
clear all;
close all;

pkg load statistics;

# Task 1

k = 0:0.0001:8;
lamda = [0.5,1,3];

for i=1:columns(lamda)
  exp(i,:) = exppdf(k,lamda(i));
endfor

colors="rgk";
figure(1);
hold on;
for i=1:columns(lamda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Density Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lamda=0.5","lamda=1","lamda=3");

# Task 2

k = 0:0.0001:8;
lamda = [0.5,1,3];

for i=1:columns(lamda)
  exp(i,:) = expcdf(k,lamda(i));
endfor

colors="rgk";
figure(2);
hold on;
for i=1:columns(lamda)
  plot(k,exp(i,:),colors(i),"linewidth",1.2);
endfor

hold off;

title("Probability Cumulative Function of Exponential distribution");
xlabel("k values");
ylabel("probability");
legend("lamda=0.5","lamda=1","lamda=3");

# Task 3

k = 0:0.00001:8;


exp = expcdf (k,2.5);
p1=1 - exp(30000);
# P(X>30000)= 
display(p1);
p2=(1-exp(50000))./(1-exp(20000));
# P(X>50000|X>20000)= 
display(p2);