clc;
load('Modified_Jan291232.mat')
[pks,locs] = findpeaks(enc1);
y_n_val = pks(4);
y_n_loc = locs(4);
for i = 1:length(enc1)
    if enc1(i) == 980
        ct = i;
        break
    end

end
figure(1)
hold on;
plot(enc1)
plot(y_n_loc,y_n_val,'ro')
plot(ct,enc1(ct),'bo')
