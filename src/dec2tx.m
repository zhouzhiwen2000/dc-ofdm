function b = dec2tx(d, l)
%DEC2TX Convert a decimal number into transmit order.
%   Transmit order means:
%   - Big endian (transmit the most significant octet first)
%   - LSB first, MSB last inside each octet of the PSDU (payload to transmit).
% Args:
%   - d = Decimal number.
%   - l = Minimum length of the binary number in bits (zeros will be 
%   appended on the right).
% Output:
%   - b = Binary number, in transmit order.
arguments(Input)
    d uint32
    l uint32 = 0
end
arguments(Output)
    b (:,1) logical
end
    b = dec2binl(d, l);
    b = binl2tx(b);
end
