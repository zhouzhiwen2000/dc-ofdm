function [msgDecoded, err] = crcDecode(poly, msg)
%CRCDECODE Extract the actual message from a CRC appended message.
% Args:
%   - poly = Divisor polinomial.
%   - msg = Message to be decoded, with CRC appended from the generator.
% Outputs:
%   - msgDecoded = Message decoded, with the CRC removed.
%   - err = indicates if the message has any errors.
arguments(Input)
    poly (1,:) logical
    msg (:, 1) logical
end
arguments(Output)
    msgDecoded (:,1) logical
    err logical
end
    crcDet = comm.CRCDetector(poly, InitialConditions=1, DirectMethod=true);
    [msgDecoded, err] = crcDet(msg);
end
