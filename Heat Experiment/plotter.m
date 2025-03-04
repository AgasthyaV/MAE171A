
x = [5, 10, 20];
y_1 = [1.2,1.42,1.86];
y_2 = [1,1.35,1.73];
y_3 = [1.22,1.46,1.93];
% y_prev = [1.36,1.84,2.55];
% y_prev = [1,1.35,1.73];
figure()
plot(x,y_1)
hold on
grid on
plot(x,y_2)
plot(x,y_3)
scatter(x,y_1)
xlabel('Heater Power (W)')
ylabel('T_4/T_1')
title('Pin Array 1 vs 2 vs 3')
scatter(x,y_2)
scatter(x,y_3)

% plot([5,5],[y_prev(1),y(1)],'--k')
% plot([10,10],[y_prev(2),y(2)],'--k')
% plot([20,20],[y_prev(3),y(3)],'--k')

legend('Sink with Pin Array 1','Sink with Pin Array 2','Sink with Pin Array 3')