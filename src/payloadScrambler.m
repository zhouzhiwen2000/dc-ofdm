function [dataOut] = payloadScrambler(scramblerInit, dataIn)
%SCRAMBLER LFSR Fibonacci with the polinomial X^23 + X^18 + 1, and a XOR
% between the LSB and the data input.
% Args:
%   - scramblerInit = C1_C2_C3_C4 initialization bits for the scrambler.
%   - dataIn = Binary vector with data to be scrambled.
% Output:
%   - dataOut = dataIn ^ LSB(LFSR).
arguments(Input)
    scramblerInit (1,4) double
    dataIn (:,1) logical
end
arguments(Output)
    dataOut (:,1) logical
end
    % Matlab implementation is mirrored, so the polinomial is:
    % x^23 + x^18 + 1 --> X^23 + x^5 + 1
    % For more info, check "Additive Scrambling of Input Data" in the
    % "comm.PNSequence" Matlab documentation
    poly = [23 5 0];
    init = [scramblerInit 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
    pnSeq = comm.PNSequence(Polynomial=poly, InitialConditions=init, Mask=23, ...
        SamplesPerFrame=length(dataIn), OutputDataType="logical");

    dataOut = xor(pnSeq(), dataIn);
end

