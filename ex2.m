% kevin

% reset
clc;
clear all;
close all;

% constants
Fs = 44100;
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

% Transforms:
N = 22500;
Y5_fft = fftshift(fft(Y5, N));
Y5_fft_abs = abs(Y5_fft);
Y6_fft = fftshift(fft(Y6, N));
Y6_fft_abs = abs(Y6_fft);
w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

figure;
subplot(3,2,1),plot(1:length(Y1), Y1),title('Stock Data Filtered by FIR'), xlabel('time'), ylabel('money');
subplot(3,2,2),plot(1:length(Y2), Y2),title('Stock Data Filtered by IIR'), xlabel('time'), ylabel('money');
subplot(3,2,3),plot(1:length(Y3), Y3),title('Pulse_2_0 Filtered by FIR'), xlabel('time'), ylabel('value');
subplot(3,2,4),plot(1:length(Y4), Y4),title('Pulse_2_0 Filtered by IIR'), xlabel('time'), ylabel('value');
subplot(3,2,5),plot(w, Y5_fft_abs),title('music Filtered by FIR'), xlabel('freq.'), ylabel('magnitude');
subplot(3,2,6),plot(w, Y6_fft_abs),title('music Filtered by IIR'), xlabel('freq.'), ylabel('magnitude');

% Persist files:
% audiowrite('FIR-music.wav',Y5,Ms);
% audiowrite('IIR-music.wav',Y6,Ms);

fprintf('done\n');
% EOF