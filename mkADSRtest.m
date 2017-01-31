% kevin

% reset
clc;
clear all;
close all;

x = mkADSR(1, Fs);
figure;
plot(0:length(x),x)