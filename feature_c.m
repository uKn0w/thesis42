function feature_ret=feature_c(A,B)

feature_ret=zeros(1,6);
for i=1:6
    feature_ret(i)=-2*A(i)*B(i)/(A(i)*A(i)+B(i)*B(i));
end