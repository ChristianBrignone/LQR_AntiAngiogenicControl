
function plot_constant_inhibitor(constant_u,params_constant_u,tspan_constant_u,state_0_constant_u,y_lim)
    
    [t_constant_u,states_constant_u]=ode45(@(t_constant_u,state_constant_u)tumorModel_constant_u(t_constant_u,state_constant_u,params_constant_u,constant_u),tspan_constant_u,state_0_constant_u);
    figure
    plot(t_constant_u,real(states_constant_u),'LineWidth',1)
    xlabel('Time (day)')
    ylabel('Volume (mm³)')
    legend({'Tumor volume','Supporting vasculature volume'},'Location','southeast')
    grid on
    title(['Volume of Tumor and Vasculature (u=',num2str(constant_u),')'])
    ylim(y_lim)
end