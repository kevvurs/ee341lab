% kevin

% reset
clc;
clear all;
close all;

% STOCK IMAGES %

% load resources
wanda = imread('wanda_g.jpg');
egg = imread('egg_g.jpg');

% i, ii & iii, respectively
wanda_rev = fliplr(wanda);
wanda_flip = flipud(wanda);
wanda_mirror = fliplr(flipud(wanda));

% render
% figure, imshow(wanda_rev); % H-flip
% figure, imshow(wanda_flip); % V-flip
% figure, imshow(wanda_mirror); % Both

% UNIQUE IMAGE %
pwrng_color = imread('power.jpg');
pwrng = rgb2gray(pwrng_color);
pwrng_rev = fliplr(pwrng);
pwrng_flip = flipud(pwrng);
pwrng_mirror = fliplr(flipud(pwrng));

figure, imshow(pwrng), title('Original');
figure, imshow(pwrng_rev), title('H-flip'); % H-flip
figure, imshow(pwrng_flip), title('V-flip'); % V-flip
figure, imshow(pwrng_mirror), title('Both flips'); % Both


fprintf('done\n');
%EOF