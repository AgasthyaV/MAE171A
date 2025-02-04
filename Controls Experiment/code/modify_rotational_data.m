filename = input('enter file name you want to change: ');
load(filename)
starttime = find(t_received >= 5);
starttime = starttime(1);
enc1 = cart1pos(starttime:end);
enc2 = cart2pos(starttime:end);
target_v = target_value(starttime:end);
duty = duty_cycle(starttime:end);
time = t_received(starttime:end);
time = time - 5;
save(['Modified_' filename], 'enc1', 'enc2', 'target_v', 'duty', 'time', 'runParameters');
