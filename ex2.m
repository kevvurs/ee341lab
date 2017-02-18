% kevin

% reset
clc;
clear all;
close all;

% constants
Fs = 8000;
Wc = 0.3;
P = [ones(1,20) zeros(1,40)];

% load resource
S = load('microsoftstock.txt');
len_S = 1:length(S);
[M,Ms] = audioread('music.wav');

% FIR/IIR
V = zeros(1,11); V(1) = 1;
A = fir1(10, Wc);
B = butter(10, Wc,'high');

Y1 = filter(A,1,S);
Y2 = filter(B,1,S);

Y3 = filter(A,1,P);
Y4 = filter(B,1,P);

Y5 = filter(A,1,M);
Y6 = filter(B,1,M);

% render
figure,impz(A,V),title('Finite Impulse Response (FIR)');
figure,freqz(A,1),title('FIR Frequency Response');

figure,impz(B,V),title('Infinite Impulse Response (IIR)');
figure,freqz(B,1),title('IIR Frequency Response');

figure;
subplot(2,3,1),plot(1:length(Y1), Y1),title('Stock Data Filtered by FIR');
subplot(2,3,2),plot(1:length(Y2), Y2),title('Stock Data Filtered by IIR');
subplot(2,3,3),plot(1:length(Y3), Y3),title('Pulse_2_0 Filtered by FIR');
subplot(2,3,4),plot(1:length(Y4), Y4),title('Pulse_2_0 Filtered by IIR');
subplot(2,3,5),plot(1:length(Y5), Y5),title('music Filtered by FIR');
subplot(2,3,6),plot(1:length(Y6), Y6),title('music Filtered by IIR');

% Persist files:
% audiowrite('FIR-music.wav',Y5,Ms);
% audiowrite('IIR-music.wav',Y6,Ms);

fprintf('done\n');
% EOF