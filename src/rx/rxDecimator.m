function [dataOut] = rxDecimator(dataIn)
%RXDECIMATOR Inverse operation to interpolation.
% TODO edge values. Maybe add windowing at the transmitter?
    constants;

    dataIn = [dataIn; zeros(rxDecimatorDelayForSim, 1)];
    dataOut = rxDecimatorFilterForSim(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:rxDecimatorDelayForSim/rxM) = [];
end

