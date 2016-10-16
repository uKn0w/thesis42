function ret=zerocrossing(samp_sig)

n=length(samp_sig);
x_sig=samp_sig;
EPS=1e-10;

ret=0;
prev=x_sig(1);

for i=2:n
    if prev*x_sig(i)<-EPS
        ret=ret+1;
    end
    if(abs(x_sig(i))>EPS) 
        prev=x_sig(i);
    end
    
end