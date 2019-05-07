%%  Read the file
image = imread('image005.jpg');
[h,w,~]=size(image);
% image_gray = rgb2gray(image);
imshow(image);

%% Features ROI
y1 =190 ;
x1 = 100 ;
y2 = 280;
x2= 260 ;
imageOut = image(y1:y2, x1:x2, :);
roiBinary = imbinarize(image, double(150/256));
size(roiBinary(:))
blackPercentage = 100 * (sum(roiBinary(:) == 0) / numel(roiBinary(:)))
% imshow(imageOut);
% imshowpair(image,roiBinary,'montage');
figure
imshow(roiBinary);

%% Get the ROI values
image = imread('image005.jpg');
[m,n,z]=size(image);
figure(1)
% image = rgb2gray(image);
imshow(image)

h = imrect;
pos = getPosition(h)
imCp = imcrop(image,pos);
figure(2)
imshow(imCp);

%% histogram
image_origin = rgb2gray(imread('image005.jpg'));
image_new = rgb2gray(imread('image018.jpg'));
y1 =3 ;
x1 = 119 ;
y2 = 287;
x2= 252 ;
imageOut_origin = image_origin(y1:y2, x1:x2, :);
imageOut_new = image_new(y1:y2, x1:x2, :);
%blackPercentage = 100 * (sum(imageOut_origin(:) == 0) / numel(imageOut_origin(:)))
roiBinary_origin = imbinarize(imageOut_origin, double(150/256));
roiBinary_new = imbinarize(imageOut_new, double(150/256));
blackPercentage = 100 * (sum(imageOut_new(:) == 0) / numel(imageOut_new(:)))
subplot(2,3,1),imshow(image_origin);
subplot(2,3,2),imshow(imageOut_origin);
subplot(2,3,3),imhist(imageOut_origin);
subplot(2,3,4),imshow(image_new);
subplot(2,3,5),imshow(imageOut_new);
subplot(2,3,6),imhist(imageOut_new);


%% Intensity thresholding
image_origin = rgb2gray(imread('image005.jpg'));
image_new = rgb2gray(imread('image018.jpg'));
y1 =3 ;
x1 = 119 ;
y2 = 287;
x2= 252 ;
imageOut_origin = image_origin(y1:y2, x1:x2, :);
imageOut_new = image_new(y1:y2, x1:x2, :);
[counts_old,X_old]=imhist(image_origin);
level = ostu_new(counts_old);
[counts_new,X_new]=imhist(image_new);
level = ostu_new(counts_new)
P = polyfit(X_old,counts_old,6); Y = polyval(P,X_old);
figure;
plot(X_old,counts_old);
hold on,plot(X_old,Y,'r');