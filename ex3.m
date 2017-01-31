% Kevin Caravagio and Andrew Chan
% EE 341 LAB 0
% Ex3

% Reset MatLab
close all;
clear all;
clc;

% Load the cat sound and modulate it
[y,Fs]=audioread('cat.wav');
y1 = y;
y2 = 0.25*y;
y3 = 0.50*y;

% concatenate the sounds into a signal
delay = zeros(Fs,1);
z = [y1;delay;y2;delay;y3;delay;y3;delay;y2;delay;y3;delay;y2;delay;y3;delay;y2;delay;y3;delay;y2;delay;y3;delay;y2;delay;y3;delay;y2;delay;y3];

% Play sound:
% sound(z,Fs);

% plot the signal
t = (1:length(z))/Fs;
figure;
plot(t,z);

% Persist .wav file:
% audiowrite('meowMeow.wav',z,Fs);