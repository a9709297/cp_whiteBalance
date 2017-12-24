% This function get flash chromaticity according an image of a grey-card in the required scene.
% input: image of grey card captured with flash as the only illuminant source.
%        image is *.tiff file format 
%        x1, x2, y1, y2 - graycard borders
% output: flash chromaticity vector
function [ flashChroma ] = graycardBalance( img, y1, y2, x1, x2 )

    gray = img(y1:y2, x1:x2, 1:3);


    % Calculate F = [Px/Fx Py/Fy Pz/Fz]:
    %         [ 1/Fx  0    0   ] [ ]   [ ]
    %         | 0    1/Fy  0   | |P| = |c|
    %         [ 0     0   1/Fz ] [ ]   [ ]
    
    % Option 1:
%     c = mean(gray(:));
%     F = double(gray) / c;
%     flashChroma = [mean(mean(F(:,:,1))) mean(mean(F(:,:,2))) mean(mean(F(:,:,3)))];
    
    % Option 2:
    F = double(gray);
    flashChroma = [mean(mean(F(:,:,1))) mean(mean(F(:,:,2))) mean(mean(F(:,:,3)))];
    flashChroma = flashChroma ./ flashChroma(2);
    
end

