% Kevin Caravagio and Andrew Chan
% EE 341 LAB 0
% Ex1

% Reset
close all;
clear all;
clc;

% Create cos(200t)
Fs = 8000;
t = 0:1/Fs:5-1/Fs;
x = cos(2*pi*200*t);

% indexing vectors for discrete plotting 50 samples
x_plot = x(1:50);
t_plot = 1:50;

% plots
figure;
plot(t(1:50), x_plot);

figure;
stem(t_plot, x(1:50));

% Persist sound file:
% audiowrite('cosine.wav',100*x,Fs);
% sound(x,Fs);