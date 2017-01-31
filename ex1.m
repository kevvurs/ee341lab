% kevin

% reset
clc;
clear all;
close all;

% load resources
wanda = imread('wanda_g.jpg');
egg = imread('egg_g.jpg');

% smoother 5x5
vect_struct = [ 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; ];
vect_scalar = 1/9;
hs = vect_scalar*vect_struct;

% convolve
wanda_alt = double(wanda);
wanda_fx = conv2(wanda_alt,hs,'same');
egg_alt = double(egg);
egg_fx1 = conv2(egg_alt,hs,'same');
egg_fx2 = conv2(egg_fx1,hs,'same');

% render
% figure, imshow(uint8(wanda_fx)), title('Convolved once with 1/9 factor');
% figure, imshow(wanda);
  figure, imshow(uint8(egg_fx2)), title('Convolved twice with 1/9 factor');
  figure, imshow(egg);

% Persist file:
% imwrite(uint8(wanda_fx),'wanda_blur.jpg');
% imwrite(uint8(egg_fx2),'egg_blur.jpg');

fprintf('done\n');
%EOF