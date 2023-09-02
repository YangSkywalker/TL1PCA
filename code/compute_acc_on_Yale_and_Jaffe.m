%% ===== Yale =====

% original
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Yale\Yale_32x32';

% set parameter
ratio = 9/11;             % the ratio of train and test

iterations=15;        % repeat 15 times
pcomp=17;            % the number of principal component
maxDim=85;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = fea(trainIdx, :);                                             x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Yale_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')

%%%  ---------block8-------------
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Yale\Yale_32x32';

% set parameter
ratio = 9/11;             % the ratio of train and test
block_size = 8;         % the size of block noise

iterations=15;        % repeat 15 times
pcomp=17;            % the number of principal component
maxDim=85;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = blockPollute(fea(trainIdx, :),block_size);     x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Yale_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')

%%%  ---------block12-------------
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Yale\Yale_32x32';

% set parameter
ratio = 9/11;             % the ratio of train and test
block_size = 12;         % the size of block noise

iterations=15;        % repeat 15 times
pcomp=17;            % the number of principal component
maxDim=85;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = blockPollute(fea(trainIdx, :),block_size);     x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Yale_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Yale_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')


%% ===== Jaffe =====

% original
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32';

% set parameter
ratio = 7/10;             % the ratio of train and test

iterations=15;        % repeat 15 times
pcomp=22;            % the number of principal component
maxDim=110;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = fea(trainIdx, :);                                             x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Jaffe_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')

%%%  ---------block8-------------
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32';

% set parameter
ratio = 7/10;             % the ratio of train and test
block_size = 8;         % the size of block noise

iterations=15;        % repeat 15 times
pcomp=22;            % the number of principal component
maxDim=110;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = blockPollute(fea(trainIdx, :),block_size);     x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Jaffe_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')

%%%  ---------block12-------------
clear all; clc

% load data
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32'); fea=double(fea)/255;
data_path = 'E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32';

% set parameter
ratio = 7/10;             % the ratio of train and test
block_size = 12;         % the size of block noise

iterations=15;        % repeat 15 times
pcomp=22;            % the number of principal component
maxDim=110;          % maximal dimension 
space=linspace(5,maxDim,pcomp); 
interval=5;
sparse=1024;

% store reconstruction error, mean, standard variation of TL1(a=100)
TL1_acc100_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=50)
TL1_acc50_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=10)
TL1_acc10_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=1)
TL1_acc1_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.5)
TL1_acc05_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.1)
TL1_acc01_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.05)
TL1_acc005_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.01)
TL1_acc001_a=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of TL1(a=0.001)
TL1_acc0001_a=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of PCALp(p=1)
Lp_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.9)
Lp_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.7)
Lp_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.5)
Lp_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.3)
Lp_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.1)
Lp_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.01)
Lp_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of PCALp(p=0.001)
Lp_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of sPCA(p=1)
SP_acc1_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.9)
SP_acc09_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.7)
SP_acc07_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.5)
SP_acc05_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.3)
SP_acc03_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.1)
SP_acc01_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.01)
SP_acc001_p=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of sPCA(p=0.001)
SP_acc0001_p=zeros(iterations,pcomp);

% store reconstruction error, mean, standard variation of pca
pca_acc=zeros(iterations,pcomp);
% store reconstruction error, mean, standard variation of L1
L1_acc=zeros(iterations,pcomp);

for i=1:iterations
    % prepare the dataset of train and test
    [trainIdx, testIdx] = randomSplit(data_path, ratio);   
    x_train = blockPollute(fea(trainIdx, :),block_size);     x_test = fea(testIdx,:);
    y_train = gnd(trainIdx,:);                                             y_test = gnd(testIdx,:);
      
    % compute principal components of TL1(a=100) 
    W_TL1=TL1PCA_orth(x_train',maxDim,100);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc100_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=50) 
    W_TL1=TL1PCA_orth(x_train',maxDim,50);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc50_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=10) 
    W_TL1=TL1PCA_orth(x_train',maxDim,10);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc10_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc1_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.5) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.5);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc05_a(i,j/interval)=acc;
    end
   
    % compute principal components of TL1(a=0.1) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.1);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc01_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.05) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.05);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc005_a(i,j/interval)=acc;
    end
    
    % compute principal components of TL1(a=0.01) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.01);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc001_a(i,j/interval)=acc;
    end    
    
    % compute principal components of TL1(a=0.001) 
    W_TL1=TL1PCA_orth(x_train',maxDim,0.001);
    % acc
    for j=space
        acc = knn_classifier(W_TL1(:,1:j),x_train,y_train,x_test,y_test);
        TL1_acc0001_a(i,j/interval)=acc;
    end  
    
    %-----------------------------------------------------
    % compute principal components of PCALp(p=1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc1_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.9)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.9);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc09_p(i,j/interval)=acc; 
    end
  
    % compute principal components of PCALp(p=0.7)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.7);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.5)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.5);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc05_p(i,j/interval)=acc;
    end

    % compute principal components of PCALp(p=0.3)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.3);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.1)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.1);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.01)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.01);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of PCALp(p=0.001)
    W_Lp=PCALp_nongreedy(x_train',maxDim,0.001);
    % acc 
    for j=space
        acc = knn_classifier(W_Lp(:,1:j),x_train,y_train,x_test,y_test);
        Lp_acc0001_p(i,j/interval)=acc;
    end
    
    % -----------------------------------------------------
    % compute principal components of sPCA(p=1) 
    W_SP=LpSPCA(x_train,maxDim,1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc1_p(i,j/interval)=acc;
    end
 
    % compute principal components of sPCA(p=0.9) 
    W_SP=LpSPCA(x_train,maxDim,0.9,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc09_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.7) 
    W_SP=LpSPCA(x_train,maxDim,0.7,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc07_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.5) 
    W_SP=LpSPCA(x_train,maxDim,0.5,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc05_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.3) 
    W_SP=LpSPCA(x_train,maxDim,0.3,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc03_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.1) 
    W_SP=LpSPCA(x_train,maxDim,0.1,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc01_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.01) 
    W_SP=LpSPCA(x_train,maxDim,0.01,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc001_p(i,j/interval)=acc;
    end
    
    % compute principal components of sPCA(p=0.001) 
    W_SP=LpSPCA(x_train,maxDim,0.001,sparse);
    % acc
    for j=space
        acc = knn_classifier(W_SP(:,1:j),x_train,y_train,x_test,y_test);
        SP_acc0001_p(i,j/interval)=acc;
    end

    % -------------------------------------------------
    % compute principal components of PCA 
    W_PCA = pca(x_train,'Centered',false,'NumComponents',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_PCA(:,1:j),x_train,y_train,x_test,y_test);
        pca_acc(i,j/interval)=acc;
    end
    
    % compute principal components of L1  
    W_L1=PCAL1_nongreedy(x_train',maxDim);
    % acc
    for j=space
        acc = knn_classifier(W_L1(:,1:j),x_train,y_train,x_test,y_test);
        L1_acc(i,j/interval)=acc;
    end    
end    

% save('E:\MatLab2016a\work\TL1\Result\Jaffe_Original_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block8_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
% save('E:\MatLab2016a\work\TL1\Result\Jaffe_block12_select9imagesAsTrain_acc','TL1_acc100_a','TL1_acc50_a','TL1_acc10_a','TL1_acc1_a','TL1_acc05_a','TL1_acc01_a','TL1_acc005_a','TL1_acc001_a','TL1_acc0001_a',...
%     'Lp_acc1_p','Lp_acc09_p','Lp_acc07_p','Lp_acc05_p','Lp_acc03_p','Lp_acc01_p','Lp_acc001_p','Lp_acc0001_p',...
%     'SP_acc1_p','SP_acc09_p','SP_acc07_p','SP_acc05_p','SP_acc03_p','SP_acc01_p','SP_acc001_p','SP_acc0001_p','pca_acc','L1_acc','space')
