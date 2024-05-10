function dataOut = puncturing(dataIn, codeRate, blockSize)
%PUNCTURING Apply puncturing to the infromation after the FEC.
% Given a vector with ones and zeros like PP = [1 1 1 0], the puncturer
% preserves bits where the PP = 1, and discards bits where PP = 0;
% For example:
%   PP = [ 1 1 1 0 ]
%   Input =  [ 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 ]
%   Output = [ 1 1 0   1 1 0   1 1 0   1 1 0 ]
arguments(Input)
    dataIn (:,1) logical
    codeRate uint8
    blockSize uint8
end
arguments(Output)
    dataOut (:,1) logical
end

    switch codeRate
        case 1
            % 1/2 -> PP16 (0)
            dataOut = dataIn;
        case 2
            % 2/3 -> PP16 (0)
            dataOut = dataIn;
        case 3
            % 5/6 -> PP16 (0)
            dataOut = dataIn;
        case 4
            % 16/18
            if(blockSize == 0)
                % 960 -> PP1152 (72)
                dataOut = [dataIn(1:720); dataIn(757:1116)];
            else
                % 4320 -> PP5184 (324)
                dataOut = [dataIn(1:3240); dataIn(3403:4374); dataIn(4537:end)];
            end
    
        case 5
            % 20/21
            if (blockSize == 0)
                % 960 -> PP1152 (144)
                dataOut = [dataIn(1:720); dataIn(769:1008); dataIn(1105:end)];
            else
                % 4320 -> PP5184 (648)
                dataOut = [dataIn(217:4536); dataIn(4969:end)];
            end
        otherwise
            error("Code Rate unsupported");
    end

end

