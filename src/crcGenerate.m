function [msgGenerated, crc] = crcGenerate(poly, msg)
%CRCGENERATE Generate a message with the CRC appended.
% The CRC is compliant with the IEEE 802.15.13-2023 standard, which means:
% - LFSR registers are initialized to all "1".
% - Direct method is used (XOR and feedback from input).
% - If the polinomial is x^3 + x
% Args:
%   - poly = Divisor polinomial. For example x^3 + x^2 + 1 = [1 1 0 1].
%   - msg = Message to be transmited.
% Outputs:
%   - msgGenerated = Concatenation of the message and the crc: [msg; crc].
%   - crc = crc calculated.
arguments(Input)
    poly (1,:) logical
    msg (:,1) logical
end
arguments(Output)
    msgGenerated (:,1) logical
    crc (:,1) logical
end
    crcGen = comm.CRCGenerator(poly, InitialConditions=1, DirectMethod=true);
    msgGenerated = crcGen(msg);
    crc = msgGenerated(length(msg) + 1:end);
end
