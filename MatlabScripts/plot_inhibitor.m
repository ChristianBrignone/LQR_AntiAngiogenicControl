function plot_inhibitor(t,states,u,R)
    figure
    tiledlayout(2,1)
    % Top plot
    ax1 = nexttile;
    plot(ax1,t,states,'LineWidth',1)
    title(ax1,['Volume of Tumor and Vasculature (R=',num2str(R),')'])
    ylabel(ax1,'Volume (mm³)')
    xlabel(ax1,'Time (day)')
    legend('Tumor volume','Supporting vasculature volume')
    grid on
    % Bottom plot
    ax2 = nexttile;
    plot(ax2,t,u,'LineWidth',1)
    title(ax2,['Dose of inhibitot (R=',num2str(R),')'])
    ylabel(ax2,'Inhibitor dose (mg/kg)')
    ylabel(ax2,'Volume (mm³)')
    xlabel(ax2,'Time (day)')
    ylim([0,60])
    grid on

end

