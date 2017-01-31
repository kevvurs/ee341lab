% Kevin Caravaggio
% EE 341 Lab 1
% Ex1
% Compose a few bars of Scarborough Fair w/ ADSR envelopes.

% reset MatLab
clc;
clear all;
close all;

% Time vectors and sampling constant.
Fs = 8000;
t_quart = 0:1/Fs:0.5-1/Fs;
t_half = 0:1/Fs:1-1/Fs;
t_full = 0:1/Fs:2-1/Fs;

% Compose scarborough fair
a_full = mkNote(0,t_full);
a_half = mkNote(0,t_half);
a_quart = mkNote(0,t_quart);
e_quart = mkNote(7,t_quart);
b_quart = mkNote(2,t_quart);
c_quart = mkNote(3,t_quart);

% Play the sound
scarb = [a_half,a_quart,e_quart,e_quart,e_quart,b_quart,c_quart,b_quart,a_full];
sound(scarb, Fs);

% Depict the sound wave
figure;
plot(1:length(scarb),scarb);

% Persist .wav file:
% audiowrite('scarb_raw.wav',scarb,Fs);

fprintf('done\n');
% EOF