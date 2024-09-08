%% Test Interpolator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
t = (0:1/fPHY:(N+headerCyclicPrefixLen)/fPHY-1/fPHY)';      % Time vector is equal to "N" ofdm samples
t_up = (0:1/(fPHY*txL):(N+headerCyclicPrefixLen)/fPHY-1/(fPHY*txL))';       % Time vector for upsampled signal

% OFDM output is a senoidal function
fc = 5e6;                           % Carrier frequency for sinusoidal function
dataSymbols = cos(2*pi*fc*t);
validIn = true(length(t), 1);

% OFDM output is an actual OFDM symbol
% dataSymbols = rand(numDataCarriers, 1) + 1i*rand(numDataCarriers, 1);
% dataSymbols = ofdmmod(dataSymbols, N, headerCyclicPrefixLen, nullIdx);
% validIn = true(length(dataSymbols), 1);

expectedOut = txInterpolator(dataSymbols);

%% Simulation Time
latency = 2000/(fPHY*txL);         % Algorithm latency. Delay between input and output
stopTime = 2*(length(validIn)-1)/(fPHY*txL) + latency;

%% Run the simulation
model_name = "HDLInterpolator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 1e-3), "OFDM output is not the same");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plot signals
resampledOut = resample(dataSymbols, txL, 1);

figure();
subplot(3,1,1)
plot(t*1e6, abs(dataSymbols), t_up*1e6, abs(expectedOut), t_up*1e6, abs(resampledOut));
xlabel("Time [useg]");
legend("Input", "Interpolated", "Resampled");
xlim([min(t_up), max(t_up)]*1e6);

subplot(3,1,2);
plot(t_up*1e6, abs(expectedOut-resampledOut));
xlabel("Time [useg]");
title("Error between interpolation FIR filter and resample FIR filter")
xlim([min(t_up), max(t_up)]*1e6);

subplot(3,1,3)
plot(t_up*1e6, abs(out - expectedOut));
xlabel("Time [useg]");
title("|out - expectedOut|");
xlim([min(t_up), max(t_up)]*1e6);
grid on;

assert(iskindaequal(expectedOut, resampledOut, 0.1), "resample function and interpolation should be similar");

disp("Test successfull!");
