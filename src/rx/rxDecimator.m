function [dataOut] = rxDecimator(CONST, dataIn)
%RXDECIMATOR Inverse operation to interpolation.
% TODO edge values. Maybe add windowing at the transmitter?
    dataIn = [dataIn; zeros(CONST.rxDecimatorDelay, 1)];
    dataOut = CONST.rxDecimatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:CONST.rxDecimatorDelay/CONST.rxM) = [];
end

