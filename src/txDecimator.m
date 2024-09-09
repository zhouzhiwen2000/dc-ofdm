function [dataOut] = txDecimator(CONST, dataIn)
%TXDECIMATOR Inverse operation to interpolation.
    dataIn = [dataIn; zeros(CONST.txDecimatorDelay, 1)];
    dataOut = CONST.txDecimatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:CONST.txDecimatorDelay/CONST.txM) = [];
end




