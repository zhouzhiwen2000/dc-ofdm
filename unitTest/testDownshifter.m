%% Test Downshifter
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
% Size of the header after FEC encoding
fs = 100e3;
fc = 1e3;
symbolNumber = 10;

t = (0:1/fs:symbolNumber/fc-1/fs)';
input = sin(2*pi*fc*t) + 1i*cos(2*pi*fc*t);

out = downshifter(upshifter(input));

expectedOut = input();

%% Perform tests
assert(iskindaequal(expectedOut(lpfDelay+1:end-lpfDelay), out(lpfDelay+1:end-lpfDelay), 1e-3));

%% Plot
figure();
plot(abs(real(out) - real(expectedOut)));

figure();
plot(abs(imag(out) - imag(expectedOut)));

figure();
plot(real(input));
hold on;
plot(real(out));

figure();
plot(imag(input));
hold on;
plot(imag(out));

disp("Test successful!");
