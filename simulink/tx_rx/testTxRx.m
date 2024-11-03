%% Tx Rx: Test a communication between receiver and transmitter
clc; clear; close all;
addpath("../../src");
addpath("../../inc");
addpath("../../HDL_ieee_8021513");
constants;

%% Input
paramFile = "sampleParametersFile";
delayIn = 10000; % Used for channel simulation in Simulink

msgIn{1} = ['This is an example message used to test the transmitter. ' ...
    'It is made large on purpose to test for a large message being ' ...
    'transmitted'];
msgIn{2} = 'This is a second message';
msgIn{3} = 'This is a third message';
%msgIn = randomStr(4096);
msgQtty = length(msgIn);

% Preallocation
pWords = [];
lastIn = [];
reg0 = zeros(msgQtty, 1);
reg1 = zeros(msgQtty, 1);
reg2 = zeros(msgQtty, 1);
reg3 = zeros(msgQtty, 1);
payloadLenInFecBlocks = zeros(msgQtty, 1);
payloadExtraWords = zeros(msgQtty, 1);

for i=1:1:msgQtty
    pBits = str2binl(msgIn{i});
    [pBits, payloadLenInFecBlocks(i), ~, ~, payloadExtraWords(i)] = ...
        getPayloadParamsFromBits(CONST, pBits);
    pWords = [pWords, binl2str(pBits)];
    len = length(binl2str(pBits));
    lastIn = [lastIn; false(len-1, 1); true;];

    [reg0(i), reg1(i), reg2(i), reg3(i)] = param2regs(CONST, paramFile, pBits);
end

validIn = true(length(pWords), 1);
newFrame = logical([1; 0]);

%% Simulation Time
latency = 1000000/CONST.fs;         % Algorithm latency. Delay between input and output
stopTime = (length(validIn)-1)/CONST.fs + latency;
totalPayloadFecBlocks = sum(payloadLenInFecBlocks);    % Used to end the simulation

%% Run the simulation
model_name = "HDLTxRx";

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
assert(isequal(length(headerEndOutIdx), msgQtty), ...
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
