% kevin

% reset
clc;
clear all;
close all;

% resources
[M,Ms] = audioread('music.wav');

M_alt = equaliz(M,3,3,6,3); %12,18,-6,-6
sound(M_alt(length(M_alt)/2:length(M_alt)),Ms);

% Persist files:
% audiowrite('music_boost.wav',M_alt,Ms);

fprintf('done\n');
% EOF