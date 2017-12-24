% Apply adaptaion-matrix on image.
% Input: image, adaptation-matrix
% Output: adapted-image
function [ adaptImg ] = applyMatrix( img , adaptMat )

imSize = size(img);
imgShaped = reshape(img, imSize(1) * imSize(2), 3);
imgShaped = imgShaped * adaptMat;
adaptImg = reshape(imgShaped, imSize(1), imSize(2), 3);


end

