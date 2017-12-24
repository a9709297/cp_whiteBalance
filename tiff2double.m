% This function reads .tiff image file, and normalize it
% input: img_file - .tiff filename
% output norm_img - normalized image in range [0 1]
function [ norm_img ] = tiff2double( img_file )

img = imread(img_file);
norm_img = double(img) ./ (2^8 - 1);

norm_img = uint8(norm_img);
norm_img = im2double(norm_img);


end

