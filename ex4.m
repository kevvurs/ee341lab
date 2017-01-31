% Kevin Caravaggio
% EE 341 Lab 1
% Ex3
% Make a white noise oscillating wave sound of the ocean.

% reset MatLab
clc;
clear all;
close all;

% time and frequency variables.
[cat,Fs]=audioread('cat.wav');
[tiger,Fs_tiger]=audioread('tiger.wav');
t_tiger = 1:length(tiger);
t_cat = 1:length(cat);

% Make a signal to change and thin out some samples.
cat_ext = cat;
cat_ext(2:2:end) = [];
t_ext = 1:length(cat_ext);

% Modify sound with a new sample rate, a sinc filter, and decay.
w = pi/length(cat_ext);
filter = (sin(w*(t_ext))/w)';
decay = exp(-t_ext.*0.002)';
cat_mod = cat_ext .* filter .* decay .* .005;
Fs_mod = Fs/7;

% Play new sound
sound(cat_mod,Fs_mod);

% Persist .wav file:
% audiowrite('cat_mod.wav',cat_mod,round(Fs_mod));

% Render waveforms for review.
figure;
subplot(2,1,1),plot(t_ext,cat_mod),title('cat (mod)');
subplot(2,1,2),plot(t_tiger,tiger),title('tiger');

fprintf('done\n');
% EOF