clc;
clear;
close all;

% Define the plant transfer function G(s)
num = [3.223e-08, 2.979e-08, 8.086e-06];
den = [3.6e-14, 7.974e-12, 1.166e-10, 4.817e-09, 2.438e-08, 0];
G = tf(num, den);

% Display the open-loop step response
figure;
step(G);
title('Open-Loop Step Response');
grid on;

% PID Controller Design
Kp = 0.26;  % Proportional gain (tuned experimentally)
Ki = 0.18;    % Integral gain (eliminates steady-state error)
Kd = 0.015;    % Derivative gain (reduces overshoot)

C = pid(Kp, Ki, Kd);

% Closed-loop system with PID controller
T = feedback(C * G, 1);

stepinfo(T)
