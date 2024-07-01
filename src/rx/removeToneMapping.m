function [dataOut] = removeToneMapping(dataIn, psduSize)
%REMOVETONEMAPPING Remove tone mapping from payload bits.
arguments(Input)
    dataIn(:,1) double
    psduSize double
end
arguments(Output)
    dataOut (:,1) double
end
    bitsInPayload = binl2dec(psduSize)*8;
    dataOut = dataIn(1:bitsInPayload);
end

