function [ result ] = imAdapt( im,  adaptMat)
%IMADAPT Summary of this function goes here
%   Detailed explanation goes here
result = applyMatrix(im, adaptMat);
result = disableChroma(result, L);
result = applyMatrix(result, inv(adaptMat));

end

