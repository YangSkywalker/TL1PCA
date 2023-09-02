%% Yale
clear all; clc; 
load('E:\MatLab2016a\work\TL1\Yale\Yale_32x32');
fea_original = double(fea)/255;
load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise8_32x32');
fea_saltnoise = fea;
load('E:\MatLab2016a\work\TL1\Yale\Yale_blacknoise12_32x32');
fea_blacknoise = fea;
% sample images
figure(2)
for i=1:6
    subplot(3,6,i,'position',[0.15*(i-1),0.8,0.2,0.2])
    imshow(reshape(fea_original(i,:),32,32))
    subplot(3,6,i+6,'position',[0.15*(i-1),0.59,0.2,0.2])
    imshow(reshape(fea_saltnoise(i,:),32,32))
    subplot(3,6,i+2*6,'position',[0.15*(i-1),0.38,0.2,0.2])
    imshow(reshape(fea_blacknoise(i,:),32,32))
end

%% Jaffe
clear all; clc; 
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_32x32');
fea_original = double(fea)/255;
fea_original(4,:) = fea_original(7,:);
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise8_32x32');
fea_saltnoise = fea;
fea_saltnoise(4,:) = fea_saltnoise(7,:);
load('E:\MatLab2016a\work\TL1\Jaffe\Jaffe_blacknoise12_32x32');
fea_blacknoise = fea;
fea_blacknoise(4,:) = fea_blacknoise(7,:);
% sample images
figure(3)
for i=1:6
    subplot(3,6,i,'position',[0.15*(i-1),0.8,0.2,0.2])
    imshow(reshape(fea_original(i,:),32,32))
    subplot(3,6,i+6,'position',[0.15*(i-1),0.59,0.2,0.2])
    imshow(reshape(fea_saltnoise(i,:),32,32))
    subplot(3,6,i+2*6,'position',[0.15*(i-1),0.38,0.2,0.2])
    imshow(reshape(fea_blacknoise(i,:),32,32))
end

