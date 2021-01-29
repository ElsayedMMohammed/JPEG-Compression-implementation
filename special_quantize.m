function img_q = special_quantize(img,q)

% This function performs the quantization to the input 8x8 matrix with the
% input quantization table q.
%% Inputs:
    % img : matrix represents an image to be qunatized. The image should
                % has rows and columns divisible by 8
    % q   : A 8x8 quantization table.
%% Outputs:
    % img_q : The quantized image.

[rows,cols] = size(img);
img_q = zeros(size(img));
for n_row=1:rows/8
    for n_col=1:cols/8
       n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
       block = img(n_start_row:n_start_row+7,n_start_col:n_start_col+7); 
       block_q= block./q;
       img_q(n_start_row:n_start_row+7,n_start_col:n_start_col+7)= block_q;
    end
end
    img_q = round(img_q);
end