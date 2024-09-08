%% Test Tx interpolator
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
fc = 5e6;
symbolNumber = 10;

t = (0:1/fADC:symbolNumber/fc-1/fADC)';
input = sin(2*pi*fc*t);

out = rxInterpolator(input);
resample_out = resample(input,rxL,1);

%% Plot
%%% Use this plotting when the amount of samples of the input and output
%%% don't match
plot(out);
hold on;
plot(resample_out);

n_in  = 1:rxL:length(out);
n_out = 1:1:length(out);

figure();
subplot(3,1,1);
plot(n_in, input, n_out, resample_out, n_out, out);
title("Signals")
legend("Input", "Resampled", "Decimated");
grid on;

subplot(3,1,2);
plot(n_out, abs(resample_out - out));
title("Error between resample and decimation");
grid on;

subplot(3,1,3);
plot(n_in, abs(input - out(1:rxL:end)));
title("Error between input and decimated");
grid on;
