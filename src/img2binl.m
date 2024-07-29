function [bin, h, w, c] = img2binl(imageName)
%IMG2BINL Convert and image to a binary list.
arguments(Input)
    imageName string    % Name of the image file
end
arguments(Output)
    bin (:,1) logical
    h double    % Height in pixels
    w double    % Width in pixelds
    c double    % Channels (as RGB channels)
end
    bin = imread(imageName);
    h = height(bin);
    w = width(bin);
    c = size(bin, 3);
    bin = bin(:);
    bin = logical(dec2bin(bin, 8) - '0')';
    bin = bin(:);
end

