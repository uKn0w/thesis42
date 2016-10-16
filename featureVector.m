function fv=featureVector(trial)


featureSize=88;
fv=zeros(1,featureSize);
for i=1:8
    x=trial(:,i);
    x=x(:);
    fv((i-1)*11+1:(i-1)*11+11)=featureU(x);
end