function [dataOut] = headerRemoveRepetition(dataIn)
%HEADERREMOVEREPETITION Remove repetition from header.
% The OFDM Symbol has 490 bits, only "headerBitsPerFec = 336" are relevant.
    constants;
    dataOut = dataIn(1:headerBitsPerFec);
end

