%print each channel values over the interpolated surface with overlayed semitransparent mask
function plot_grids(channels) 
load mapChannels
al=0.4;

%% create interpolated channels grids
chL=channels(1:12);
chR=channels(13:24);
c=chL;
grL=[mean([c(1) c(3)])  mean([c(1) c(3)])        c(1)                          mean([c(1) c(2) ])           c(2)                           mean([c(2) c(5)])    mean([c(2) c(5)]) 
    mean([c(1) c(3)])  mean([c(1) c(3)])        c(1)                          mean([c(1) c(2) ])           c(2)                           mean([c(2) c(5)])    mean([c(2) c(5)]) 
    c(3)               c(3)                     mean([c(1) c(3) c(6) c(4)])   c(4)                         mean([c(2) c(4) c(5) c(7)])    c(5)                 c(5)
    mean([c(8) c(3) ]) mean([c(8) c(3) ])       c(6)                          mean([c(4) c(6) c(9) c(7)])  c(7)                           mean([c(5)  c(10)])  mean([c(5) c(10)])
    mean([c(8) c(3) ]) c(8)                     mean([c(6) c(8) c(11) c(9)])  c(9)                         mean([c(7) c(9) c(12) c(10)])  c(10)                c(10)
    mean([c(8) c(11)]) mean([c(8) c(11)])       c(11)                         mean([c(11) c(12) ])         c(12)                          mean([c(10) c(12)])  mean([c(10) c(12)])
    mean([c(8) c(11)]) mean([c(8) c(11)])       c(11)                         mean([c(11) c(12) ])         c(12)                          mean([c(10) c(12)])  mean([c(10) c(12)])];
c=chR;
grR=[mean([c(1) c(3)])  mean([c(1) c(3)])        c(1)                          mean([c(1) c(2) ])           c(2)                           mean([c(2) c(5)])    mean([c(2) c(5)]) 
    mean([c(1) c(3)])  mean([c(1) c(3)])        c(1)                          mean([c(1) c(2) ])           c(2)                           mean([c(2) c(5)])    mean([c(2) c(5)]) 
    c(3)               c(3)                     mean([c(1) c(3) c(6) c(4)])   c(4)                         mean([c(2) c(4) c(5) c(7)])    c(5)                 c(5)
    mean([c(8) c(3) ]) mean([c(8) c(3) ])       c(6)                          mean([c(4) c(6) c(9) c(7)])  c(7)                           mean([c(5)  c(10)])  mean([c(5) c(10)])
    mean([c(8) c(3) ]) c(8)                     mean([c(6) c(8) c(11) c(9)])  c(9)                         mean([c(7) c(9) c(12) c(10)])  c(10)                c(10)
    mean([c(8) c(11)]) mean([c(8) c(11)])       c(11)                         mean([c(11) c(12) ])         c(12)                          mean([c(10) c(12)])  mean([c(10) c(12)])
    mean([c(8) c(11)]) mean([c(8) c(11)])       c(11)                         mean([c(11) c(12) ])         c(12)                          mean([c(10) c(12)])  mean([c(10) c(12)])];
[X,Y] = meshgrid(0:6);
[Xq,Yq] = meshgrid(0:0.05:6);
VqL = interp2(X,Y,grL,Xq,Yq);
VqR = interp2(X,Y,grR,Xq,Yq);
%% create mask
m=ones(size(VqL,1));
xm=[ 1 1 2 2 2 3 3 4 4 4 5 5];
ym=[ 2 4 1 3 5 2 4 1 3 5 2 4];
mv=0.35;
for i=1:12
    m((xm(i)-mv)/0.05:(xm(i)+mv)/0.05,(ym(i)-mv)/0.05:(ym(i)+mv)/0.05)=0;
end
for i=1:12
    VqL((xm(i)-mv)/0.05:(xm(i)+mv)/0.05,(ym(i)-mv)/0.05:(ym(i)+mv)/0.05)=chL(i);
    VqR((xm(i)-mv)/0.05:(xm(i)+mv)/0.05,(ym(i)-mv)/0.05:(ym(i)+mv)/0.05)=chR(i);
end
%% plots

f=figure
f.Position=[50           50        1164         556];
axL=axes;
s=imagesc(axL,VqL);
hold on 
alphamask(m, [1 1 1]*0.5, 0.4,axL);
axL.XTickLabel={};
axL.YTickLabel={};
axL.Position=[0.05    0.1    0.4    0.8];
title('Left');
hold on
plot([1 3 5 1  5]/0.05, [1 3 5 5  1]/0.05,'or','markersize',4,'markerfacecolor','r')
plot([1 3 3 5 ]/0.05, [3 1 5 3 ]/0.05,'xk','markersize',8)
xlim([10 110])
ylim([10 110])

axR=axes;
s=imagesc(axR,VqR);
hold on 
alphamask(m, [1 1 1]*0.5, 0.4,axR);
axR.XTickLabel={};
axR.YTickLabel={};
axR.Position=[0.55    0.1    0.4    0.8];
title('Right');
hold on
plot([1 3 5 1  5]/0.05, [1 3 5 5  1]/0.05,'or','markersize',4,'markerfacecolor','r')
plot([1 3 3 5 ]/0.05, [3 1 5 3 ]/0.05,'xk','markersize',8)
xlim([10 110])
ylim([10 110])

cb=colorbar;
cb.Position=[0.5 0.09 0.02 0.8 ];