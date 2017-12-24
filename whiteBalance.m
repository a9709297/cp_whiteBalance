% White-Balance: Main program function
% This function produce a set of white-balanced images with different
% adaptation matrices according to the input images.
% inputs:
% graycardDir - path of graycard image file. *.tiff file
% withFlashDir - path of image shooted with flash. *.tiff file
% noFlashDir - path of image shooted without flash. *.tiff file
function [ ] = whiteBalance(graycardPath, withFlashPath, noFlashPath, y1, y2, x1, x2)

    % Load images
    gray = tiff2double(graycardPath);
    withFlash = tiff2double(withFlashPath);
    noFlash = tiff2double(noFlashPath);

    imwrite(gammaCorrect(noFlash), 'origGamma.jpg', 'Quality', 100);
    
    % Adaptation Matrices
    bradfordMat = [0.8951 0.2664 -0.1614; -0.7502 1.7135 0.0367; ...
        0.0389 -0.0685 1.0296];
    vonKriesMat = [0.40024 0.7076 -0.08081; -0.2263 1.16532 0.0457; ...
        0 0 0.91822];
    xyzScaleMat = eye(3);

    % Calculate flash chromaticity using gray-card image
    flashChroma = graycardBalance(gray, y1, y2, x1, x2);

    % Calculate flash-image minus noFlash image in order to find
    % image with only flash light
    diff = max(0, withFlash - noFlash);
    medVal = (max(diff(:)) + min(diff(:)))/2;
    mask = getMask(diff, medVal - 0.2, medVal + 0.2);

    % extract R from subject pixels
    R = disableChroma(diff, flashChroma);

    % extract light source chromaticty
    tmpL = noFlash./R;
    p1 = tmpL(:,:,1);
    p2 = tmpL(:,:,2);
    p3 = tmpL(:,:,3);
    L = [mean(p1(mask)) mean(p2(mask)) mean(p3(mask))];
    L = L ./ L(2);

    % Disable second light source chromaticity

    %bradfordMat
    bradfordAdapt = applyMatrix(noFlash, bradfordMat);
    bradfordAdapt = disableChroma(bradfordAdapt, L);
    bradfordAdapt = applyMatrix(bradfordAdapt, inv(bradfordMat));
    bradfordAdapt = gammaCorrect(bradfordAdapt);

    % vonKriesMat
    vonKriesAdapt = applyMatrix(noFlash, vonKriesMat);
    vonKriesAdapt = disableChroma(vonKriesAdapt, L);
    vonKriesAdapt = applyMatrix(vonKriesAdapt, inv(vonKriesMat));
    vonKriesAdapt = gammaCorrect(vonKriesAdapt);

    % xyzScaleMat
    xyzAdapt = applyMatrix(noFlash, xyzScaleMat);
    xyzAdapt = disableChroma(xyzAdapt, L);
    xyzAdapt = applyMatrix(xyzAdapt, inv(xyzScaleMat));
    xyzAdapt = gammaCorrect(xyzAdapt);

    imwrite(bradfordAdapt, 'bradfordAdapt.jpg', 'Quality', 100);
    imwrite(vonKriesAdapt, 'vonKriesAdapt.jpg', 'Quality', 100);
    imwrite(xyzAdapt, 'noAdapt.jpg', 'Quality', 100);

end