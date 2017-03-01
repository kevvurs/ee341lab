% kevin

% reset
clc;
clear all;
close all;

f1 = 0.15;
n = 0:255;
N = length(n);
w_p = 1/N;
w = ((-N/2):(N/2)-1) * w_p;

% x [n] = sinc( f (n ? 32))
x1 = sinc(f1 .* (n - 32));
X1 = fftshift(fft(x1));
X1_mag = abs(X1);
X1_phase = angle(X1);

% x [n] = sinc( f (n ? 32))(?1)^n
x2 = sinc(f1 .* (n - 32)) .* (-1).^n;
X2 = fftshift(fft(x2));
X2_mag = abs(X2);
X2_phase = angle(X1);
% note (-1)^n = e^(-j*pi*k)

% x [n] = sinc( f (n ? 32))cos(2? f n) where 2 f = 0.2.
x3 = sinc(f1 .* (n - 32)) .* cos((2*pi*0.2) .* n);
X3 = fftshift(fft(x3));
X3_mag = abs(X3);
X3_phase = angle(X3);

figure;
subplot(2,1,1),plot(w, X1_mag),title('DTFT: sinc(f_1 (n - 32))'),xlabel('norm. freq.'),ylabel('magnitude');
subplot(2,1,2),plot(w, X1_phase),title('DTFT: sinc(f_1 (n - 32))'),xlabel('norm. freq.'),ylabel('phase');

figure;
subplot(2,1,1),plot(w, X2_mag),title('DTFT: sinc(f_1 (n - 32))(-1)^n'),xlabel('norm. freq.'),ylabel('magnitude');
subplot(2,1,2),plot(w, X2_phase),title('DTFT: sinc(f_1 (n - 32))(-1)^n'),xlabel('norm. freq.'),ylabel('phase');

figure;
subplot(2,1,1),plot(w, X3_mag),title('DTFT: sinc(f_1 (n - 32))cos(2pi*f_2 n)'),xlabel('norm. freq.'),ylabel('magnitude');
subplot(2,1,2),plot(w, X3_phase),title('DTFT: sinc(f_1 (n - 32))cos(2pi*f_2 n)'),xlabel('norm. freq.'),ylabel('phase');