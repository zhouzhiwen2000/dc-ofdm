function [dataOut] = ofdmDemodulate(CONST, ofdmIn, bitsPerSubcarrier, cpLen, constellationScramblerInit, llr, channelEst)
%OFDMDEMODULATE Inverse operation to ofdmModulate. Receives OFDM symbols as
% a matrix (each column is an OFDM symbol), and returns the data bits
% serialized.
arguments(Input)
    CONST
    ofdmIn (:,:) double
    bitsPerSubcarrier double
    cpLen double
    constellationScramblerInit (1,13) uint8
    llr logical =true
    channelEst (:, 1) double = 1
end
arguments(Output)
    dataOut (:,1)
end
    if (llr)
        outType = 'approxllr';
        outDataType = 'single';
    else
        outType = 'bit';
        outDataType = 'logical';
    end

    % This function returns a matrix where each column has an OFDM symbol
    qamSignalScrambled = ofdmdemod(ofdmIn, CONST.N, cpLen, 0, CONST.nullIdx);
    
    if (llr)
        dataOut = zeros(bitsPerSubcarrier*CONST.numDataCarriers, width(qamSignalScrambled));
    else
        dataOut = false(bitsPerSubcarrier*CONST.numDataCarriers, width(qamSignalScrambled));
    end
    
    for i=1:1:width(qamSignalScrambled)
        qamSignal = constellationScrambler(qamSignalScrambled(:,i), constellationScramblerInit, true);
        qamSignal = ofdmChannelEqualizer(qamSignal, channelEst);

        switch bitsPerSubcarrier
            case 1
                dataOut(:,i) = pskdemod(qamSignal, 2^bitsPerSubcarrier, OutputType=outType, OutputDataType=outDataType);
            case 2
                qamConstellation = CONST.qamTwoBits;
                dataOut(:,i) = qamdemod(qamSignal, 2^bitsPerSubcarrier, qamConstellation, UnitAveragePower=true, PlotConstellation=false, outputType=outType, outputDataType=outDataType);
            case 4
                qamConstellation = qamFourBits;
                dataOut(:,i) = qamdemod(qamSignal, 2^bitsPerSubcarrier, qamConstellation, UnitAveragePower=true, PlotConstellation=false, outputType=outType, outputDataType=outDataType);
            otherwise
                error("Unssuported QAM modulation order");
        end
    end
    
    dataOut = dataOut(:);
end
