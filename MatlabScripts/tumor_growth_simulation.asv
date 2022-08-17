
function [states,u,t,total_inhibitor_dose,days]=tumor_growth_simulation(A_d,B_d,C_d,Q,R,H,lambda,b,d,e,r,tspan,state_0,plot,verbose)
    
    [K,G]=dlqr_sp(A_d,B_d,C_d,Q,R,H);
    index_time_length=tspan(end);
    first_time=true;
    params = {lambda,b,d,e,K,G,r,A_d,B_d}; 
    [t,states]=ode45(@(t,state)tumorModel(t,state,params),tspan,state_0);
    u=zeros(size(t'));
    for i=1:size(states,1)
        u(i)=control_u(states(i,1),states(i,2),params{1},params{2},params{3},params{4}, params{5},params{6},params{7},params{8},params{9});
        if states(i)<=(state_0(1)/100) && first_time
            index_time_length=i;
            first_time=false;
        end
    end
    total_inhibitor_dose=sum(u);
    days=t(index_time_length);
    if verbose
        K
        G
        total_inhibitor_dose
        days
    end
    if plot
        plot_inhibitor(t,states,u,R)
    end
end
