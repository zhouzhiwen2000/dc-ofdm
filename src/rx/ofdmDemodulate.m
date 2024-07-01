function [dataOut] = ofdmDemodulate(ofdmIn, bitsPerSubcarrier, cpLen, nullIdx, constellationScramblerInit, llr)
%OFDMDEMODULATE Inverse operation to ofdmModulate. Receives OFDM symbols as
% a matrix (each column is an OFDM symbol), and returns the data bits
% serialized.
arguments(Input)
    ofdmIn (:,:) double
    bitsPerSubcarrier double
    cpLen double
    nullIdx (:,1) double
    constellationScramblerInit (1,13) uint8
    llr logical =true
end
arguments(Output)
    dataOut (:,1)
end
    constants;
    % This function returns a matrix where each column has an OFDM symbol
    qamSignalScrambled = ofdmdemod(ofdmIn, N, cpLen, 0, nullIdx);
    
    if (llr)
        dataOut = zeros(bitsPerSubcarrier*numDataCarriers, width(qamSignalScrambled));
    else
        dataOut = false(bitsPerSubcarrier*numDataCarriers, width(qamSignalScrambled));
    end
    
    for i=1:1:width(qamSignalScrambled)
        qamSignal = constellationScrambler(qamSignalScrambled(:,i), constellationScramblerInit, true);
        if (llr)
            dataOut(:,i) = qamdemod(qamSignal, 2^bitsPerSubcarrier, 'bin', UnitAveragePower=true, PlotConstellation=false, outputType='approxllr');
        else
            dataOut(:,i) = qamdemod(qamSignal, 2^bitsPerSubcarrier, 'bin', UnitAveragePower=true, PlotConstellation=false, outputType='bit', outputDataType='logical');
        end
    end
    
    dataOut = dataOut(:);
