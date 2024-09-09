function [dataOut] = rxDecimator(CONST, dataIn)
%RXDECIMATOR Inverse operation to interpolation.
% TODO edge values. Maybe add windowing at the transmitter?
    dataIn = [dataIn; zeros(CONST.rxDecimatorDelayForSim, 1)];
    dataOut = CONST.rxDecimatorFilterForSim(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:CONST.rxDecimatorDelayForSim/CONST.rxM) = [];
end

