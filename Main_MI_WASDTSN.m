%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 3-layer feed-forward neuronet model for time-series modeling   %
%  and forecasting problems, trained by a WASDTS algorithm.         %
%  (version 1.0)                                                    %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: S.D.Mourtas                               %
%                                                                   %
%   e-Mail: spirosmourtas@gmail.com                                 %
%                                                                   %
%   Main paper: S.D.Mourtas, "A Multi-Input WASD for Time-Series    %
%   Neuronet with Applications in FRED's Industrial Indices",       %
%   (submitted)                                                     %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% Choose forecasting problem (for x = 1 to 6)
x=1;
[X_train,Y_train,X_test,Y_test]=problem(x);
vmax=50;          % maximum power of hidden-layer neurons
Z=length(Y_test); % number of forecasting prices

%% Training
% Data Preprocessing: Normalization
[XY_N,X_min,X_max]=Normalization([X_train;Y_train]); 
X_N=XY_N(1:length(X_train));
Y_N=XY_N(length(X_train)+1:end);

% Neuronet model Training
tic
[W,M,V,Em,E]=WASDTS(X_N,Y_N,vmax); % optimal structure of the neuronet
toc

%% Forecasting
pred=predictN(X_test((end-M+1:end)),M,W,V,X_min,X_max,Z); % data forecasting

Et=error_pred(pred,Y_test); % Error of test data

%% Figures

figure
semilogy(1:length(E),E,'Color',[0.4940 0.1840 0.5560])
hold on
semilogy(find(E==Em),Em,'.','Color',[0.4660 0.6740 0.1880],'MarkerSize',16)
xlabel('M');ylabel('MAPE')
legend('$E$','$E_m$','Interpreter','latex')
hold off

figure
R=length(X_test);
plot(1:R+Z,[X_test;Y_test],'Color',[0.4660 0.6740 0.1880])
hold on
plot(R:R+Z,[X_test(end);pred],'Color',[0.4940 0.1840 0.5560])
xlabel('Time');ylabel('Price')
legend('Actual price','Predicted price')
hold off