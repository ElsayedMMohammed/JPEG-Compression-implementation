function img_2 = image_idct(img_f,bases)
%This function performs the IDCT for a matrix (image) whose rows and columns
%are multiples of 8

%% Inputs:
    % img: The image in the frequency domain to be transformed using IDCT
    % bases: The used DCT bases functions.
%% Outputs:
    % img_2 : The image in the special domain after using IDCT.
    
    
[rows,cols] = size(img_f);
img_2 = zeros(size(img_f));
for n_row=1:rows/8
    for n_col=1:cols/8
       n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
       block = img_f(n_start_row:n_start_row+7,n_start_col:n_start_col+7); 
       block_r= perform_idct(block,bases);
       img_2(n_start_row:n_start_row+7,n_start_col:n_start_col+7)= block_r;
    end
end

end