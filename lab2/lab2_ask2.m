clc;
close all;
clear all;

pkg load queueing;

lamda = 5;
mu = 5.0001 : 0.0001 : 10;

[U, R, Q, X, p0] = qsmm1 (lamda, mu);
# Task 1
figure(1);
hold on;
plot(mu,U,"r","linewidth",1.2);
hold off;
title("Server Utilization and Service Rate Diagram");
xlabel("\\mu");
ylabel("Utilization");

# Task 2
figure(2);
hold on;
plot(mu,R,"r","linewidth",1.2);
axis([5 10 0 100]);
hold off;
title("Server Respose Time and Service Rate Diagram");
xlabel("\\mu");
ylabel("Response Time");

# Task 3
figure(3);
plot(mu,Q,"r","linewidth",1.2);
axis([5 10 0 100]);
title("Average number of requests and Service Rate Diagram");
xlabel("\\mu");
ylabel("Average number of requests in the system");

# Task 4
figure(4);
plot(mu,X,"r","linewidth",1.2);
title("Server throughput and Service Rate Diagram");
xlabel("\\mu");
ylabel("Throughput");