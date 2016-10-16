function xf=featureU(x)



xf=zeros(1,11);

u=feature_x(x);
v=feature_logx(x);
xf(1:6)=feature_c(u,v);
xf(7)=abs_integral(x);
xf(8)=waveformlength(x);
xf(9)=zerocrossing(x);
xf(10)=slopesignchange(x);
xf(11)=calc_kurtosis(x);