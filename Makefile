# compile:
dcraw:
	gcc -o dcraw -O4 dcraw.c -lm -DNODEPS

all:
	make dcraw
	make shelf

guitar:
	make raw

shelf:
	make raw2

# generate *.tiff file:
raw:
	dcraw -T -w -o 0 -4 graycard.CR2
	dcraw -T -w -o 0 -4 noflash.CR2
	dcraw -T -w -o 0 -4 withflash.CR2

xyz:
	dcraw -T -w -o 5 -4 graycard.CR2
	dcraw -T -w -o 5 -4 noflash.CR2
	dcraw -T -w -o 5 -4 withflash.CR2

srgb:
	dcraw -T -w -o 1 -4 graycard.CR2
	dcraw -T -w -o 1 -4 noflash.CR2
	dcraw -T -w -o 1 -4 withflash.CR2

raw2:
	dcraw -T -w -o 0 -4 graycard.NEF
	dcraw -T -w -o 0 -4 noflash.NEF
	dcraw -T -w -o 0 -4 withflash.NEF

xyz2:
	dcraw -T -w -o 5 -4 graycard.NEF
	dcraw -T -w -o 5 -4 noflash.NEF
	dcraw -T -w -o 5 -4 withflash.NEF

srgb2:
	dcraw -T -w -o 1 -4 graycard.NEF
	dcraw -T -w -o 1 -4 noflash.NEF
	dcraw -T -w -o 1 -4 withflash.NEF

clean:
	rm -f *.tiff
