function E=error_pred(X,Y)

R=X-Y;

E=100/length(R)*sum(abs(R)./abs(Y)); % MAPE
%E=100/length(R)*sum(abs(R)./((abs(X)+abs(Y))./2)); % SMAPE
fprintf('The test data MAPE is: %f %%\n',E)