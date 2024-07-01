function [dataOut] = constellationScrambler(dataIn, init, isRx)
%CONSTELLATIONSCRAMBLER  LFSR Fibonacci with the polinomial 
% X^13 + X^12 + X^11 + X^8 + 1. The phase of the input data is shifted
% acorting to the two LSB results of this LFSR.
% Args:
%   - dataIn = Binary vector with data to be scrambled.
%   - isPreamble = If "true", the LFSR is initalized with 0x16E6 (LSB
%   first). If "false", it's initialized with 0x1FFF.
%   LFSR
% Output:
%   - dataOut = dataIn*i^(x), with "x" the two LSB of the LFSR.
arguments(Input)
    dataIn (:,1) double
    init (1,13) uint8
    isRx logical = false
end
arguments(Output)
    dataOut (:,1) double
end

    % Matlab implementation is mirrored, so the polinomial is:
    % x^13 + x^12 + x^11 + x^8 + 1 --> X^13 + x^5 + x^2 + x^1 + 1
    % For more info, check "Additive Scrambling of Input Data" in the
    % "comm.PNSequence" Matlab documentation
    poly = [13 5 2 1 0];

    pnSeq = comm.PNSequence(Polynomial=poly, InitialConditions=init, Mask=13, ...
        SamplesPerFrame=(length(dataIn)-1)*2, OutputDataType="logical");

    LSB = double([init(2); init(1); pnSeq()]);

    % The values returned from the LFSR are like this:
    % [1 2 3 4 5 6 7 8]
    % But what we want is this (two bits advanced per subcarrier, the first
    % bit read is the LSB)
    % [21 43 65 87]
    LSB = 2*LSB(1:2:end) + LSB(2:2:end);

    if (isRx)
        % If Rx, rotate -90°
        dataOut = dataIn.*((-1i).^LSB);
    else
        % If Tx, rotate +90°
        dataOut = dataIn.*(1i.^LSB);
    end
end
