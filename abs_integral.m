function ret=abs_integral(samp_sig)

%n=length(samp_sig);
x_sig=abs(samp_sig);
ret=trapz(x_sig);
