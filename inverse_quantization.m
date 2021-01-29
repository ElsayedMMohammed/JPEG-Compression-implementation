function img = inverse_quantization(img,q)
% This function perform the inverse quantization by multiplying the input
% image by 8x8 quantization table.
%% Inputs:
 %      img: The image needed to be re-quantized, its rows and cols must be
 %            multiplies of 8
 %      q  : 8x8 quantization table.
 %% Outputs:
 %      img: The final image after re-quantization.
 
[rows,cols] = size(img);
for n_row=1:rows/8
    for n_col=1:cols/8
        n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
     
        temp = img(n_start_row:n_start_row+7,n_start_col:n_start_col+7);
        img(n_start_row:n_start_row+7,n_start_col:n_start_col+7)= q.*temp;
        
        
    end
 end
end

