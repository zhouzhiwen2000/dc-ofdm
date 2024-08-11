%% Test QAM Demod
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
delay = zeros(100,1);
SNR = 20;
dataSize = 200;

M = [1 2 4];

bitsPerSubcarrier = [
    ones(dataSize, 1)*M(1);
    delay;
    ones(dataSize,1)*M(2);
    delay;
    ones(dataSize,1)*M(3);
];

validIn = logical(bitsPerSubcarrier);

input = zeros(dataSize, length(M));
dataSymbols = zeros(size(input));
for i=1:1:length(M)
    input(:,i) = randi([0, 2^M(i)-1], dataSize, 1);

    switch M(i)
        case 1
            dataSymbols(:,i) = pskmod(input(:,i), 2^M(i), PlotConstellation=false, InputType='integer');
            dataSymbols(:,i) = awgn(dataSymbols(:,i), SNR);
            expectedOut{i} = pskdemod(dataSymbols(:,i), 2^M(i), OutputType='approxllr');
        case 2
            qamConstellation = qamTwoBits;
            dataSymbols(:,i) = qammod(input(:,i), 2^M(i), qamConstellation, UnitAveragePower=true, PlotConstellation=false, InputType='integer');
            dataSymbols(:,i) = awgn(dataSymbols(:,i), SNR);
            expectedOut{i} = qamdemod(dataSymbols(:,i), 2^M(i), qamConstellation, UnitAveragePower=true, PlotConstellation=false, outputType='approxllr');
        case 4
            qamConstellation = qamFourBits;
            dataSymbols(:,i) = qammod(input(:,i), 2^M(i), qamConstellation, UnitAveragePower=true, PlotConstellation=false, InputType='integer');
            dataSymbols(:,i) = awgn(dataSymbols(:,i), SNR);
            expectedOut{i} = qamdemod(dataSymbols(:,i), 2^M(i), qamConstellation, UnitAveragePower=true, PlotConstellation=false, outputType='approxllr');
        otherwise
            error("Unssuported QAM modulation order");
    end
end

dataSymbols = [
  dataSymbols(:, 1);
  delay;
  dataSymbols(:, 2);
  delay;
  dataSymbols(:, 3);
];

%% Simulation Time
latency = 300/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/fs + latency;

%% Run the simulation
model_name = "HDLQAMDemod";

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

for i=1:1:length(M)
    out = dataOut(startIdx(i):endIdx(i), end-M(i)+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedOut{i}, out, 5e-3));
    assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
end

%% Plotting
n = 1:1:length(out);

figure();
subplot(2,1,1)
plot(n, abs(out), n, abs(expectedOut{end}));
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([n(1), n(end)]);
grid on;

subplot(2,1,2)
plot(n, abs(out - expectedOut{end}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([n(1), n(end)]);
grid on;

disp("Test successfull!");
