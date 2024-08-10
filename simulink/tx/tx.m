%% Transmitter
% This file contains a fully functional transmitter.

clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;

%% Input
paramFile = "sampleParametersFile";
msgIn = ['This is an example message used to test the transmitter. ' ...
    'It is made large on purpose to test for a large message being ' ...
    'transmitted'];
pBits = str2binl(msgIn);
pBits = getPayloadParamsFromBits(pBits);
pWords = binl2str(pBits);

validIn = true(length(pWords), 1);
newFrame = logical([1; 0]);

[reg0, reg1, reg2, reg3] = param2regs("parameters", pBits);

%% Expected Output
[expectedOut, ~, payloadOFDMSymbols] = fullTx(paramFile, binl2tx(pBits), 0, false);

%% Simulation Time
latency = 10000000/fs;             % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/(fs) + latency;

%% Run the simulation
model_name = "HDLTx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

dataOut1 = get(simOut, "dataOut1");
startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

%% Payload is well formed
startIdx = find(startOut1 == true);
endIdx = find(endOut1 == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

if (isempty(startIdx))
    warning("No payload was detected (this might be intentional)");
end

for i=1:length(startIdx)
    out = dataOut1(startIdx(i):endIdx(i));
    valid = validOut1(startIdx(1):endIdx(1));
    out = out(valid == true);
    assert(isequal(payloadOFDMSymbols(:), out), "Outputs don't match");
end

disp("Payload is well formed!")

%% Compare with MATLAB reference algorithm
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");

assert(~isempty(startIdx), "No start signal");

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i));
    assert(iskindaequal(expectedOut, out, 1e-3), "Outputs don't match");
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
t = (0:1/fs:length(expectedOut)/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t*1e6, out, t*1e6, expectedOut);
legend("Out", "ExpectedOut");
xlabel("t [useg]");
xlim([min(t), max(t)]*1e6);
grid on;

subplot(2,1,2)
plot(t*1e6, abs(out - expectedOut));
xlabel("t [useg]");
title("|out - expectedOut|");
xlim([min(t), max(t)]*1e6);
grid on;

figure();
resampledOut = resample(out, 2, 1);
[psd, fVector] = pwelch(resampledOut, rectwin(length(resampledOut)), [], 2^16, 2*fs, "centered");
plot(fVector/1e6, 10*log10(psd));
title("PSD of the transmitted signal")
xlabel("Freq. [MHz]");
ylabel("PSD [dB/Hz]");
grid on;

disp("Test successfull!");
