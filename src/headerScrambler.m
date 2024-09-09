function [dataOut] = headerScrambler(CONST, dataIn)
%HEADERSCRAMBLER LFSR Fibonacci with the polinomial X^23 + X^18 + 1, 
% and a XOR between the LSB and the data input.
% Args:
%   - dataIn = Binary vector with data to be scrambled.
% Output:
%   - dataOut = dataIn ^ LSB(LFSR).
arguments(Input)
    CONST
    dataIn (:,1) logical
end
arguments(Output)
    dataOut (:,1) logical
end
    pnSeq = comm.PNSequence(Polynomial=CONST.headerScramblerPoly, ... 
        InitialConditions=CONST.headerBitScramblerInit, Mask=23, ...
        SamplesPerFrame=length(dataIn), OutputDataType="logical");

    dataOut = xor(pnSeq(), dataIn);
end