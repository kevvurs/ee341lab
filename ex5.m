% kevin

% reset
clc;
clear all;
close all;


egg_trip = imgTrip('egg_g_min_avg.jpg');
%figure, imshow(egg_trip), title('tripling-')

egg_interp = imgInterp('egg_g_min_avg.jpg');
%figure, imshow(egg_interp), title('interpoled by fac. 3');

% Persist:
% imwrite(egg_trip, 'egg_trip.jpg');
% Persist:
% imwrite(egg_interp, 'egg_interp.jpg');

% UNIQUE IMAGE %
% scaling
pwrng_color = imread('power.jpg');
pwrng = rgb2gray(pwrng_color);
pwrng_min_avg = scalePro('pwrng_gray.jpg', 5);
pwrng_trip = imgTrip('pwrng_min_avg.jpg');
pwrng_interp = imgInterp('pwrng_min_avg.jpg');

% CONCAT SECTION %
pwrng_alpha = double(pwrng_interp);
pwrng_beta = double(rgb2gray(imread('pwrng1.jpg')));
pwrng_chi = double(rgb2gray(imread('pwrng2.jpg')));

% edging
% Sobel edge functions
h1 = [-1 0 1; -2 0 2; -1 0 1];
h2 = [1 2 1; 0 0 0; -1 -2 -1];
pwrng_m1= conv2(pwrng_beta,h1,'same');
pwrng_m2= conv2(pwrng_beta,h2,'same');
pwrng_beta = (pwrng_m1.^2 + pwrng_m2.^2).^0.5;

% Blurring
% blur 5x5
vect_struct = [ 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; ];
vect_scalar = 1/12;
hs = vect_scalar*vect_struct;
pwrng_chi = conv2(pwrng_chi,hs,'same');

% crop to size
minDim0 = min(min(size(pwrng_alpha, 1),size(pwrng_beta, 1)),size(pwrng_chi, 1));
minDim1 = min(min(size(pwrng_alpha, 2),size(pwrng_beta, 2)),size(pwrng_chi, 2));

pwrng_alpha = pwrng_alpha(1:minDim0, 1:minDim1);
pwrng_beta = pwrng_beta(1:minDim0, 1:minDim1);
pwrng_chi = pwrng_chi(1:minDim0, 1:minDim1);

pwrng_conc = [pwrng_alpha; pwrng_beta; pwrng_chi];

% Persist:
% imwrite(pwrng_trip, 'pwrng_trip.jpg');
% Persist:
% imwrite(pwrng_interp, 'pwrng_interp.jpg');
% Persist:
imwrite(uint8(pwrng_conc), 'pwrng_conc.jpg');

% Render
figure, imshow(pwrng), title('Original');
figure, imshow(pwrng_min_avg), title('Scaled down');
figure, imshow(pwrng_trip), title('Scaled up (tripling)');
figure, imshow(pwrng_interp), title('Scaled up (interpolation)');
figure, imshow(uint8(pwrng_conc)), title('Sequence');

fprintf('done\n');
%EOF