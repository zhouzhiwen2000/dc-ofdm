function dataOut = rxInterpolator(CONST, dataIn)
%INTERPOLATOR Interpolate signal.
    dataIn = [dataIn; zeros(CONST.rxInterpolatorDelay, 1)];
    dataOut = CONST.rxInterpolatorFilter(dataIn);
    
    % Remove delay from FIR filter
    dataOut(1:CONST.rxInterpolatorDelay) = [];
    dataOut(end-CONST.rxInterpolatorDelay*(CONST.rxL-1)+1:end) = [];
end

