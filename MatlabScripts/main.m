clear all

lambda=0.192; 
b=5.85; 
d=0.00873; 
e=0.66;
r=1;
params_constant_u = {lambda,b,d,e};
disp('Response of tumor volume and supporting vasculature volume without and under inhibitor doses of various constant levels')
state_0_constant_u =[1; 1];
tspan_constant_u = [0:0.1:100];
disp('Case constant u=0')
plot_constant_inhibitor(0,params_constant_u,tspan_constant_u,state_0_constant_u,[0,18000])
disp('press any key to continue')
pause
disp('Case constant u=1')
plot_constant_inhibitor(1,params_constant_u,tspan_constant_u,state_0_constant_u,[0,18000])
pause
disp('Case constant u=20')
plot_constant_inhibitor(20,params_constant_u,tspan_constant_u,state_0_constant_u,[0,1])
pause
disp('Case constant u=50')
plot_constant_inhibitor(50,params_constant_u,tspan_constant_u,state_0_constant_u,[0,1])
pause
%Feedback linearized model in z coordinates:
A = [0 1; 0 0];
B = [0; 1];
C = [1 0];
D = 0;
%Optimal discrete state-feedback design
discrete_time_system = c2d(ss(A,B,C,D),0.1)
A_d=discrete_time_system.A;
B_d=discrete_time_system.B;
C_d=discrete_time_system.C;
Q=[1,0;0,0];
H=[1,0;0,0];
r=1;
state_0 =[2000; 8000];
tspan = [0:0.1:50];
lambda=0.192; b=5.85; d=0.00873; e=0.66;
disp('Discrete LQR')
disp('Case R=1')
[states,u,t,total_inhibitor_dose,days_to_1perc]=tumor_growth_simulation(A_d,B_d,C_d,Q,1,H,lambda,b,d,e,r,tspan,state_0,true,true);
pause
disp('Case R=10')
[states,u,t,total_inhibitor_dose,days_to_1perc]=tumor_growth_simulation(A_d,B_d,C_d,Q,10,H,lambda,b,d,e,r,tspan,state_0,true,true);
pause
disp('Case R=100')
[states,u,t,total_inhibitor_dose,days_to_1perc]=tumor_growth_simulation(A_d,B_d,C_d,Q,100,H,lambda,b,d,e,r,tspan,state_0,true,true);
pause
disp('Case R=1000')
[states,u,t,total_inhibitor_dose,days_to_1perc]=tumor_growth_simulation(A_d,B_d,C_d,Q,1000,H,lambda,b,d,e,r,tspan,state_0,true,true);
pause
disp('Total inhibitor doses and days to reach 1% of initial volume for values of R ranging from 1 to 100')
R_list=[2:99];%[1,10:10:100];
total_inhibitor_doses=zeros(size(R_list));

time_lenghts=zeros(size(R_list));
for i=1:size(R_list,2)
    [states,u,t,total_inhibitor_dose,days_to_1perc]=tumor_growth_simulation(A_d,B_d,C_d,Q,R_list(i),H,lambda,b,d,e,r,tspan,state_0,false,false);
    total_inhibitor_doses(i)=total_inhibitor_dose;
    days_to_1perc_list(i)=days_to_1perc;
end

[min_tid, idx_min_tid]=min(total_inhibitor_doses);
disp(['The minimum total inhibitor dose is ',num2str(min_tid),' for a choice of R=',num2str(R_list(idx_min_tid))])
plot_total_inhibitor_doses(total_inhibitor_doses,R_list,days_to_1perc_list)