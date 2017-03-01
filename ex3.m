% kevin

% reset
clc;
clear all;
close all;

% resources
[M,Ms] = audioread('flute-short.wav');
M_trans = fftshift(fft(M,256));

% vars
f1 = 0.15;
n = 0:255;
N = length(n);
w_p = 1/N;
w = ((-N/2):(N/2)-1) * w_p;

% estimation?
x1 = sinc(f1 .* (n - 32));
X1 = fftshift(fft(x1, N));
X1_mag = abs(X1);
X1_phase = angle(X1);
h1 = ifft(X1);

% ideal LPF
P = 256;
m = (-0.5:1/P:0.5-1/P);
HI = zeros(1,256);
p1 = round((P/2*(1+0.15)));
p2 = round((P/2*(1-0.15)));
HI(p2:p1) = 1;
hI = ifft(HI,256);
HI_mag = abs(HI);
HI_phase = angle(HI);

hf = fir1(10,.15,'low');
dirac = zeros(1,256);
dirac(1) = 1;
hf2 = filter(hf, 1, dirac);
Hf2 = fftshift(fft(hf2));
Hf2_mag = abs(Hf2);
Hf2_phase = angle(Hf2);

% FLUTE Section %
%wM_period = 1/Ms;
%wM = ((-Ms/2):(Ms/2)-1) * wM_period;

M1 = conv(x1, M, 'full');
M2 = filter(hf, 1, M);
M3 = M .* HI;

PI = length(M);
mI = (-0.5:1/PI:0.5-1/P);
HII = zeros(PI,1);
p1I = round((PI/2*(1+0.15)));
p2I = round((PI/2*(1-0.15)));
HII(p2I:p1I) = 1;

M4 = M .* HII;

% transforms
K = 512;
w_k = Ms/K; % Hz
k = ((-K/2):(K/2)-1) * w_k;

M_f = fftshift(fft(M,K));
M1_f = fftshift(fft(M1,K));
M2_f = fftshift(fft(M2,K));
M3_f = fftshift(fft(M3,K));

M_mag = 20*log10(abs(M_f));
M1_mag = 20*log10(abs(M1_f));
M2_mag = 20*log10(abs(M2_f));
M3_mag = 20*log10(abs(M3_f));
M1_ph = angle(M1_f);
M2_ph = angle(M2_f);
M3_ph = angle(M3_f);
figure;
subplot(3,1,1),plot(n, abs(hI)),title('IFFT: h_I'),xlim([0,255]),ylim([-f1 f1]);
subplot(3,1,2),plot(n, x1),title('x_1'),xlim([0,255]),ylim([-1 1]);
subplot(3,1,3),plot(n, hf2),title('h_f'),xlim([0,255]),ylim([-.22 .22]);

figure;
subplot(3,2,1),plot(w, HI_mag),title('H_I(w) magn');
subplot(3,2,2),plot(w, HI_phase),title('H_I(w) phase');
subplot(3,2,3),plot(w, X1_mag),title('X_1(w) magn');
subplot(3,2,4),plot(w, X1_phase),title('X_1(w) phase');
subplot(3,2,5),plot(w, Hf2_mag),title('H_f(w) magn');
subplot(3,2,6),plot(w, Hf2_phase),title('H_f(w) phase');
xl = 2000;
figure;
subplot(2,2,1),plot(k, M_mag,'r'),title('original'),xlim([-xl xl]),ylabel('log-magn');
subplot(2,2,2),plot(k, M1_mag,'b'),title('filtered with x_1'),xlim([-xl xl]),ylabel('log-magn');
subplot(2,2,3),plot(k, M2_mag,'b'),title('filtered with FIR'),xlim([-xl xl]),ylabel('log-magn');
subplot(2,2,4),plot(k, M3_mag,'b'),title('filtered w/ "ideal"'),xlim([-xl xl]),ylabel('log-magn');

% figure;
% subplot(2,1,1),plot(w, X1_mag),title('DTFT- H(w): magn.'),xlabel('norm. freq.'),ylabel('magnitude');
% subplot(2,1,2),plot(n, h1),title('IFFT- h(n)'),xlabel('n'),ylabel('h(n)'),xlim([50 250]);

% figure;
% plot(m,HI),xlim([-.5 .5]),ylim([0,1.5]);
M4 = abs(ifft(M4));
%audiowrite('flute1.wav',M1,Ms);
%audiowrite('flute2.wav',M2,Ms);
%audiowrite('flute3.wav',M4,Ms);
fprintf('done\n')
% EOF