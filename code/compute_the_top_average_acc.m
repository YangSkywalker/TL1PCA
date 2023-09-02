%% ==========Yale===========
clear all; clc;

topacc=[];
topacc8=[];
topacc12=[];
% import data
load('E:\MatLab2016a\work\TL1\Result\Yale_Original_select9imagesAsTrain_acc.mat') 
% TL1
% compute the average value
TL1_acc1_mean =100* mean(TL1_acc1_a);
Lp_acc05_mean  =100* mean(Lp_acc05_p);
SP_acc1_mean =100* mean(SP_acc1_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameter
topacc(1)=max(TL1_acc1_mean); topacc(2)=max(Lp_acc05_mean); topacc(3)=max(SP_acc1_mean);
topacc(4)=max(L1_acc_mean); topacc(5)=max(pca_acc_mean);

% % import data
load('E:\MatLab2016a\work\TL1\Result\Yale_block8_select9imagesAsTrain_acc.mat')
% compute the average value
TL1_acc005_mean =100* mean(TL1_acc005_a);
Lp_acc1_mean =100* mean(Lp_acc1_p);
SP_acc1_mean =100* mean(SP_acc1_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameterc
topacc8(1)=max(TL1_acc005_mean); topacc8(2)=max(Lp_acc1_mean); topacc8(3)=max(SP_acc1_mean);
topacc8(4)=max(L1_acc_mean); topacc8(5)=max(pca_acc_mean);

% import data
load('E:\MatLab2016a\work\TL1\Result\Yale_block12_select9imagesAsTrain_acc.mat')
%  compute the average value
TL1_acc05_mean =100* mean(TL1_acc05_a);
Lp_acc09_mean =100* mean(Lp_acc09_p);
SP_acc1_mean =100* mean(SP_acc1_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameterc
topacc12(1)=max(TL1_acc05_mean); topacc12(2)=max(Lp_acc09_mean); topacc12(3)=max(SP_acc1_mean);
topacc12(4)=max(L1_acc_mean); topacc12(5)=max(pca_acc_mean);
% output
topacc
topacc8
topacc12

%% ==========Jaffe===========
clear all; clc;
% store
topacc=[];
topacc8=[];
topacc12=[];
% import data
load('E:\MatLab2016a\work\TL1\Result\Jaffe_Original_select9imagesAsTrain_acc.mat')  
% TL1
% compute the average value
TL1_acc1_mean =100* mean(TL1_acc1_a);
Lp_acc05_mean  =100* mean(Lp_acc05_p);
SP_acc1_mean =100* mean(SP_acc1_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameterc
topacc(1)=max(TL1_acc1_mean); topacc(2)=max(Lp_acc05_mean); topacc(3)=max(SP_acc1_mean);
topacc(4)=max(L1_acc_mean); topacc(5)=max(pca_acc_mean);

% %  import data
load('E:\MatLab2016a\work\TL1\Result\Jaffe_block8_select9imagesAsTrain_acc.mat') 
% compute the average value
TL1_acc05_mean =100* mean(TL1_acc05_a);
Lp_acc1_mean =100* mean(Lp_acc1_p);
SP_acc07_mean =100* mean(SP_acc07_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameterc
topacc8(1)=max(TL1_acc05_mean); topacc8(2)=max(Lp_acc1_mean); topacc8(3)=max(SP_acc07_mean);
topacc8(4)=max(L1_acc_mean); topacc8(5)=max(pca_acc_mean);

%  import data
load('E:\MatLab2016a\work\TL1\Result\Jaffe_block12_select9imagesAsTrain_acc.mat')
% compute the average value
TL1_acc10_mean =100* mean(TL1_acc10_a);
Lp_acc09_mean =100* mean(Lp_acc09_p);
SP_acc1_mean =100* mean(SP_acc1_p);
L1_acc_mean =100* mean(L1_acc);
pca_acc_mean =100* mean(pca_acc);
% compute  the acc under the optimal parameterc
topacc12(1)=max(TL1_acc10_mean); topacc12(2)=max(Lp_acc09_mean); topacc12(3)=max(SP_acc1_mean);
topacc12(4)=max(L1_acc_mean); topacc12(5)=max(pca_acc_mean);
% output
topacc
topacc8
topacc12

