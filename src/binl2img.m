function [image] = binl2img(bin, h, w, c)
%BINL2IMG Convert a binary list to an image.
arguments(Input)
    bin (:,1) logical
    h double    % Height in pixels
    w double    % Width in pixelds
    c double    % Channels (as RGB channels)
end
arguments(Output)
    image (:,:,:) uint8
end
    image = reshape(bin, 8, []);
    image = uint8(image) + '0';
    image = bin2dec(char(image'));
    image = reshape(image, h, w, c);
end

