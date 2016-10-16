function RETL=slopesignchange(samp_sig)

n=length(samp_sig);
x_sig=samp_sig;

for i=2:n
    temp(i-1)=x_sig(i)-x_sig(i-1);
end

EPSi=1e-10;

ret=0;
prev=temp(1);

for i=2:n-1
    if prev*temp(i)<-EPSi
        ret=ret+1;
        RET(ret)=i+1;
    end
    if(abs(temp(i))>EPSi) 
        prev=temp(i);
    end
end

RETL=length(RET);