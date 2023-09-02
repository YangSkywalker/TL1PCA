function pdata = blockPollute(data,num)
% function: add block noise to image data
% data -- image data; num -- control the size of block 

[data_m, data_n] = size(data);
pdata = [];

for i=1:data_m
    img = reshape(data(i,:),32,32);
    [m, n] = size(img);
    point_x = m - num + 1;
    point_y = n  - num + 1;
    % give the left-up point of block noise
    start_point(1) = randperm(point_x,1);
    start_point(2) = randperm(point_y,1);
    img(start_point(1):start_point(1)+num-1,start_point(2):start_point(2)+num-1)=0;
    pdata(i,:) = reshape(img, 1,1024);
end

