%script to print all the channels with labels

load data1
odd=1:2:47;
even=2:2:48;
% figure
% title('trigger')
% plot(data.time(2:end),abs(diff(data.values(:,49))));
[pval,ploc]=findpeaks(abs(diff(data.values(:,49))),data.Fs,'MinPeakProminence',0.005);

HbR=figure;
subplot(1,2,1);
title('HbR left');
hold on;
plot(data.time, data.values(:,even(1:12)));
vline(ploc);
l=legend(data.labels{even(1:12)});
l.Location='southoutside';
subplot(1,2,2);
title('HbR right');
hold on;
plot(data.time, data.values(:,even(13:24)));
vline(ploc);
l=legend(data.labels{even(13:24)});
l.Location='southoutside';


HbO=figure;
subplot(1,2,1);
title('HbO left');
hold on;
plot(data.time, data.values(:,odd(1:12)));
vline(ploc);
l=legend(data.labels{odd(1:12)});
l.Location='southoutside';
subplot(1,2,2);
title('HbO right');
hold on;
plot(data.time, data.values(:,odd(13:24)));
vline(ploc);
l=legend(data.labels{odd(13:24)});
l.Location='southoutside';


