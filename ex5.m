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
pwrng_color = imread('power.jpg');
pwrng = rgb2gray(pwrng_color);
pwrng_min_avg = scalePro('pwrng_gray.jpg', 5);
pwrng_trip = imgTrip('pwrng_min_avg.jpg');
pwrng_interp = imgInterp('pwrng_min_avg.jpg');

figure, imshow(pwrng), title('Original');
figure, imshow(pwrng_min_avg), title('Scaled down');
figure, imshow(pwrng_trip), title('Scaled up (tripling)');
figure, imshow(pwrng_interp), title('Scaled up (interpolation)');

fprintf('done\n');
%EOF