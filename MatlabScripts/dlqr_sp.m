function [K,G]=dlqr_sp(A_d,B_d,C,Q,R,H)
    S_i=H;
    K_i=[1,1];
    N=0;
    buffSize = 20;
    circBuff = zeros(1,buffSize);
    while abs(sum(K_i*(buffSize/2))-sum(circBuff))>10^-7
        N=N+10;
        for i=N-1:-1:0
            S_i=A_d'*(S_i-S_i*B_d*1/(B_d'*S_i*B_d+R)*B_d'*S_i)*A_d+Q;
            circBuff = [circBuff(3:end),K_i];
            K_i=(1/(R))*B_d'/(A_d')*(S_i-Q);
        end
    end
    K=K_i;
    G=1/(C/(eye(2)-A_d+B_d*K)*B_d);%G=1/(C/(B_d*K-A_d)*B_d)
end