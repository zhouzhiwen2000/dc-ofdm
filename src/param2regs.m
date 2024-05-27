function [reg0, reg1, reg2, reg3] = param2regs(paramFile)
%PARAM2REGS Given the parameters for the PSDU, this function returns the
%configuration registers. Values written to this function must be MSB
%first.
arguments(Input)
    paramFile string
end
arguments(Output)
    reg0 uint32
    reg1 uint32
    reg2 uint32
    reg3 uint32
end
    run(paramFile);

    reg0 = binl2dec(logical([false(1,8) psduSize]));
    
    reg1 = binl2dec(logical([false(1, 16) messageDuration]));
    
    reg2 = binl2dec(logical([ ...
        0 0 0 0 0 fecConcatenationFactor ...
        0 0 0 0 0 repetitionNumber ...
        0 0 0 0 0 fecRate ...
        0 0 0 0 0 0 blockSize]));
    
    reg3 = binl2dec(logical([ ...
        0 0 explicitMimoPilotSymbolNumber explicitMimoPilotSymbolCombSpacing ...
        0 0 0 0 0 cyclicPrefixId ...
        0 0 0 batId ...
        0 0 0 0 scramblerInitialization]));
end

