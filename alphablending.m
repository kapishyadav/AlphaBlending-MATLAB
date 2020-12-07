close all;
clear all;

%Hand
oimg=imread("hand.jpg");
oimg = im2double(oimg);

gimg1 = imgaussfilt(oimg, 3); %apply gaussian filter
glayer1= reduce(gimg1);        %reduce picture
figure, imshow(glayer1)
title('gaussian 1');
gimg2 = imgaussfilt(glayer1,3);
glayer2= reduce(glayer1);
figure, imshow(glayer2)
title('gaussian 2');
gimg3 = imgaussfilt(glayer2,3);
glayer3= reduce(glayer2);
figure, imshow(glayer3)
title('gaussian 3');
gimg4 = imgaussfilt(glayer3,3);
glayer4= reduce(glayer3);
figure, imshow(glayer4)
title('gaussian 4');

LapLayer3 = expand(glayer3,glayer2);
figure, imshow(LapLayer3)
title('Lap3');
LapLayer2 = expand(glayer2,glayer1);
figure, imshow(LapLayer2)
title('Lap2');
LapLayer1 = expand(glayer1,oimg);
figure, imshow(LapLayer1)
title('Lap1');

%Face
face = imread('eyenew1.jpg');
face = im2double(face);

gface1 = imgaussfilt(face, 2); %apply gaussian filter
gfacelayer1= reduce(gface1);        %reduce picture
figure, imshow(gfacelayer1)
title('gaussian face 1');
gface2 = imgaussfilt(gfacelayer1,2);
gfacelayer2= reduce(gfacelayer1);
figure, imshow(gfacelayer2)
title('gaussian face 2');
gface3 = imgaussfilt(gfacelayer2,2);
gfacelayer3= reduce(gfacelayer2);
figure, imshow(gfacelayer3)
title('gaussian face 3');
gface4 = imgaussfilt(gfacelayer3,2);
gfacelayer4= reduce(gfacelayer3);
figure, imshow(gfacelayer4)
title('gaussian face 4');

LapfaceLayer3 = expand(gfacelayer3,gfacelayer2);
LapfaceLayer3 = LapfaceLayer3.*2;
figure, imshow(LapfaceLayer3)
title('Lap3');
LapfaceLayer2 = expand(gfacelayer2,gfacelayer1);
LapfaceLayer2 = LapfaceLayer2.*2;
figure, imshow(LapfaceLayer2)
title('Lap2');
LapfaceLayer1 = expand(gfacelayer1,face);
LapfaceLayer1 = LapfaceLayer1.*2;
figure, imshow(LapfaceLayer1)
title('Lap1');






%Binary Mask
binmask = imread('mask.jpg');
binmask = im2double(binmask);
gmask0 = imgaussfilt(binmask, 2);
masklayer0= reduce(gmask0);
figure, imshow(masklayer0)
title('masklayer0');

gmask1 = imgaussfilt(gmask0, 2);
masklayer1= reduce(gmask1);
figure, imshow(masklayer1)
title('masklayer1');

gmask2 = imgaussfilt(gmask1, 2);
masklayer2= reduce(masklayer1);
figure, imshow(masklayer2)
title('masklayer2');

gmask3 = imgaussfilt(gmask2, 3);
masklayer3= reduce(masklayer2);
figure, imshow(masklayer3)
title('masklayer3');


%Blend
getEye = gfacelayer3.*masklayer3;
getHand = (1-masklayer3).*glayer3;

blend = getEye+getHand;
%figure, imshow(blend)
%title('blend');


blend3Lap = justexpand(blend, LapLayer3);
%figure, imshow(blend3Lap)

blend2Lap = justexpand(blend3Lap, LapLayer2);
%figure, imshow(blend2Lap)

blend1Lap = justexpand(blend2Lap, LapLayer1);
figure, imshow(blend1Lap)
title('Final Blended Image');







    

