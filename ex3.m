% Kevin Caravaggio
% EE 341 Lab 1
% Ex3
% Make a white noise oscillating wave sound of the ocean.

% reset MatLab
clc;
clear all;
close all;

% time and frequency variables.
Fs = 8000;
t = 0:1/Fs:10-1/Fs;
freq = pi/3;
decay_rate = .3;

% carrier and white noise signals.
carrier = cos(freq*t)';
noise = randn(length(t),1);
decay = exp(-t*decay_rate)';

% seaashell sound
ocean = carrier .* noise .* decay;
sound(ocean, Fs);

% Depict the sound wave
figure;
plot(1:length(ocean),ocean), title('Ocean noise');

% Persist .wav file:
% audiowrite('ocean.wav',ocean,Fs);

fprintf('done\n');
% EOF