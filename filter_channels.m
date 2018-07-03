%script to filter the channels

t=data.time;
d=data.values(:,1);
y=fft(d);
[Y, f] = Fourier(d, 50);

y(1:29)=0;
y(762:23770)=0;

y(23770:end-762)=0;
y(end-29:end)=0;

filtered_data=ifft(y);
figure; 
plot(data.time, abs(filtered_data)-mean(abs(filtered_data)))
hold on
plot(data.time, data.values(:,1)-mean(data.values(:,1)))
vline(ploc)