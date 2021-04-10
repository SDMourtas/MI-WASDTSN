function Q=Qmatrix(X,M,v)
% function for calculating the matrix Q

K=length(X)-M;
Q=zeros(K,M*length(v));
for i=1:K
    r=exp(reshape(X(i:i+M-1).^v,1,[])); 
    Q(i,:)=r./(r+1); % Type: power sigmoid
end