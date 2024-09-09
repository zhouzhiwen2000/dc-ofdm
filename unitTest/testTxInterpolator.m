%% Test Tx interpolator
clc; clear; close all;
addpath("../src");
addpath("../src/rx");
addpath("../inc");
constants;

%% Test cases
% Size of the header after FEC encoding
fc = 5e6;
symbolNumber = 10;

t = (0 : 1/CONST.fPHY : symbolNumber/fc - 1/CONST.fPHY)';
input = sin(2*pi*fc*t);

out = txInterpolator(CONST, input);
resample_out = resample(input, CONST.txL, 1);

%% Plot
%%% Use this plotting when the amount of samples of the input and output
%%% don't match
% plot(out);
% hold on;
% plot(resample_out);

n_in  = 1:CONST.txL:length(out);
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
plot(n_in, abs(input - out(1:CONST.txL:end)));
title("Error between input and decimated");
grid on;

assert(iskindaequal(out, resample_out, 20e-3), ...
    "Resampled and intepolated signals should be equal");
disp("Test successfull!")
