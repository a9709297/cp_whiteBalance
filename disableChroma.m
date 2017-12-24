% This function gets an image and chromaticity-vector,
% and apply disable image chromaticity.
% input: image, chromaticity vector
% output: image reduced chromaticity.
function [ output_image ] = disableChroma( img, chroma )
    output_image = img;
    output_image(:,:,1) = output_image(:,:,1) / chroma(1);
    output_image(:,:,2) = output_image(:,:,2) / chroma(2);
    output_image(:,:,3) = output_image(:,:,3) / chroma(3); 
end