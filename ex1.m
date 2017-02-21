% kevin

% reset
clc;
clear all;
close all;

% load resource
S = load('microsoftstock.txt');
len_S = 1:length(S);

b = ones(30, 1);
a = [30; zeros(29, 1)];
y1 = filter(b,a,S);
len_y1 = 1:length(y1);

h = filter(b,a,[1; zeros(29, 1)]);
y2 = conv(S,h,'same');
y2 = y2(1:length(y2)-30);
len_y2 = 1:length(y2);

% first diff filter- % 
c = [1 0];
d = [1 -1];
y3 = filter(d,c,S);
len_y3 = 1:length(y3);

% render
figure;
plot(len_S, S), title('Microsoft Stock');

figure;
subplot(2,1,1), plot(len_y1, y1), ylim([0,50]), xlim([30 length(y1)]), title('Moving Av. (filter)');
subplot(2,1,2), plot(len_y2, y2), ylim([0,50]), xlim([30 length(y2)]), title('Moving Av. (conv)');

figure; hold on;
plot(len_S, S, 'blue');
plot(len_y1, y1, 'red');
title('Microsoft Stock');
xlim([30 length(y1)]);


figure;
plot(len_y3, y3), title('Stock w/ First Difference filter');

figure;
freqz(d,c),title('First difference frequency response');
figure;
freqz(b,a),title('Moving avrg frequency response');

fprintf('done\n');
% EOF