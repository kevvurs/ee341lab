% kevin

% reset
clc;
clear all;
close all;

% load resources
wanda = imread('wanda_g.jpg');
egg = imread('egg_g.jpg');

% i, ii & iii, respectively
wanda_rev = fliplr(wanda);
wanda_flip = flipud(wanda);
wanda_mirror = fliplr(flipud(wanda));

% render
figure, imshow(wanda_rev); % H-flip
figure, imshow(wanda_flip); % V-flip
figure, imshow(wanda_mirror); % Both

fprintf('done\n');
%EOF