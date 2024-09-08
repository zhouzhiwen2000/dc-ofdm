function [dataOut] = txDecimator(dataIn)
%TXDECIMATOR Inverse operation to interpolation.
    constants;

    dataIn = [dataIn; zeros(txDecimatorDelay, 1)];
    dataOut = txDecimatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:txDecimatorDelay/txM) = [];
end




