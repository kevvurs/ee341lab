% kevin

% reset
clc;
clear all;
close all;

egg_min = scale('egg_g.jpg', 5);
% figure, imshow(egg_min), title('Scaled by midpoint.');

egg_min_avg = scalePro('egg_g.jpg', 5);
% figure, imshow(egg_min_avg), title('Scaled by avg.');

% Persist:
% imwrite(egg_min, 'egg_g_min.jpg');
% Persist:
% imwrite(egg_min_avg, 'egg_g_min_avg.jpg');

% UNIQUE IMAGE %
pwrng_color = imread('power.jpg');
pwrng = rgb2gray(pwrng_color);
imwrite(pwrng, 'pwrng_gray.jpg');
pwrng_min = scale('pwrng_gray.jpg', 5);
pwrng_min_avg = scalePro('pwrng_gray.jpg', 5);

figure, imshow(pwrng), title('Original');
figure, imshow(pwrng_min), title('Scaled by midpoint.');
figure, imshow(pwrng_min_avg), title('Scaled by avg.');

% Persist:
% imwrite(pwrng_min, 'pwrng_min.jpg');
% imwrite(pwrng_min_avg, 'pwrng_min_avg.jpg');

fprintf('done\n');
%EOF