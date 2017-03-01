% kevin

% reset
clc;
clear all;
close all;

% resources
[M,Ms] = audioread('flute-short.wav');

% x[n] =1+ cos(2? fn);0 ? n ?127
n = 0:127;
f = [0.25 0.50 0.26];
x1 = 1 + cos(2*pi * f(1) * n);
x2 = 1 + cos(2*pi * f(2) * n);

% Transforms:
y1 = fft(x1);
y1_mag = abs(y1);
y1_phase = angle(y1);

y1_shift = fftshift(fft(x1));
y1_shift_mag = abs(y1_shift);
y1_shift_phase = angle(y1_shift);

y2 = fft(x2);
y2_mag = abs(y2);
y2_phase = angle(y2);

y2_shift = fftshift(fft(x2));
y2_shift_mag = abs(y2_shift);
y2_shift_phase = angle(y2_shift);

N1 = length(n);
w_period = 1/N1;
w = (-N1/2:(N1/2)-1)*w_period;

N3 = [32 128 512];
x3 = 1 + cos(2*pi * f(3) * n);
y3_1 = abs(fftshift(fft(x3, N3(1))));
y3_2 = abs(fftshift(fft(x3, N3(2))));
y3_3 = abs(fftshift(fft(x3, N3(3))));
w_periods = [1/N3(1) 1/N3(2) 1/N3(3)];
w3_1 = (-N3(1)/2:(N3(1)/2)-1)*w_periods(1);
w3_2 = (-N3(2)/2:(N3(2)/2)-1)*w_periods(2);
w3_3 = (-N3(3)/2:(N3(3)/2)-1)*w_periods(3);

M_trans = abs(fftshift(fft(M,Ms)));
wM_period = 1/Ms;
wM = ((-Ms/2):(Ms/2)-1) * wM_period;

[maximum, index] = max(M_trans);
note_in_hertz = Ms * abs(wM(index)) * 2

figure;
subplot(2,2,1),stem(w,y1_mag),title('X(w) when f = 0.25'),xlabel('freq(norm)');
subplot(2,2,2),stem(w,y2_mag,'r'),title('X(w) when f = 0.50'),xlabel('freq(norm)');
subplot(2,2,3),stem(w,y1_shift_mag),title('shifted X(w) when f = 0.25'),xlabel('freq(norm)');
subplot(2,2,4),stem(w,y2_shift_mag,'r'),title('shifted X(w) when f = 0.50'),xlabel('freq(norm)');

figure;
subplot(3,1,1),stem(w3_1,y3_1),title('X(w),f=0.26,N=32'),xlabel('freq(norm)');
subplot(3,1,2),stem(w3_2,y3_2),title('X(w),f=0.26,N=128'),xlabel('freq(norm)');
subplot(3,1,3),stem(w3_3,y3_3),title('X(w),f=0.26,N=512'),xlabel('freq(norm)');

figure;
plot(wM, 20*log10(M_trans)),title('Flute note'),xlabel('normalized freq.'),ylabel('log magn.');

fprintf('done\n')