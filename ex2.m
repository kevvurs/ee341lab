% Kevin Caravagio and Andrew Chan
% EE 341 LAB 0
% Ex2

% reset
close all;
clear all;
clc;

% Load cat sound
[y,Fs]=audioread('cat.wav');
t = 0:1/Fs:length(y)-1/Fs;

% Play sound:
% sound(y,Fs);


% plotting samples
y_plot = y(1:50);
t_plot = 1:50;

% render plots
figure;
plot(t(1:50),y_plot);

figure;
stem(t_plot,y_plot);