
function [final_img, img_rows, img_cols] = convert_dimensions(img,dim)
%% This function constructs square matrix whose rows and columns divisable by dim
% Input: 
   %     img: The input image whose dimensions will be changed.
   %     dim (1 integer): The number which th dimension of the new generated square matrix (image) must be divisable by. 
 % Output:
   % final_img : The newly created image with dimensions divisible by dim
   % img_rows  : The number of rows of the new image
   % img_cols  : The number of columns of the new image.
   
img_rows = size(img,1); img_cols = size(img,2);
rems = rem(size(img),dim);
if rems(1) ~= 0
    img_rows = img_rows + dim-rems(1);
end
if rems(2) ~= 0
    img_cols = img_cols + dim-rems(2);
end
final_img = zeros(img_rows, img_cols);
final_img(1:size(img,1),1:size(img,2)) = img;
end