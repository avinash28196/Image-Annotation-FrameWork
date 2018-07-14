img=imread('7.jpg');
[maskOut]=kGaussian_color_EM(img,9); figure;  imshow(maskOut)
