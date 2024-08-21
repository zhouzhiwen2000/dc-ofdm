%% Test IEEE 802.15.13 full receiver
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../src/rx");
constants;

%% Inputs
parametersFile = "sampleParametersFile";
delayIn = 10000;
SNR = 60;
msgIn{1} = 'This is a test of the RX for the UTN VLC Project!';
msgIn{2} = 'Second message';
msgIn{3} = 'Third message';
%msgIn = randomStr(4096);

% Preallocation
dataIn = [];
payloadLenInFecBlocks = zeros(length(msgIn), 1);
payloadExtraWords = zeros(length(msgIn), 1);
reg0 = zeros(length(msgIn), 1);
reg1 = zeros(length(msgIn), 1);
reg2 = zeros(length(msgIn), 1);
reg3 = zeros(length(msgIn), 1);

for i=1:1:length(msgIn)
    pBits = str2binl(msgIn{i});
    pBits = binl2tx(pBits);    % Input to the Rx should be LSB first.
    [OFDMSignal, payloadExtraWords(i, 1)] = fullTx(parametersFile, pBits);
    OFDMRx = channelSimulation(OFDMSignal, delayIn, SNR);
    dataIn = [dataIn; OFDMRx;];

    % Get registers for output
    [reg0(i, 1), reg1(i, 1), reg2(i, 1), reg3(i, 1)] = param2regs(parametersFile, pBits);

    payloadLenInFecBlocks(i, 1) = ceil(length(pBits)/payloadBitsPerBlock0);    % Used to end the simulation
end

%% Simulation Time
latency = 10000000/fs;         % Algorithm latency. Delay between input and output
stopTime = (length(dataIn)-1)/fs + latency;
totalPayloadFecBlocks = sum(payloadLenInFecBlocks);    % Used to end the simulation

%% Run the simulation
model_name = "HDLRx";

load_system(model_name);
simOut = sim(model_name);

dataOut = get(simOut, "dataOut");
startOut = get(simOut, "startOut");
endOut = get(simOut, "endOut");
validOut = get(simOut, "validOut");

headerEndOut = get(simOut, "headerEndOut");
headerErrOut = get(simOut, "headerErrOut"); % Not used

reg0Out = get(simOut, "reg0Out");
reg1Out = get(simOut, "reg1Out");
reg2Out = get(simOut, "reg2Out");
reg3Out = get(simOut, "reg3Out");

%% Compare header
headerEndOutIdx = find(headerEndOut == true);

assert(~isempty(headerEndOutIdx), ...
    "headerEndOutIdx shouldn't be empty");
assert(isequal(length(headerEndOutIdx), length(msgIn)), ...
    "There should be the same amount of headers received than messages sent.");

for i=1:1:length(headerEndOutIdx)
    assert(isequal(reg0Out(headerEndOutIdx(i)), reg0(i,1)));
    assert(isequal(reg1Out(headerEndOutIdx(i)), reg1(i,1)));
    assert(isequal(reg2Out(headerEndOutIdx(i)), reg2(i,1)));
    assert(isequal(reg3Out(headerEndOutIdx(i)), reg3(i,1)));
end
disp("Header was read correctly!");

%% Compare payload
startIdx = find(startOut == true);
endIdx = find(endOut == true);

assert(~isempty(startIdx), ...
    "StartIdx shouldn't be empty");
assert(isequal(length(startIdx), length(endIdx)), ...
    "Start and end should be of the same size");
assert(isequal(length(startIdx), totalPayloadFecBlocks), ...
    "Amount of received fec blocks should be the same as sent");

lastIndex = 1;
for j=1:1:length(msgIn)
    msgOut = '';
    for i=lastIndex:1:lastIndex -1 + payloadLenInFecBlocks(j,1)
        out = dataOut(startIdx(i):endIdx(i));
        if (i == lastIndex -1 + payloadLenInFecBlocks(j,1))
            out = out(1:end-payloadExtraWords(j,1));
        end
        msgOut = strcat(msgOut, char(out)');
        assert(sum(validOut(startIdx(i):endIdx(i)) == 0) == 0);
    end
    lastIndex = i + 1;
    assert(isequal(msgOut, msgIn{j}), "Sent and received message should be the same!");
end

disp("Test successfull!");
