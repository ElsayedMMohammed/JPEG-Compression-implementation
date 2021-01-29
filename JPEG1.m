%% This file is a trial script that includes and runs all the functions to compress an image.
clear; clc; close all;
%% Get the basis functions once
basis = get_basis();
%% Get the grayscale image
img = imread('B2DBY.jpg');
img = double(rgb2gray(img)); %convert to grayscale image
%% construct square matrix whose rows and columns divisable by 8
[img, rows, cols] = convert_dimensions(img,8);
%% DCT
freq_img = image_dct(img,basis);
%% Quantization
 q = [ 1 2 4 8 16 32 64 128;
           2 4 4 8 16 32 64 128;
           4 4 8 16 32 64 128 128;
           8 8 16 32 64 128 128 256;
           16 16 32 64 128 128 256 256;
           32 32 64 128 128 256 256 256;
           64 64 128 128 256 256 256 256;
           128 128 128 256 256 256 256 256];
       
quant_img = special_quantize(freq_img,q);
%% Transform 2D to 1D & Run length Encoding
q_img_1D=[];
for n_row=1:rows/8
    for n_col=1:cols/8
       n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
       block = quant_img(n_start_row:n_start_row+7,n_start_col:n_start_col+7); 
       block_1D = run_length_encoding(block);
       q_img_1D = [q_img_1D block_1D];
    end
end
%% Huffman Step
 Prs = get_probabilities(q_img_1D);
 dict2 = jpeg_huffman_table(Prs);
 encoded_stream = jpeg_huffman_encoder(dict2,q_img_1D);
 %code = huffmanenco(q_img_1D,dict);
 %% Huffman decoder
 decoded_stream = jpeg_huffman_decoder(dict2,encoded_stream);
 %decoded_stream = huffmandeco(code,dict);
%% From 1D to 2D
 decoded_img  = run_length_decoding(decoded_stream,size(img));
%% Inverse Quantization
 decoded_img = inverse_quantization(decoded_img, q); 
%% Inverse-DCT
decoded_img = image_idct(decoded_img,basis);
%% Quality Metrics
 RMS_error = sqrt(sum((img-decoded_img).^2,'all')./(rows*cols));
 compression_ratio = (8*rows*cols)/length(encoded_stream)*100;
%% Showing Time!
figure (1)
imshow(uint8(img));
figure (2)
imshow(uint8(decoded_img));


 
