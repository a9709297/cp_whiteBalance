% Gamma correct input image using vision.GammaCorrector & imadjust
% functions.
% input: image
% output: gamma-corrected image.
function [ output_image ] = gammaCorrect( img )

hgamma = vision.GammaCorrector(20,'Correction','Gamma');
output_image = step(hgamma, img);

end

