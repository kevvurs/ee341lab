% kevin

% reset
clc;
clear all;
close all;

Fs = 44100;

% resources
[M,Ms] = audioread('music.wav');

M_alt = equaliz(M,0,3,12,3);
% sound(M_alt(length(M_alt)/2:length(M_alt)),Ms);

% Transforms:
N = 22500;
M_alt_fft = fftshift(fft(M_alt, N));
M_alt_fft_abs = abs(M_alt_fft);
M_fft = fftshift(fft(M, N));
M_fft_abs = abs(M_fft);
w_period = Fs/N;
w = (-N/2:(N/2)-1)*w_period;

% Render:
figure;
subplot(2,2,1), plot(w, M_fft_abs), title('orignal sound'),
    xlabel('freq (HZ)'), ylabel('magn.'), xlim([-20000, 20000]);
subplot(2,2,2), plot(w, M_alt_fft_abs), title('filtered sound'),
    xlabel('freq (HZ)'), ylabel('magn.'), xlim([-20000, 20000]);
subplot(2,2,3), plot(w, M_fft_abs), title('vocal range- original'),
    xlabel('freq (HZ)'), ylabel('magn.'), xlim([4000, 8000]);
subplot(2,2,4), plot(w, M_alt_fft_abs), title('vocal range- filter'),
    xlabel('freq (HZ)'), ylabel('magn.'), xlim([4000, 8000]);
% Persist files:
% audiowrite('music_boost.wav',M_alt,Ms);

fprintf('done\n');
% EOF