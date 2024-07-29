%% Test conversion of an image to a binary list
clc; clear; close all;
addpath("../src");

imageName = "test_image.png";
image = imread(imageName);

[bin, h, w, c] = img2binl(imageName);
imageOut = binl2img(bin, h, w, c);

assert(isequal(image, imageOut));

imshow(imageOut);
disp("Test Successfull!");
