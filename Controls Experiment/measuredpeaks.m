clc;
load('Modified_Jan291232.mat')
for i = 1:length(enc1)
    if enc1(i) == 980
        ct = i;
        break
    end

end
disp(ct)
figure(1)
hold on;
plot(enc1)
plot(ct,enc1(ct),'bo')
