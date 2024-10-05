function dataOut = LDPCEncoder(CONST, dataIn, codeRate, blockSize, isHeader)
%LDPCENCODER 
% Block size is obtained as follows:
% Let "ib" be the information bits (960 or 4320)
% Let tb = ib/codeRate be the total bits, obtained from the code rate.
% Provided that all the matrices have 24 columns, the block size "B" is:
% tb = 24*B --> B = tb/24 --> B = ib/(24*codeRate)
arguments(Input)
    CONST
    dataIn (:,1) logical
    codeRate uint32
    blockSize uint32
    isHeader logical
end
arguments(Output)
    dataOut (:,1) logical
end
    %% Choosing the right LPDC parity check matrix
    if (isHeader)
        h = CONST.Hc_12H;
        B = 14;
    else
        switch codeRate
            case 1
                if (blockSize == 0)
                    % 1/2, 960
                    %h = CONST.Hc_12S;
                    %B = 80;
                    % Replaced with header LDPC matrix
                    h = CONST.Hc_12H;
                    B = 14;
                else
                    % 1/2, 4320
                    h = CONST.Hc_12L;
                    B = 360;
                end
            case 2
                if(blockSize == 0)
                    % 2/3, 960
                    h = CONST.Hc_23S;
                    B = 60;
                else
                    % 2/3, 4320
                    h = CONST.Hc_23L;
                    B = 270;
                end
            case 3
                if(blockSize == 0)
                    % 5/6, 960
                    h = CONST.Hc_56S;
                    B = 48;
                else
                    % 5/6, 4320
                    h = CONST.Hc_56L;
                    B = 216;
                end
            case 4
                if(blockSize == 0)
                    % 16/18, 960
                    h = CONST.Hc_56S;
                    B = 48;
                else
                    % 16/18, 4320
                    h = CONST.Hc_56L;
                    B = 216;
                end
        
            case 5
                if (blockSize == 0)
                    % 20/21, 960
                    h = CONST.Hc_56S;
                    B = 48;
                else
                    % 20/21, 4320
                    h = CONST.Hc_56L;
                    B = 216;
                end
        end
    end

    h = ldpcQuasiCyclicMatrix(B, h);
    ldpcConfig = ldpcEncoderConfig(h);
    dataOut = ldpcEncode(dataIn, ldpcConfig);
end
