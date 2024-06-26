%% Test Interpolator
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Inputs
fc = 5e6;                           % Carrier frequency for sinusoidal function
t = (0:1/fPHY:N/fPHY-1/fPHY)';      % Time vector is equal to "N" ofdm samples

% OFDM output is a senoidal function
% Add "zeros" to the function to compensate for the delay of the FIR filter
dataSymbols = cos(2*pi*fc*t);

validIn = true(length(t), 1);

%% Simulation Time
latency = 200/fs;         % Algorithm latency. Delay between input and output
stopTime = 2*(length(validIn)-1)/fs + latency;

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

t_up = (0:1/fs:N/fPHY-1/fs)';       % Time vector for upsampled signal

expectedOut = interpolator(dataSymbols);

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 1e-3), "OFDM output is not the same");
   
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plot signals
resampledOut = resample(dataSymbols(1:N), 2, 1);

figure();
subplot(3,1,1)
plot(t*1e6, dataSymbols(1:N), t_up*1e6, expectedOut, t_up*1e6, resampledOut);
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
xlim([t_up(1), t_up(end)]);
grid on;

assert(iskindaequal(expectedOut, resampledOut, 0.05), "resample function and interpolation should be similar");

disp("Test successfull!");
