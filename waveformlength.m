function tempsum=waveformlength(samp_sig)

n=length(samp_sig);
x_sig=samp_sig;

for i=1:n
    if i==1
        temp(i)=x_sig(i+1)-x_sig(i);
    elseif i==n
        temp(i)=x_sig(i)-x_sig(i-1);
    else
        temp(i)=x_sig(i+1)-x_sig(i-1);
        temp(i)=temp(i)/2;
    end
end

tempsum=0;
for i=1:n
    tempsum=tempsum+abs(temp(i));
end