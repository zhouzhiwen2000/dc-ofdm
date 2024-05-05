function [d] = binl2dec(b)
%BINL2DEC Given a bit vector, return the decimal value.
% Args:
%   - b = Binary vector.
% Output:
%   - d = Decimal value.
arguments(Input)
    b (:,1) logical
end
arguments(Output)
    d uint32
end
    d = char(b + '0');
    d = bin2dec(d');
end

