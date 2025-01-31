load("28-Jan-2025 14_41_43.mat")
[pks,locs] = findpeaks(cart2pos);
figure(1)
hold on;
plot(cart2pos)
i = find(pks == max(pks), 1, 'last' );
y_o_val = pks(i);
y_o_loc = locs(i);
for j = 1:length(pks)
    if j>i
        if pks(j) - pks(j-1) <10e-3
            y_inf_val = pks(j);
            y_inf_loc = locs(j);
        end
    end
end
y_n_val = pks(i+1);
y_n_loc = locs(i+1);
plot(y_o_loc,y_o_val,'bo')
plot(y_inf_loc,y_inf_val,'bo')
plot(y_n_loc,y_n_val,'bo')
S = stepinfo(cart1pos,t_received);

%U = 0.5;
n=1;
%k=U/y_inf_val;
k = 8.278e-4;

wd = 2*pi*(n/(t_received(y_n_loc) - t_received(y_o_loc)));
bwn = 1/(t_received(y_n_loc) - t_received(y_o_loc)) * log((y_o_val - y_inf_val)/abs(y_n_val - y_inf_val));
wn = sqrt(wd^2 + bwn^2);

m = k/(wn)^2;

Bcap = bwn/wn;

d = (k*2*Bcap)/wn;


d
m
%plot(t_received[locs])

%}