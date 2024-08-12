%% Test Rx Modulator full implementation with:
% - Frequency Downshift
% - Decimator
% - OFDM demodulator
% - Constellation descrambler
% - QAM demodulation (with LLR)
% - Output datais formmated to have 4 bits, to be stored 

% TODO: check that this blocks has a significant error from the reference
% model, probably beacuse of the quantization of the ofdm demodulator
% block.
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
parametersFile = "sampleParametersFile";
msgQtty = 2;
delayIn = 5000;
SNR = 60;
frequencyOffsetIn = 15e3;

pBitsIn = logical(randi([0,1], payloadBitsPerBlock0*2, msgQtty));
psduSizeLSB = zeros(24, 1, msgQtty+1);
payloadBitsPerSubcarrierIn = zeros(3, 1);
payloadCyclicPrefixLenIn = zeros(3, 1);
simPayloadNumOFDMSymbols = zeros(3, 1); % Used only for testing
dataIn = [];
OFDMRx = cell(msgQtty, 1);
for i=1:1:msgQtty
    pBits = pBitsIn(:,i);
    OFDMSignal = fullTx(parametersFile, pBits, 0, false);
    OFDMRx{i} = channelSimulation(OFDMSignal, delayIn, SNR);
    
    % Get parameters from header
    run(parametersFile);
    psduSizeLSB(:, 1, i) = flip(psduSize);
    payloadBitsPerSubcarrierIn(i, 1) = payloadBitsPerSubcarrier;
    payloadCyclicPrefixLenIn(i, 1) = payloadCyclicPrefixLen;
    simPayloadNumOFDMSymbols(i, 1) = payloadNumOFDMSymbols;

    dataIn = [dataIn; OFDMRx{i};];
end

%% Expected Output
expectedHeaderOut = cell(msgQtty, 1);
for i=1:1:msgQtty
    OFDMRx{i} = downshifter(OFDMRx{i});
    OFDMRx{i} = decimator(OFDMRx{i});
    OFDMRx{i} = ofdmSymbolSync(OFDMRx{i});
    [OFDMRx{i}, channelEst] = ofdmChannelEstimation(OFDMRx{i});

    headerRx = OFDMRx{i}(1:headerOFDMSamples);
    headerRxLLR = ofdmDemodulate(headerRx, headerBitsPerSubcarrier, ...
        headerCyclicPrefixLen, nullIdx, headerScramblerInit, true, channelEst);
    expectedHeaderOut{i} = headerRxLLR;

    payloadRx = OFDMRx{i}(1+headerOFDMSamples:end);
    payloadRxLLR = ofdmDemodulate(payloadRx, payloadBitsPerSubcarrier, ...
        payloadCyclicPrefixLen, nullIdx, payloadScramblerInit, true, channelEst);

    for j=1:1:simPayloadNumOFDMSymbols(i, 1)
        expectedPayloadOut{j, i} = payloadRxLLR(1+numDataCarriers*payloadBitsPerSubcarrier*(j-1): ...
            numDataCarriers*payloadBitsPerSubcarrier*j);
    end
end
expectedPayloadOut = expectedPayloadOut(:);

%% Simulation Time
latency = 1000000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/fs + latency;
totalOFDMSymbols = sum(simPayloadNumOFDMSymbols);

%% Run the simulation
model_name = "HDLRxDemodulator";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");

startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

startOut1 = get(simOut, "startOut1");
endOut1 = get(simOut, "endOut1");
validOut1 = get(simOut, "validOut1");

%% Test for reception of header
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), "No start signal");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Length of start and end should be the same.");
assert(isequal(length(startIdx), msgQtty), ...
    "Amount of headers should be equal at the amount of messages.")

for i=1:length(startIdx)
    out = dataOut(startIdx(i):endIdx(i), end-headerBitsPerSubcarrier+1:end);
    out = out.';
    headerOut = out(:);
    assert(iskindaequal(expectedHeaderOut{i}, headerOut, 5), "Header mismatch");
end
disp("Header was received correctly!");

%% Test for reception of payload
startIdx1 = find(startOut1 == true);
endIdx1 = find(endOut1 == true);

assert(isequal(length(startIdx1), length(endIdx1)), ...
    "Length of start and end should be the same.");
assert(~isempty(startIdx1), "No start signal");

for i=1:1:totalOFDMSymbols
    out = dataOut(startIdx1(i):endIdx1(i), end-payloadBitsPerSubcarrier+1:end);
    out = out.';
    out = out(:);
    assert(iskindaequal(expectedPayloadOut{i}, out, 5), "Payload mismatch");
end

%% Plotting
t = (0:1/fs:length(expectedHeaderOut{1})/fs-1/fs)';

figure();
subplot(2,1,1)
plot(t, headerOut, t, expectedHeaderOut{1});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(headerOut - expectedHeaderOut{1}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

figure();
subplot(2,1,1)
plot(t, out, t, expectedPayloadOut{i});
legend("Out", "ExpectedOut");
xlabel("n [samples]");
xlim([t(1), t(end)]);
grid on;

subplot(2,1,2)
plot(t, abs(out - expectedPayloadOut{i}));
xlabel("n [samples]");
title("|out - expectedOut|");
xlim([t(1), t(end)]);
grid on;

disp("Test successfull!");



