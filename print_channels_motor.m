%script to print all the channels with labels

odd=1:2:27;
even=2:2:28;
% figure
% title('trigger')
% plot(data.time(2:end),abs(diff(data.values(:,49))));
[pval,ploc]=findpeaks(abs(diff(data.values(:,29))),data.Fs,'MinPeakProminence',0.005);
for i=1:length(ploc)/2
    plocB(i)=ploc(2*i);
end
ploc=plocB;
HbR=figure;
subplot(1,2,1);
title('HbR UP');
hold on;
plot(data.time, data.values(:,even(1:7)));
vline(ploc);
l=legend(data.labels{even(1:7)});
l.Location='southoutside';
subplot(1,2,2);
title('HbR DOWN');
hold on;
plot(data.time, data.values(:,even(8:14)));
vline(ploc);
l=legend(data.labels{even(8:14)});
l.Location='southoutside';


HbO=figure;
subplot(1,2,1);
title('HbO UP');
hold on;
plot(data.time, data.values(:,odd(1:7)));
vline(ploc);
l=legend(data.labels{odd(1:7)});
l.Location='southoutside';
subplot(1,2,2);
title('HbO DOWN');
hold on;
plot(data.time, data.values(:,odd(8:14)));
vline(ploc);
l=legend(data.labels{odd(8:14)});
l.Location='southoutside';

filter_channels

%% plot average

ploc=[ploc(1:6) 537 ploc(7:end)];

for i=1:length(ploc)/2
    plocC(i)=ploc(2*i);
end
ploc=plocC;
d=diff(ploc);

timem=[0: 1/data.Fs :16.1];
val=zeros(data.Fs*16+1,29);
for i=1:30
    val(:,:)=val + data.values(ploc(i)*data.Fs:(ploc(i)+16)*data.Fs, :);
end

val1=zeros(data.Fs*16+1,1);
for i=1:30
 val1=val1 + filtered_data(round(ploc(i)*data.Fs):round((ploc(i)+16)*data.Fs));
end

HbRm=figure;
subplot(1,2,1);
title('HbR UP mean');
hold on;
plot(timem(1:801),val(:,even(1:7)));
l=legend(data.labels{even(1:7)});
l.Location='southoutside';
subplot(1,2,2);
title('HbR DOWN');
hold on;
plot(timem(1:801), val(:,even(8:14)));
l=legend(data.labels{even(8:14)});
l.Location='southoutside';


HbOm=figure;
subplot(1,2,1);
title('HbO UP');
hold on;
plot(timem(1:801), val(:,odd(1:7)));
l=legend(data.labels{odd(1:7)});
l.Location='southoutside';
subplot(1,2,2);
title('HbO DOWN');
hold on;
plot(timem(1:801), val(:,odd(8:14)));
l=legend(data.labels{odd(8:14)});
l.Location='southoutside';
plot(timem(1:801), val1);


Hb=figure;
title('HbR - HbO mean');
hold on;
plot(timem(1:801),mean(val(:,even(1:14)),2),'b');
plot(timem(1:801), mean(val(:,odd(1:14)),2),'r');
legend({'HbR','HbO'})
