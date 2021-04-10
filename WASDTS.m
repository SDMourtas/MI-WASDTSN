function [Wm,Mbest,Vbest,Em,E]=WASDTS(X,Y,vmax)
% function for finding the optimal input-layers number of the neuronet

% M: the neurons number of the input layer (i.e., the number of lagged...
% observations)
% V: the neurons powers of the hidden layers

S=round(length(X)/3); E=zeros(S,1); Em=inf;
for M=1:S
    % find the optimal hidden-layer neurons weights of the neuronet
    
    V=[]; E_Mm=inf; % Initialization
    K=length(X)-M;  % size of data fitting
    for v=0:vmax-1
        Q=Qmatrix([X;Y],M,[V;v]');
        W=pinv(Q(1:K,:))*X(M+1:end); % WDD Method
        E_M=100/M*sum(abs((Q(K+1:end,:)*W-Y)./Y)); % MAPE
        if E_M<E_Mm
            E_Mm=E_M;V=[V;v];
        end
    end
    Q=Qmatrix([X;Y],M,V');
    W=pinv(Q)*[X(M+1:end);Y]; % WDD Method
    
    E(M)=E_Mm;
    if E(M)<Em
        Em=E(M);Mbest=M;Wm=W;Vbest=V;
    end
end