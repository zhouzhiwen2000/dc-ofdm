%% Transmitter
% This file contains a fully functional transmitter.

clc; clear; close all;
addpath("../../src");
addpath("../../inc");
constants;
parameters;

%% Input

% Create databits, as a matrix with 8 columns (each row is a char), and
% then transform to chars.
if(payloadLenInFecBlocks ~= 0)
    dataBits = logical(randi([0 1], payloadLenInBits, 1));
    dataBitsMat = reshape(dataBits, axiWidth, payloadLenInWords)';
    dataChars = uint8(zeros(payloadLenInWords, 1));
    for i = 1:payloadLenInWords
        dataChars(i) = uint8(binl2dec(dataBitsMat(i,:)));
    end
    validIn = true(size(dataBits));
else
    validIn = false;
    dataBits = 0;
    dataChars = [0 0];
end

[reg0, reg1, reg2, reg3] = param2regs("parameters", false);
newFrame = logical([1; 0]);

%% Expected Output
h = headerGenerate(psduSize, messageDuration, blockSize, fecRate, repetitionNumber, ...
    fecConcatenationFactor, scramblerInitialization, batId, cyclicPrefixId, ...
    explicitMimoPilotSymbolCombSpacing, explicitMimoPilotSymbolNumber);
h = headerScrambler(h);
h = LDPCEncoder(h, 0, 0, true);
headerOFDMSymbols = headerRepetitionEncoder(h);

dataBitsLsb = binl2tx(dataBits);
for i=1:payloadLenInFecBlocks
    p = payloadScrambler(scramblerInitialization, dataBitsLsb(1+(i-1)*payloadBitsPerBlock0:payloadBitsPerBlock0*i));
    p = LDPCEncoder(p, binl2dec(fecRate), binl2dec(blockSize), false);
    p = puncturing(p, binl2dec(fecRate), binl2dec(blockSize));
    p = payloadRepetitionEncoder(p, 1);
    payloadTotal(:, i) = p;
end
payloadOFDMSymbols = toneMapping(payloadTotal(:), binl2dec(batId));

preambleTx = ofdmModulate(preambleOFDMSymbols, preambleBitsPerSubcarrier, preambleCyclicPrefixLen, nullIdx, preambleScramblerInit);
channelTx = ofdmModulate(channelOFDMSymbols, channelBitsPerSubcarrier, channelCyclicPrefixLen, nullIdx, channelScramblerInit);
headerTx = ofdmModulate(headerOFDMSymbols, headerBitsPerSubcarrier, headerCyclicPrefixLen, nullIdx, headerScramblerInit);
payloadTx = ofdmModulate(payloadOFDMSymbols, payloadBitsPerSubcarrier, payloadCyclicPrefixLen, nullIdx, payloadScramblerInit);

if(payloadLenInFecBlocks ~= 0)
    OFDMSignal = [preambleTx; channelTx; headerTx; payloadTx;];
else
    OFDMSignal = [preambleTx; channelTx; headerTx;];
end

OFDMSignal = interpolator(OFDMSignal);
expectedOut = upshifter(OFDMSignal);

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

if(payloadLenInFecBlocks ~= 0)
    assert(~isempty(startIdx), "No start signal");
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
if(all([simNormal == true, simLarge == false]))
    t = (0:1/fs:length(expectedOut)/fs-1/fs)';
    
    figure();
    subplot(2,1,1)
    plot(t, out, t, expectedOut);
    legend("Out", "ExpectedOut");
    xlabel("n [samples]");
    xlim([t(1), t(end)]);
    grid on;
    
    subplot(2,1,2)
    plot(t, abs(out - expectedOut));
    xlabel("n [samples]");
    title("|out - expectedOut|");
    xlim([t(1), t(end)]);
    grid on;
    
    figure();
    resampledOut = resample(out, 2, 1);
    [psd, fVector] = pwelch(resampledOut, rectwin(length(resampledOut)), [], 2^16, 2*fs, "centered");
    plot(fVector/1e6, 10*log10(psd));
    title("PSD of the transmitted signal")
    xlabel("Freq. [MHz]");
    ylabel("PSD [dB/Hz]");
    grid on;
end

disp("Test successfull!");


