% kevin

% reset
clc;
clear all;
close all;

% load resources
wanda = imread('wanda_g.jpg');
egg = imread('egg_g.jpg');

% Sobel edge functions
h1 = [-1 0 1; -2 0 2; -1 0 1];
h2 = [1 2 1; 0 0 0; -1 -2 -1];

% convolve
wanda_alt = double(wanda);
wanda_m1= conv2(wanda_alt,h1,'same');
wanda_m2= conv2(wanda_alt,h2,'same');
wanda_fx = (wanda_m1.^2 + wanda_m2.^2).^0.5;
egg_alt = double(egg);
egg_m1= conv2(egg_alt,h1,'same');
egg_m2= conv2(egg_alt,h2,'same');
egg_fx = (egg_m1.^2 + egg_m2.^2).^0.5;

% render
% figure, imshow(uint8(wanda_fx)), title('Edge detect');
% figure, imshow(wanda);
% figure, imshow(uint8(egg_fx)), title('Edge detect');
% figure, imshow(egg);

% Persist files:
% imwrite(uint8(abs(egg_m1)),'egg_m1mag.jpg');
% imwrite(uint8(abs(egg_m2)),'egg_m2mag.jpg');
% imwrite(uint8(egg_fx),'egg_ovrgrad.jpg');

% unique img:
pwrng_color = imread('power.jpg');
pwrng = rgb2gray(pwrng_color);
pwrng_alt = double(pwrng);
pwrng_m1= conv2(pwrng_alt,h1,'same');
pwrng_m2= conv2(pwrng_alt,h2,'same');
pwrng_fx = (pwrng_m1.^2 + pwrng_m2.^2).^0.5;

figure, imshow(pwrng), title('Original');
figure, imshow(uint8(pwrng_fx)), title('Edge detection');



fprintf('done\n');
%EOF