% Running example for generating white-balanced set of images
% The graycard borders are set to our included images of shelfs

graycardPath = 'graycard.tiff';
withFlashPath = 'withflash.tiff';
noFlashPath = 'noflash.tiff';

% Running our images example:
whiteBalance(graycardPath, withFlashPath, noFlashPath, 1431, 2391, 428, 1832);

% in order to run the guitar example replace the *.tiff files with the
% guitar files using 'make guitar' command in the shell (need to place the
% guitar *.CR2 files in the code dir first).

% Running guitar example:
% whiteBalance(graycardPath, withFlashPath, noFlashPath, 1200, 1800, 1200, 1800);
