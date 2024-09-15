%% Test Tx Decimator
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
fIn = CONST.fADC;
fc = 5e6;
symbolNumber = 10;

t = (0:1/fIn:symbolNumber/fc-1/fIn)';
input = sin(2*pi*fc*t);

out = rxDecimator(CONST, input);
resample_out = resample(input, 1, CONST.rxM);

n = 1:1:length(input);
n_down = 1 : CONST.rxM : CONST.rxM*length(resample_out);
n_dec = (1 : CONST.rxM : CONST.rxM*length(out))';

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
plot(n_down, abs(input(1:CONST.rxM:end) - out));
title("Error between input and decimated");
grid on;
