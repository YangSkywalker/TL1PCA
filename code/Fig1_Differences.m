%% a=1,p=0.5
clear all; clc; 
x = -1.5:0.1:1.5;
p=1/2;
yp = (abs(x)).^p;    
a=1;
yTL1 = ((a+1).*abs(x))./(a+abs(x));

figure(1)

plot(x,yp,'r:','linewidth',2); hold on
plot(x,yTL1,'b-','linewidth',2); hold on

set(gcf,'color','white'); %´°¿Ú±³¾°°×É«
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %´°¿Ú±³¾°°×É«
set(gca,'looseInset',[0 0 0 0]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;

legend({'\mu_{1/2}(t)','\rho_{1}(t)'},'Fontname', 'Times New Roman','FontSize',12,'FontWeight','bold','Location','southeast')


%% a=1,p=0.5
clear all; clc; 
x = -20:0.5:20;
p=1/2;
yp = (abs(x)).^p;    
a=1;
yTL1 = ((a+1).*abs(x))./(a+abs(x));

figure(2)

plot(x,yp,'r:','linewidth',2); hold on
plot(x,yTL1,'b-','linewidth',2); hold on
plot([-20,20],[2,2],'b--','linewidth',1.75); hold on
ylim([0,5])
text(-6.5, 1.93,  'asymptote y=a+1', 'FontSize', 12)

set(gcf,'color','white'); %´°¿Ú±³¾°°×É«
backColor = [0.9843, 1.0000,0.9490];
set(gca, 'color', backColor); %´°¿Ú±³¾°°×É«
set(gca,'looseInset',[0 0 0 0]);
set(gca,'ticklength',[0 0]);
set(gca,'FontSize',12);
% grid on;
ax = gca;
ax.GridColor = [0.7529    0.7529    0.7529];
ax.LineWidth = 1;

legend({'\mu_{1/2}(t)','\rho_{1}(t)'},'Fontname', 'Times New Roman','FontSize',12,'FontWeight','bold','Location','southeast')

