function [trainIdx, testIdx] = randomSplit(data_path, ratio)

% function: split train and test by the given ratio

if nargin == 1
    ratio = 0.7;
end

load(data_path)
img_num=length(gnd);
imgType=cell(length(unique(gnd)),1);
for i=1:img_num
    imgType{gnd(i)}(length( imgType{gnd(i)})+1)=i;
end

for i=1:50
    trainIdx=[]; testIdx=[];
    for j=1:length(unique(gnd))
        train_Idx=randperm(length(imgType{j}),round(length(imgType{j})*ratio));
        Type_scope=[1:length(imgType{j})]; Type_scope( train_Idx)=[];
        test_Idx=Type_scope;
        trainIdx((length(trainIdx)+1): (length(trainIdx)+length(train_Idx)))=imgType{j}(train_Idx);
        testIdx((length(testIdx)+1): (length(testIdx)+length(test_Idx)))=imgType{j}(test_Idx);
    end
    trainIdx=trainIdx';
    testIdx=testIdx';
end

end