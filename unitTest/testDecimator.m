%% Test decimator
% TODO the decimation filter works as intended.
% The problem is that a window should be added on the first and last
% samples, from the transmitter side.
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
% Size of the header after FEC encoding
fs = 100e6;
fc = 5e6;
symbolNumber = 10;

t = (0:1/fs:symbolNumber/fc-1/fs)';
input = sin(2*pi*fc*t);

out = decimator(input);
resample_out = resample(input,1,2);

n = 0:1:length(input)-1;
n_down = 0:2:2*length(resample_out)-1;
n_dec = (0:2:2*length(out)-1)';

%% Plot
figure();
subplot(3,1,1);
plot(n, input, n_down, resample_out, n_dec, out);
title("Signals")
legend("Input", "Resampled", "Decimated");
grid on;

subplot(3,1,2);
plot(n_down, abs(resample_out - out));
title("Error between resample and decimation");
grid on;

subplot(3,1,3);
plot(n_down, abs(input(1:2:end) - out));
title("Error between input and decimated");
grid on;
