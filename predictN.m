function Y=predictN(X,M,W,N,x_min,x_max,Z)
% function for predicting

X_N=Normalization(X,x_min,x_max);


YY=[X_N;zeros(Z,1)];
for i=1:Z
Q=Qmatrix(YY(1:M+i),M,N');
YY(M+1:M+i)=Q*W;
end
Y_N=YY(end-Z+1:end);

Y=(Y_N+0.5)*(4*x_max-4*x_min)+x_min;