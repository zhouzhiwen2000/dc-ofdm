function [dataOut] = headerRemoveRepetition(CONST, dataIn)
%HEADERREMOVEREPETITION Remove repetition from header.
% The OFDM Symbol has 490 bits, only "headerBitsPerFec = 336" are relevant.
    dataOut = dataIn(1:CONST.headerBitsPerFec);
end

