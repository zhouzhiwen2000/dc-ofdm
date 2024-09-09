function dataOut = txInterpolator(CONST, dataIn)
%INTERPOLATOR Interpolate signal.    
    dataIn = [dataIn; zeros(CONST.txInterpolatorDelay, 1)];
    dataOut = CONST.txInterpolatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:CONST.txInterpolatorDelay) = [];
    dataOut(end-CONST.txInterpolatorDelay*(CONST.txL-1)+1:end) = [];
end

