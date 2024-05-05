function [b] = binl2tx(b)
%BINL2TX Convert a logical column vector into transmit order.
%   Transmit order means:
%   - Big endian (transmit the most significant octet first)
%   - LSB first, MSB last inside each octet of the PSDU (payload to transmit).
% Args:
%   - b = Binary input as a row or column vector
% Output:
%   - b = Binary number, in transmit order as a column vector.
arguments(Input)
    b (:,:) logical
end
arguments(Output)
    b (:,1) logical
end
    b = b(:);
    if (length(b) < 8)
        b = flip(b);
    else
        for i=1:1:floor(length(b)/8)
            b(8*(i-1)+1:1:8*i, 1) = flip(b(8*(i-1)+1:1:8*i, 1));
        end

        if (mod(length(b), 8) ~= 0)
            b(length(b) - mod(length(b),8) + 1:1:end, 1) = ...
                flip(b(length(b) - mod(length(b),8) + 1:1:end, 1));
        end
    end
end

