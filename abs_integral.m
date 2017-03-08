function ret=abs_integral(samp_sig)

%n=length(samp_sig);
%x_sig=abs(samp_sig);
x_sig=abs(x_sig);
ret=trapz(x_sig);
%this is just comment on Mar 8
