function img_f = image_dct(img,bases)
%This function performs the DCT for a matrix (image) whose rows and columns
%are multiples of 8

%% Inputs:
    % img: The image to be transformed using DCT
    % bases: The used DCT bases functions.
%% Outputs:
    % img_f : The image in the frequency domain after using DCT.
    
[rows,cols] = size(img);
img_f = zeros(size(img));
for n_row=1:rows/8
    for n_col=1:cols/8
       n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
       block = img(n_start_row:n_start_row+7,n_start_col:n_start_col+7); 
       % Get the frequency domain matrix
       block = double(block); 
       block_f= perform_dct(block,bases); %% DCT Operation
       img_f(n_start_row:n_start_row+7,n_start_col:n_start_col+7)= block_f;
    end
end

end