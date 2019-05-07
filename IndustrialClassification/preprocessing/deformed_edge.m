%% Deformed bottles
%-----------------------------------
% https://blog.csdn.net/langb2014/article/details/49886787
%------------------------------------
image_origin = imread('image005.jpg');
image_new = imread('image040.jpg');
image_origin = image_origin(:, :, 1);
image_origin = imadjust(image_origin);
image_new = image_new(:, :, 1);
image_new = imadjust(image_new);
y1 =190 ;
x1 = 100 ;
y2 = 280;
x2= 260 ;
imageOut_origin = image_origin(y1:y2, x1:x2, :);
imageOut_new = image_new(y1:y2, x1:x2, :);
maskR = imbinarize(imageOut_origin, double(200/256));
subplot(1,2,1),imshow(imageOut_origin);
subplot(1,2,2),imshow(imageOut_new);
 cc = bwconncomp(maskR, 4);
 measurements = regionprops(cc, 'area','BoundingBox');
 areas = [measurements.Area];
 rects = cat(1,measurements.BoundingBox);
 % 显示所有连通区域
 figure(2)
 imshow(imageOut_new);
 size(rects,1)
 for i=1:size(rects,1)
     rectangle('position',rects(i,:),'EdgeColor','r')
 end
 % 显示最大连通区域
 [~,max_id] = max(areas);
 max_rect = rects(max_id,:);
 figure(3)
 imshow(imageOut_new);
 rectangle('position',max_rect,'EdgeColor','b');
 %measurements(3).BoundingBox
 length(measurements)
 
 
%% Edge detections of objects
% Carry out edge detection on the ROI
image_origin = imread('image005.jpg');
image_new = imread('image006.jpg');
image_origin = rgb2gray(image_origin);
image_origin = imadjust(image_origin);
image_new = rgb2gray(image_new);
image_new = imadjust(image_new);
y1 =170 ;
x1 = 110 ;
y2 = 195;
x2= 250 ;
imageOut_origin = image_origin(y1:y2, x1:x2, :);
imageOut_new = image_new(y1:y2, x1:x2, :);
[bw, t] = edge(imageOut_origin, 'Sobel');
roiEdge = edge(imageOut_origin, t*0.75);
    
% Find connected components and get info 'measurements' about each one
cc = bwconncomp(roiEdge);
measurements = regionprops(cc,'area', 'BoundingBox'); 
areas = [measurements.Area];
maxWidth = 0; maxHeight = 0;
subplot(1,2,1),imshow(imageOut_origin);
subplot(1,2,2),imshow(imageOut_new);
length(measurements)
rects = cat(1,measurements.BoundingBox);
 % 显示所有连通区域
 figure(2)
 imshow(imageOut_origin);
 size(rects,1)
 for i=1:size(rects,1)
     rectangle('position',rects(i,:),'EdgeColor','r')
 end
 
 [~,max_id] = max(areas);
 max_rect = rects(max_id,:);
 figure(3)
 imshow(imageOut_origin);
 rectangle('position',max_rect,'EdgeColor','b');