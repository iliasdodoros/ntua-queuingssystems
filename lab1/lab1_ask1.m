clc;
clear all;
close all;


pkg load statistics;
#Task 1

k= 0:1:70
lamda= [3,10,30,50];

for i=1:columns(lamda)
  poisson(i,:)= poisspdf(k,lamda(i));
endfor

colors= "rbkm";
figure(1);
hold on;
for i= 1:columns(lamda)
  stem(k,poisson(i,:),colors(i), "linewidth",1.2);
endfor
hold off;

title ('Propability Mass Function of Poisson processes');
xlabel('k values');
ylabel('probability');
legend('lamda=3','lamda=10','lamda=30','lamda=50');

# Task 2

index= find(lamda==30);
chosen =poisson(index,:);
mean_value=0;
for i=0:(columns(poisson(index,:))-1);
  mean_value = mean_value + i.*poisson(index,i+1);
endfor

display("Mean value of Poisson with lamda 30 is");
display(mean_value);

second_moment =0;
for i=0:(columns(poisson(index,:))-1)
  second_moment = second_moment + i.*i.*poisson(index,i+1);
endfor

variance = second_moment - mean_value.^2;
display("Variance of Poisson with lamda 30 is");
display(variance);

# Task 3

first = find(lamda==10);
second = find(lamda==50);
poisson_first = poisson(first,:);
poisson_second = poisson(second,:);

composed = conv(poisson_first,poisson_second);
new_k = 0:1:(2*70);

figure(2);
hold on;
stem(k,poisson_first(:),colors(1),"linewidth",1.2);
stem(k,poisson_second(:),colors(2),"linewidth",1.2);
stem(new_k,composed,"mo","linewidth",2);
hold off;
title("Convolution of two Poisson processes");
xlabel("k values");
ylabel("Probability");
legend("lamda=10","lamda=50","new process");

# Task 4

k = 0:1:200;
lamda = 30;
i = 1:1:5;
n = lamda.*i; 
p = lamda./n;

figure(3);
title("Poisson process as the limit of the binomial process");
xlabel("k values");
ylabel("Probability");
hold on;
for i=1:4
  binomial = binopdf(k,n(i),p(i));
  stem(k,binomial,colors(i),'linewidth',1.2);
endfor
hold off;