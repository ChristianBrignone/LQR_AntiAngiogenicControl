function u=control_u(x1,x2,lambda,b,d,e,K,G,r,A_d,B_d)
    beta = -e*lambda*x1;
    alpha = (lambda*log(x1/x2)+lambda)*lambda*x1*log(x1/x2)+lambda*(x1/x2)*(b*x1-d*(x1^(2/3))*x2);

    z1 = x1;
    z2 = -lambda*x1*log(x1/x2);
    z=[z1;z2];
    I2=eye(2);
    gamma=inv(I2+B_d*K);
    A_new=gamma*A_d;
    B_new=gamma*B_d*G;
    z_new=A_new*z+B_new*r;

    v=-K*z_new+G*r;
    u=(v-alpha)/beta;
    if u<0
        u=0;
    end
    if u>50
        u=50; %saturation
end
end