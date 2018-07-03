%print each channel values over the interpolated surface with overlayed semitransparent mask
function plot_grids_motor(channels) 
load mapChannels
al=0.4;

%% create interpolated channels grids
chL=channels(1:14);

c=chL;
grL= [c(1) c(1)       c(2)      c(3)      c(4)      c(5)    c(6)   c(7)  c(7)   
    c(1) c(1)       c(2)      c(3)      c(4)      c(5)    c(6)   c(7)  c(7) 
      c(1) c(1)       c(2)      c(3)      c(4)      c(5)    c(6)   c(7)  c(7)
      c(1) c(1)       c(2)      c(3)      c(4)      c(5)    c(6)   c(7)  c(7)
      c(8) c(8)       c(9)      c(10)     c(11)     c(12)   c(13)  c(14) c(14)
      c(8) c(8)       c(9)      c(10)     c(11)     c(12)   c(13)  c(14) c(14)
      c(8) c(8)       c(9)      c(10)     c(11)     c(12)   c(13)  c(14) c(14)
      c(8) c(8)       c(9)      c(10)     c(11)     c(12)   c(13)  c(14) c(14)
      c(8) c(8)       c(9)      c(10)     c(11)     c(12)   c(13)  c(14) c(14)];

    
[X,Y] = meshgrid(0:8);
[Xq,Yq] = meshgrid(0:0.05:8);
VqL = interp2(X,Y,grL,Xq,Yq);

%% create mask
m=ones(size(VqL,1));
xm=[ 2 2 2 2 2 2 2 6 6 6 6 6 6 6];
ym=[ 1 2 3 4 5 6 7 1 2 3 4 5 6 7];
mv=0.35;
for i=1:14
    m((xm(i)-mv)/0.05:(xm(i)+mv)/0.05,(ym(i)-mv)/0.05:(ym(i)+mv)/0.05)=0;
end
for i=1:14
    VqL((xm(i)-mv)/0.05:(xm(i)+mv)/0.05,(ym(i)-mv)/0.05:(ym(i)+mv)/0.05)=chL(i);

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
plot( [1.5 3.5 5.5 7.5 1.5 3.5 5.5 7.5]/0.05,[1 1 1 1 7 7 7 7]/0.05,'or','markersize',4,'markerfacecolor','r')
plot( [1.5 3.5 5.5 7.5 ]/0.05,[4 4 4 4 ]/0.05,'xk','markersize',8)


cb=colorbar;
cb.Position=[0.5 0.09 0.02 0.8 ];