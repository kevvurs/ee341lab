% Kevin Caravaggio
% EE 341 Lab 1
% Ex2
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

% Generate envelopes of differing lengths.
adsr_quart = mkEnvelope(1, Fs);
adsr_half = mkEnvelope(2, Fs);
adsr_full = mkEnvelope(4, Fs);

% Compose scarborough fair with modulations.
a_full = mkNote(0,t_full).*adsr_full;

a_half = mkNote(0,t_half).*adsr_half;
a_quart = mkNote(0,t_quart).*adsr_quart;
e_quart = mkNote(7,t_quart).*adsr_quart;
b_quart = mkNote(2,t_quart).*adsr_quart;
c_quart = mkNote(3,t_quart).*adsr_quart;

% Play the sound
scarb = [a_half,a_quart,e_quart,e_quart,e_quart,b_quart,c_quart,b_quart,a_full];
sound(scarb, Fs);

% Depict the sound wave
figure;
plot(1:length(scarb),scarb);

% This block will render the ADSR signals for viewing.
% figure;
% subplot(3,1,1), plot(t_quart, adsr_quart), title('ADSR 1/4 note');
% subplot(3,1,2), plot(t_half, adsr_half), title('ADSR 1/2 note');
% subplot(3,1,3), plot(t_full, adsr_full), title('ADSR 1 note');


% Persist .wav file:
% audiowrite('scarb_mastered.wav',scarb,Fs);

fprintf('done\n');
% EOF