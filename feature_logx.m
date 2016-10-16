function rf=feature_logx(samp_sig)

n=length(samp_sig);
sq_samp_sig=samp_sig.*samp_sig;
x_sig=log(sq_samp_sig);
dft_sig=fftshift(fft(x_sig,n));
dft_sig_conj=conj(dft_sig);
P_sig=dft_sig.*dft_sig_conj;
P_sig=P_sig*(1/n);

m0bar=0;
for i=1:n
    m0bar=m0bar+x_sig(i)*x_sig(i);
end

m2bar=0;
for i=1:n
    m2bar=m2bar+i*i*P_sig(i);
end
m2bar=sqrt(m2bar);

m4bar=0;
for i=1:n
    m4bar=m4bar+i*i*i*i*P_sig(i);
end

lambda=0.1;
m0=power(m0bar,lambda)/lambda;
m2=power(m2bar,lambda)/lambda;
m4=power(m4bar,lambda)/lambda;


f1=log(m0);
f2=log(m0-m2);
f3=log(m0-m4);
f4=log(m0/(sqrt((m0-m2)*(m0-m4))));
f5=m2/sqrt(m0*m4);

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


for i=1:n
    if i==1
        t_emp(i)=temp(i+1)-temp(i);
    elseif i==n
        t_emp(i)=temp(i)-temp(i-1);
    else
        t_emp(i)=temp(i+1)-temp(i-1);
        t_emp(i)=t_emp(i)/2;
    end
end

tempsum=0;
for i=1:n
    tempsum=tempsum+abs(temp(i));
end

t_empsum=0;
for i=1:n
    t_empsum=t_empsum+abs(t_emp(i));
end

f6=tempsum/t_empsum;
f6=log(f6);

rf(1)=f1;
rf(2)=f2;
rf(3)=f3;
rf(4)=f4;
rf(5)=f5;
rf(6)=f6;



