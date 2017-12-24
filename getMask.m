% This function gets a mask of pixels influenced mostly by flash light.
% input: diff - difference image of flash-image and non-flash image
% output: binary mask of images in range (lowerLimit, upperLimit)
%         lowerLimit, upperLimit - pixel value range
function [ mask ] = getMask( diff, lowerLimit, upperLimit)

d1 = diff(:,:,1);
d2 = diff(:,:,2);
d3 = diff(:,:,3);

mask1 = (d1 > lowerLimit) .* (d1 < upperLimit);
mask2 = (d2 > lowerLimit) .* (d2 < upperLimit);
mask3 = (d3 > lowerLimit) .* (d3 < upperLimit);

mask = logical(mask1 .* mask2 .* mask3);

end

