%% --------------------------PCA¡¢PCAL1--------------------------------------------
clear all; clc
% data
data=[-3,-2.79310344827586,-2.58620689655172,-2.37931034482759,-2.17241379310345,-1.96551724137931,-1.75862068965517,-1.55172413793103,-1.34482758620690,-1.13793103448276,-0.931034482758621,-0.724137931034483,-0.517241379310345,-0.310344827586207,-0.103448275862069,0.103448275862069,0.310344827586207,0.517241379310345,0.724137931034483,0.931034482758621,1.13793103448276,1.34482758620690,1.55172413793103,1.75862068965517,1.96551724137931,2.17241379310345,2.37931034482759,2.58620689655172,2.79310344827586,3;...
          -4.74024678969409,-3.45996390420019,-2.86187770196163,-1.26016522061313,-1.36022410607935,-2.79646625855040,-2.48500490092524,-0.0886460006171090,-2.11286395677664,-1.27770781305111,0.505398439959354,-1.74408880889702,-1.15598346275032,1.43548432474906,0.984755198341281,0.897375538049196,1.53442336923449,0.723080048269864,1.37639576484386,0.0808444440664867,0.660721301754106,1.23881280927699,0.163177898767622,1.83906887977167,1.21328378373864,0.693218471358382,2.81898659776393,2.19952087855963,4.83263876599749,2.14605274087888];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];
% pca
w_all=pca(alldata','Centered',false,'NumComponents',1);                                       
wL1_all=PCAL1_nongreedy(alldata,1);
w_ideal = [1/sqrt(2),1/sqrt(2)]';
% compute the included angles
angle.PCA = w_ideal'*w_all/(norm(w_ideal)*norm(w_all)) ;                          % PCA
angle.L1  = abs(w_ideal')*abs(wL1_all)/norm(w_ideal)*norm(wL1_all);                % PCAL1 

angle.PCA = acos(angle.PCA)*180/pi;
angle.L1 = acos(angle.L1)*180/pi;

angle

figure(1)
% plot sample points
plot(data(1,:),data(2,:),'.','color',[0.4,0.5,0.8],'markersize',24); hold on 
plot(outlier(1,:),outlier(2,:),'*r','markersize',10); hold on
axis([-4.5,5.2,-4.5,6.2])
% plot the projection lines
x=-4:0.1:4;
plot(x,x,'k-','linewidth',1.75)
plot(x,w_all(2)/w_all(1)*x,'--b','linewidth',1.75); hold on    % PCA£¬with outliers
plot(x,wL1_all(2)/wL1_all(1)*x,'-.r','linewidth',1.75); hold on    % PCAL1£¬with outliers

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

legend({'data','outlier','Ideal direction','w_{PCA}','w_{PCAL1}'},'Fontname', ....
    'Times New Roman','FontSize',9,'FontWeight','bold','Location','southeast')
 
gtext('31.5^o','Color','b')
gtext('22^o','Color','r')


%%  -------------------------------PCALp---------------------------------------
clear all; clc
% data
data=[-3,-2.79310344827586,-2.58620689655172,-2.37931034482759,-2.17241379310345,-1.96551724137931,-1.75862068965517,-1.55172413793103,-1.34482758620690,-1.13793103448276,-0.931034482758621,-0.724137931034483,-0.517241379310345,-0.310344827586207,-0.103448275862069,0.103448275862069,0.310344827586207,0.517241379310345,0.724137931034483,0.931034482758621,1.13793103448276,1.34482758620690,1.55172413793103,1.75862068965517,1.96551724137931,2.17241379310345,2.37931034482759,2.58620689655172,2.79310344827586,3;...
          -4.74024678969409,-3.45996390420019,-2.86187770196163,-1.26016522061313,-1.36022410607935,-2.79646625855040,-2.48500490092524,-0.0886460006171090,-2.11286395677664,-1.27770781305111,0.505398439959354,-1.74408880889702,-1.15598346275032,1.43548432474906,0.984755198341281,0.897375538049196,1.53442336923449,0.723080048269864,1.37639576484386,0.0808444440664867,0.660721301754106,1.23881280927699,0.163177898767622,1.83906887977167,1.21328378373864,0.693218471358382,2.81898659776393,2.19952087855963,4.83263876599749,2.14605274087888];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];
% pca
wP1_all=PCALp_nongreedy(alldata,1,1);
wP05_all=PCALp_nongreedy(alldata,1,0.5);
wP01_all=PCALp_nongreedy(alldata,1,0.01);
w_ideal = [1/sqrt(2),1/sqrt(2)]';
% compute the included angles
angle.Lp  = abs(w_ideal')*abs(wP1_all)/norm(w_ideal)*norm(wP1_all);               % PCALp
angle.Lp05  = abs(w_ideal')*abs(wP05_all)/norm(w_ideal)*norm(wP05_all);               % PCALp
angle.Lp01  = abs(w_ideal')*abs(wP01_all)/norm(w_ideal)*norm(wP01_all);               % PCALp

angle.Lp = acos(angle.Lp)*180/pi;
angle.Lp05 = acos(angle.Lp05)*180/pi;
angle.Lp01 = acos(angle.Lp01)*180/pi;

angle

figure(2)
% plot sample points
plot(data(1,:),data(2,:),'.','color',[0.4,0.5,0.8],'markersize',24); hold on 
plot(outlier(1,:),outlier(2,:),'r*','markersize',10); hold on
axis([-4.5,5.2,-4.5,6.2])
% plot projection lines
x=-4:0.1:4;
plot(x,x,'k-','linewidth',1.75)
plot(x,wP1_all(2)/wP1_all(1)*x,'--b','linewidth',1.75); hold on    % PCALp£¬with outliers
plot(x,wP05_all(2)/wP05_all(1)*x,'-.r','linewidth',1.75); hold on    % PCALp£¬with outliers
plot(x,wP01_all(2)/wP01_all(1)*x,':m','linewidth',1.75); hold on    % PCALp£¬with outliers

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

legend({'data','outlier','Ideal direction','w_{PCALp} (p=1)',...
           'w_{PCALp} (p=0.5)','w_{PCALp} (p=0.01)'},...
            'Fontname', 'Times New Roman','FontSize',9,'FontWeight','bold','Location','southeast')

gtext('22^o','Color','b')
gtext('21^o','Color','r')
gtext('9.4^o','Color','m')
 %%  -----------------------------LpSPCA-----------------------------------------
clear all; clc
% data
data=[-3,-2.79310344827586,-2.58620689655172,-2.37931034482759,-2.17241379310345,-1.96551724137931,-1.75862068965517,-1.55172413793103,-1.34482758620690,-1.13793103448276,-0.931034482758621,-0.724137931034483,-0.517241379310345,-0.310344827586207,-0.103448275862069,0.103448275862069,0.310344827586207,0.517241379310345,0.724137931034483,0.931034482758621,1.13793103448276,1.34482758620690,1.55172413793103,1.75862068965517,1.96551724137931,2.17241379310345,2.37931034482759,2.58620689655172,2.79310344827586,3;...
          -4.74024678969409,-3.45996390420019,-2.86187770196163,-1.26016522061313,-1.36022410607935,-2.79646625855040,-2.48500490092524,-0.0886460006171090,-2.11286395677664,-1.27770781305111,0.505398439959354,-1.74408880889702,-1.15598346275032,1.43548432474906,0.984755198341281,0.897375538049196,1.53442336923449,0.723080048269864,1.37639576484386,0.0808444440664867,0.660721301754106,1.23881280927699,0.163177898767622,1.83906887977167,1.21328378373864,0.693218471358382,2.81898659776393,2.19952087855963,4.83263876599749,2.14605274087888];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];
% pca
wSp_all= LpSPCA(alldata',1,1,2);
wSp05_all= LpSPCA(alldata',1,0.5,2);
wSp01_all= LpSPCA(alldata',1,0.01,2);
w_ideal = [1/sqrt(2),1/sqrt(2)]';
% compute the included angles
angle.sp    = abs(w_ideal')*abs(wSp_all)/norm(w_ideal)*norm(wSp_all);                         % LpspPCA
angle.sp05    = abs(w_ideal')*abs(wSp05_all)/norm(w_ideal)*norm(wSp05_all);             % LpspPCA
angle.sp01    = abs(w_ideal')*abs(wSp01_all)/norm(w_ideal)*norm(wSp01_all);             % LpspPCA

angle.sp = acos(angle.sp)*180/pi;
angle.sp05 = acos(angle.sp05)*180/pi;
angle.sp01 = acos(angle.sp01)*180/pi;

angle

figure(3)
% plot sample points
plot(data(1,:),data(2,:),'.','color',[0.4,0.5,0.8],'markersize',24); hold on 
plot(outlier(1,:),outlier(2,:),'r*','markersize',10); hold on
axis([-4.5,5.2,-4.5,6.2])
%  plot the projection lines
x=-4:0.1:4;
plot(x,x,'k-','linewidth',1.75)
plot(x,wSp_all(2)/wSp_all(1)*x,'--b','linewidth',1.75); hold on    % LpspPCA£¬with outliers
plot(x,wSp05_all(2)/wSp05_all(1)*x,'-.r','linewidth',1.75); hold on    % LpspPCA£¬with outliers
plot(x,wSp01_all(2)/wSp01_all(1)*x,':m','linewidth',1.75); hold on    % LpspPCA£¬with outliers

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

legend({'data','outlier','Ideal direction','w_{LpSPCA} (p=1)',...
    'w_{LpSPCA}^{outlier} (p=0.5)','w_{LpSPCA} (p=0.01)'},...
            'Fontname', 'Times New Roman','FontSize',9,'FontWeight','bold','Location','southeast')

gtext('22^o','Color','b')
gtext('21.4^o','Color','r')
gtext('35.1^o','Color','m')
%%  ----------------------------------TL1PCA------------------------------------
clear all;clc
% data
data=[-3,-2.79310344827586,-2.58620689655172,-2.37931034482759,-2.17241379310345,-1.96551724137931,-1.75862068965517,-1.55172413793103,-1.34482758620690,-1.13793103448276,-0.931034482758621,-0.724137931034483,-0.517241379310345,-0.310344827586207,-0.103448275862069,0.103448275862069,0.310344827586207,0.517241379310345,0.724137931034483,0.931034482758621,1.13793103448276,1.34482758620690,1.55172413793103,1.75862068965517,1.96551724137931,2.17241379310345,2.37931034482759,2.58620689655172,2.79310344827586,3;...
          -4.74024678969409,-3.45996390420019,-2.86187770196163,-1.26016522061313,-1.36022410607935,-2.79646625855040,-2.48500490092524,-0.0886460006171090,-2.11286395677664,-1.27770781305111,0.505398439959354,-1.74408880889702,-1.15598346275032,1.43548432474906,0.984755198341281,0.897375538049196,1.53442336923449,0.723080048269864,1.37639576484386,0.0808444440664867,0.660721301754106,1.23881280927699,0.163177898767622,1.83906887977167,1.21328378373864,0.693218471358382,2.81898659776393,2.19952087855963,4.83263876599749,2.14605274087888];
outlier=[-4,4.8;-3.7,5.1;-3.3,6;-2.4,5.5]';
alldata=[data,outlier];
% pca
wTL1_all1=TL1PCA_orth(alldata,1,100);
wTL1_all2=TL1PCA_orth(alldata,1,1);
wTL1_all3=TL1PCA_orth(alldata,1,0.01);
w_ideal = [1/sqrt(2),1/sqrt(2)]';
% compute the included angles
angle.TL11 = abs(w_ideal')*abs(wTL1_all1)/norm(w_ideal)*norm(wTL1_all1);      
angle.TL12 = abs(w_ideal')*abs(wTL1_all2)/norm(w_ideal)*norm(wTL1_all2);   
angle.TL13 = abs(w_ideal')*abs(wTL1_all3)/norm(w_ideal)*norm(wTL1_all3);   

angle.TL11 = acos(angle.TL11)*180/pi;
angle.TL12 = acos(angle.TL12)*180/pi;
angle.TL13 = acos(angle.TL13)*180/pi;

angle

figure(4)
%  plot sample points
plot(data(1,:),data(2,:),'.','color',[0.4,0.5,0.8],'markersize',24); hold on 
plot(outlier(1,:),outlier(2,:),'*','markersize',10); hold on
axis([-4.5,5.2,-4.5,6.2])
% plot the projection lines
x=-4:0.1:4;
plot(x,x,'k-','linewidth',1.75)
plot(x,wTL1_all1(2)/wTL1_all1(1)*x,'--b','linewidth',1.75); hold on    % TL1PCA£¬with outliers
plot(x,wTL1_all2(2)/wTL1_all2(1)*x,'-.r','linewidth',1.75); hold on    % TL1PCA£¬with outliers
plot(x,wTL1_all3(2)/wTL1_all3(1)*x,':m','linewidth',1.75); hold on    % TL1PCA£¬with outliers

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

legend({'data','outlier','Ideal direction','w_{TL_1PCA} (a=100)','w_{TL_1PCA} (a=1)',...
    'w_{TL_1PCA} (a=0.01)'},'Fontname', 'Times New Roman','FontSize',9,'FontWeight','bold','Location','southeast')

gtext('21.8^o','Color','b')
gtext('11.5^o','Color','r')
gtext('2.8^o','Color','m')
        