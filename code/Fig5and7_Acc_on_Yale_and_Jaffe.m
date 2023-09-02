%% ==========Yale===========
clear all; clc;
% import data
% load('E:\MatLab2016a\work\TL1\Result\Yale_Original_select9imagesAsTrain_acc.mat') 
% load('E:\MatLab2016a\work\TL1\Result\Yale_block8_select9imagesAsTrain_acc.mat') 
load('E:\MatLab2016a\work\TL1\Result\Yale_block12_select9imagesAsTrain_acc.mat')

% TL1
% compute the average value
TL1_acc100_mean =100* mean(TL1_acc100_a); 
TL1_acc50_mean =100* mean(TL1_acc50_a);
TL1_acc10_mean =100* mean(TL1_acc10_a);
TL1_acc1_mean =100* mean(TL1_acc1_a);
TL1_acc05_mean =100* mean(TL1_acc05_a);
TL1_acc01_mean =100* mean(TL1_acc01_a);
TL1_acc005_mean =100* mean(TL1_acc005_a);
TL1_acc001_mean =100* mean(TL1_acc001_a);
TL1_acc0001_mean =100* mean(TL1_acc0001_a);
% figure
figure(11)
plot(space,TL1_acc100_mean,'r-.','linewidth',2); hold on
plot(space,TL1_acc50_mean,'k-.','linewidth',2); hold on
plot(space,TL1_acc10_mean,'b-.','linewidth',2); hold on
plot(space,TL1_acc1_mean,'m-.','linewidth',2); hold on
plot(space,TL1_acc05_mean,'r-*','linewidth',2); hold on
plot(space,TL1_acc01_mean,'k-*','linewidth',2); hold on
plot(space,TL1_acc005_mean,'b-*','linewidth',2); hold on
plot(space,TL1_acc001_mean,'m-*','linewidth',2); hold on
plot(space,TL1_acc0001_mean,'r-<','linewidth',2); hold on

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
ylim([30,58])

xlabel('dimension'); ylabel('classification accuracy(%)');
legend({'TL_{1}PCA(a=100)','TL_{1}PCA(a=50)','TL_{1}PCA(a=10)','TL_{1}PCA(a=1)','TL_{1}PCA(a=0.5)',...
    'TL_{1}PCA(a=0.1)','TL_{1}PCA(a=0.05)','TL_{1}PCA(a=0.01)','TL_{1}PCA(a=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% Lp
% compute the average value
Lp_acc1_mean =100* mean(Lp_acc1_p);
Lp_acc09_mean =100* mean(Lp_acc09_p);
Lp_acc07_mean =100* mean(Lp_acc07_p);
Lp_acc05_mean =100* mean(Lp_acc05_p);
Lp_acc03_mean =100* mean(Lp_acc03_p);
Lp_acc01_mean =100* mean(Lp_acc01_p);
Lp_acc001_mean =100* mean(Lp_acc001_p);
Lp_acc0001_mean =100* mean(Lp_acc0001_p);
% figure
figure(2)
plot(space,Lp_acc1_mean,'r-.','linewidth',2); hold on
plot(space,Lp_acc09_mean,'k-.','linewidth',2); hold on
plot(space,Lp_acc07_mean,'b-.','linewidth',2); hold on
plot(space,Lp_acc05_mean,'m-.','linewidth',2); hold on
plot(space,Lp_acc03_mean,'r-*','linewidth',2); hold on
plot(space,Lp_acc01_mean,'k-*','linewidth',2); hold on
plot(space,Lp_acc001_mean,'b-*','linewidth',2); hold on
plot(space,Lp_acc0001_mean,'m-*','linewidth',2); hold on
xlabel('dimension'); ylabel('classification accuracy(%)');

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

legend({'PCALp(p=1)','PCALp(p=0.9)','PCALp(p=0.7)','PCALp(p=0.5)','PCALp(p=0.3)','PCALp(p=0.1)','PCALp(p=0.01)','PCALp(p=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% SP
% compute the average value
SP_acc1_mean =100* mean(SP_acc1_p);
SP_acc09_mean =100* mean(SP_acc09_p);
SP_acc07_mean =100* mean(SP_acc07_p);
SP_acc05_mean =100* mean(SP_acc05_p);
SP_acc03_mean =100* mean(SP_acc03_p);
SP_acc01_mean =100* mean(SP_acc01_p);
SP_acc001_mean =100* mean(SP_acc001_p);
SP_acc0001_mean =100* mean(SP_acc0001_p);
% figure
figure(3)
plot(space,SP_acc1_mean,'r-.','linewidth',2); hold on
plot(space,SP_acc09_mean,'k-.','linewidth',2); hold on
plot(space,SP_acc07_mean,'b-.','linewidth',2); hold on
plot(space,SP_acc05_mean,'m-.','linewidth',2); hold on
plot(space,SP_acc03_mean,'r-*','linewidth',2); hold on
plot(space,SP_acc01_mean,'k-*','linewidth',2); hold on
plot(space,SP_acc001_mean,'b-*','linewidth',2); hold on
plot(space,SP_acc0001_mean,'m-*','linewidth',2); hold on
xlabel('dimension'); ylabel('classification accuracy(%)');

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

legend({'LpSPCA(p=1)','LpSPCA(p=0.9)','LpSPCA(p=0.7)','LpSPCA(p=0.5)','LpSPCA(p=0.3)','LpSPCA(p=0.1)','LpSPCA(p=0.01)','LpSPCA(p=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% L1 and L2
% compute the average value
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);

figure(4)
% figure (original)
% plot(space,TL1_acc1_mean,'r-','marker','.' ,'linewidth',2); hold on 
% plot(space,Lp_acc05_mean,'k--','linewidth',2); hold on
% plot(space,SP_acc1_mean,'m:','linewidth',2); hold on
% plot(space,L1_acc_mean,'b-.','linewidth',2); hold on
% plot(space,pca_acc_mean,'c-','linewidth',2); hold on
% xlabel('dimension'); ylabel('classification accuracy(%)');
% legend({'TL_{1}PCA(a=1)', 'PCALp(p=0.5)', 'LpSPCA(p=1)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% figure (blocknoise08)
% plot(space,TL1_acc005_mean,'r-','marker','.' ,'linewidth',2); hold on
% plot(space,Lp_acc1_mean,'k--' ,'linewidth',2); hold on
% plot(space,SP_acc1_mean,'m:' ,'linewidth',2); hold on
% plot(space,L1_acc_mean,'b-.' ,'linewidth',2); hold on
% plot(space,pca_acc_mean,'c-' ,'linewidth',2); hold on
% xlabel('dimension'); ylabel('classification accuracy(%)');
% legend({'TL_{1}PCA(a=0.05)', 'PCALp(p=1)','LpSPCA(p=1)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% figure (blocknoise12)
plot(space,TL1_acc005_mean,'r-','marker','.','linewidth',2); hold on
plot(space,Lp_acc09_mean,'k--','linewidth',2); hold on
plot(space,SP_acc07_mean,'m:','linewidth',2); hold on
plot(space,L1_acc_mean,'b-.','linewidth',2); hold on
plot(space,pca_acc_mean,'c-','linewidth',2); hold on
xlabel('dimension'); ylabel('classification accuracy(%)');
ylim([30,58])
legend({'TL_{1}PCA(a=0.05)', 'PCALp(p=0.9)', 'LpSPCA(p=0.7)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

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




%% ============Jaffe===============
clear all; clc;
% import data
% load('E:\MatLab2016a\work\TL1\Result\Jaffe_Original_select9imagesAsTrain_acc.mat') 
% load('E:\MatLab2016a\work\TL1\Result\Jaffe_block8_select9imagesAsTrain_acc.mat') 
load('E:\MatLab2016a\work\TL1\Result\Jaffe_block12_select9imagesAsTrain_acc.mat')

% TL1
% compute the average value
TL1_acc100_mean =100* mean(TL1_acc100_a); 
TL1_acc50_mean =100* mean(TL1_acc50_a);
TL1_acc10_mean =100* mean(TL1_acc10_a);
TL1_acc1_mean =100* mean(TL1_acc1_a);
TL1_acc05_mean =100* mean(TL1_acc05_a);
TL1_acc01_mean =100* mean(TL1_acc01_a);
TL1_acc005_mean =100* mean(TL1_acc005_a);
TL1_acc001_mean =100* mean(TL1_acc001_a);
TL1_acc0001_mean =100* mean(TL1_acc0001_a);
% figure
figure(5)
plot(space,TL1_acc100_mean,'r-.','linewidth',2); hold on
plot(space,TL1_acc50_mean,'k-.','linewidth',2); hold on
plot(space,TL1_acc10_mean,'b-.','linewidth',2); hold on
plot(space,TL1_acc1_mean,'m-.','linewidth',2); hold on
plot(space,TL1_acc05_mean,'r-*','linewidth',2); hold on
plot(space,TL1_acc01_mean,'k-*','linewidth',2); hold on
plot(space,TL1_acc005_mean,'b-*','linewidth',2); hold on
plot(space,TL1_acc001_mean,'m-*','linewidth',2); hold on
plot(space,TL1_acc0001_mean,'r-<','linewidth',2); hold on

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

xlabel('dimension'); ylabel('classification accuracy(%)');
legend({'TL_{1}PCA(a=100)','TL_{1}PCA(a=50)','TL_{1}PCA(a=10)','TL_{1}PCA(a=1)','TL_{1}PCA(a=0.5)',...
    'TL_{1}PCA(a=0.1)','TL_{1}PCA(a=0.05)','TL_{1}PCA(a=0.01)','TL_{1}PCA(a=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% Lp
% compute the average value
Lp_acc1_mean =100* mean(Lp_acc1_p);
Lp_acc09_mean =100* mean(Lp_acc09_p);
Lp_acc07_mean =100* mean(Lp_acc07_p);
Lp_acc05_mean =100* mean(Lp_acc05_p);
Lp_acc03_mean =100* mean(Lp_acc03_p);
Lp_acc01_mean =100* mean(Lp_acc01_p);
Lp_acc001_mean =100* mean(Lp_acc001_p);
Lp_acc0001_mean =100* mean(Lp_acc0001_p);
% figure
figure(6)
plot(space,Lp_acc1_mean,'r-.','linewidth',2); hold on
plot(space,Lp_acc09_mean,'k-.','linewidth',2); hold on
plot(space,Lp_acc07_mean,'b-.','linewidth',2); hold on
plot(space,Lp_acc05_mean,'m-.','linewidth',2); hold on
plot(space,Lp_acc03_mean,'r-*','linewidth',2); hold on
plot(space,Lp_acc01_mean,'k-*','linewidth',2); hold on
plot(space,Lp_acc001_mean,'b-*','linewidth',2); hold on
plot(space,Lp_acc0001_mean,'m-*','linewidth',2); hold on

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

xlabel('dimension'); ylabel('classification accuracy(%)');
legend({'PCALp(p=1)','PCALp(p=0.9)','PCALp(p=0.7)','PCALp(p=0.5)','PCALp(p=0.3)','PCALp(p=0.1)','PCALp(p=0.01)','PCALp(p=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% SP
% compute the average value
SP_acc1_mean =100* mean(SP_acc1_p);
SP_acc09_mean =100* mean(SP_acc09_p);
SP_acc07_mean =100* mean(SP_acc07_p);
SP_acc05_mean =100* mean(SP_acc05_p);
SP_acc03_mean =100* mean(SP_acc03_p);
SP_acc01_mean =100* mean(SP_acc01_p);
SP_acc001_mean =100* mean(SP_acc001_p);
SP_acc0001_mean =100* mean(SP_acc0001_p);
% figure
figure(7)
plot(space,SP_acc1_mean,'r-.','linewidth',2); hold on
plot(space,SP_acc09_mean,'k-.','linewidth',2); hold on
plot(space,SP_acc07_mean,'b-.','linewidth',2); hold on
plot(space,SP_acc05_mean,'m-.','linewidth',2); hold on
plot(space,SP_acc03_mean,'r-*','linewidth',2); hold on
plot(space,SP_acc01_mean,'k-*','linewidth',2); hold on
plot(space,SP_acc001_mean,'b-*','linewidth',2); hold on
plot(space,SP_acc0001_mean,'m-*','linewidth',2); hold on

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

xlabel('dimension'); ylabel('classification accuracy(%)');
legend({'LpSPCA(p=1)','LpSPCA(p=0.9)','LpSPCA(p=0.7)','LpSPCA(p=0.5)','LpSPCA(p=0.3)','LpSPCA(p=0.1)','LpSPCA(p=0.01)','LpSPCA(p=0.001)'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% L1 and L2
% compute the average value
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);

figure(8)
% figure 
% plot(space,TL1_acc1_mean,'r-','marker','.','linewidth',2); hold on
% plot(space,Lp_acc05_mean,'k--','linewidth',2); hold on
% plot(space,SP_acc1_mean,'m:','linewidth',2); hold on
% plot(space,L1_acc_mean,'b-.','linewidth',2); hold on
% plot(space,pca_acc_mean,'c-','linewidth',2); hold on
% xlabel('dimension'); ylabel('classification accuracy(%)');
% legend({'TL_{1}PCA(a=1)', 'PCALp(p=0.5)', 'LpSPCA(p=1)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% figure (blocknoise08)
% plot(space,TL1_acc05_mean,'r-','marker','.','linewidth',2); hold on
% plot(space,Lp_acc1_mean,'k--','linewidth',2); hold on
% plot(space,SP_acc07_mean,'m:','linewidth',2); hold on
% plot(space,L1_acc_mean,'b-.','linewidth',2); hold on
% plot(space,pca_acc_mean,'c-','linewidth',2); hold on
% xlabel('dimension'); ylabel('classification accuracy(%)');
% legend({'TL_{1}PCA(a=0.5)', 'PCALp(p=1)', 'LpSPCA(p=0.7)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

% figure (blocknoise12)
plot(space,TL1_acc10_mean,'r-','marker','.','linewidth',2); hold on
plot(space,Lp_acc09_mean,'k--','linewidth',2); hold on
plot(space,SP_acc1_mean,'m:','linewidth',2); hold on
plot(space,L1_acc_mean,'b-.','linewidth',2); hold on
plot(space,pca_acc_mean,'c-','linewidth',2); hold on
xlabel('dimension'); ylabel('classification accuracy(%)');
legend({'TL_{1}PCA(a=10)', 'PCALp(p=0.9)', 'LpSPCA(p=1)','PCAL1','PCA'},'Fontname', 'Times New Roman','FontSize',12,'Location','southeast')

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