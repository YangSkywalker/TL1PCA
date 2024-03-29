clear all; clc
% set parameter
p=0.5;
a=1;

x = -5:0.1:5;
y2 = (abs(x)).^2;
y1 = (abs(x));
y_p = (abs(x)).^(p);
y_TL1 = ((a+1).*abs(x))./(a+abs(x));

figure(3)
plot(x,y2,'r:','linewidth',2); hold on
plot(x,y1,'m-.','linewidth',2); hold on
plot(x,y_p,'c--','linewidth',2); hold on
plot(x,y_TL1,'b-','linewidth',2); 
plot([-5,5],[2,2],'b--','linewidth',2); hold on

set(gcf,'color','white'); %���ڱ�����ɫ
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %���ڱ�����ɫ
set(gca,'looseInset',[0 0 0 0.01]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;


set(gca,'ytick','','xtick','');
set(gca,'xtick',0);
set(gca,'XTicklabel',{'Origin'})




ylim([0,5])
text(-1.5,1.93,'asymptote y=a+1','FontSize', 12)
legend({'\mu_2(t)','\mu_1(t)','\mu_{p}(t)','\rho_a(t)'},'Fontname', 'Times New Roman','FontSize',12,'location','best')

