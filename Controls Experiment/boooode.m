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

% Step response of the closed-loop system
%figure;
%step(T);
%title('Closed-Loop Step Response with PID Controller');
%grid on;
stepinfo(T)
%{
 
% Performance Analysis
info = stepinfo(T);
fprintf('Settling Time: %.4f sec\n', info.SettlingTime);
fprintf('Overshoot: %.2f%%\n', info.Overshoot);

% Control effort analysis (Check saturation limit)
t = 0:0.0001:0.05;  % Simulation time
[y, t, u] = lsim(C * (1 - T), ones(size(t)), t);  % Control signal

figure;
plot(t, u);
title('Control Effort');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;
hold on;
yline(5, 'r--', 'Saturation Limit (+5V)');
yline(-5, 'r--', 'Saturation Limit (-5V)');
hold off;

% Check if control effort exceeds ±5V
if max(abs(u)) > 5
    disp('Warning: Control effort exceeds saturation limit (±5V). Consider retuning the PID gains.');
end 
%}

