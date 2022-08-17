
function plot_total_inhibitor_doses(total_inhibitor_doses,R_list,days_to_1perc_list)
    figure
 
    %xx=linspace(R_list(1),R_list(end),1000);
    %yy=interp1(R_list,total_inhibitor_doses,xx,'spline');  
    
    %days_to_1perc_list_yy=interp1(R_list,days_to_1perc_list,xx,'spline');
    plot(R_list,total_inhibitor_doses,'LineWidth',1)
    
    ylabel('Total inhibitor doses (mg/kg)')
    xlabel('Input-weighting scalar R')
    grid on
    yyaxis right
    plot(R_list,days_to_1perc_list,'LineWidth',1)
    ylabel('Days to reach 1% of initial volume')
end