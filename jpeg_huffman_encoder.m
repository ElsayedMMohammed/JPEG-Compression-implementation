function bits_stream = jpeg_huffman_encoder(table,stream)

% This function encodes stream of symbols into bitstream into according to any coding
% scheme

%% Input:
%       table : A table of the symbols with their corresponding bits
%       stream = The stream of  symbols to be encoded
%       
%% Output:
%      bits_stream: The output stream of bits after encoding

len = length(stream);
bits_stream=[];

for i=1:len
   symbol = stream(i);
   index = cell2mat([table(:,1)])==symbol;
   code_word = table{index,3};
   bits_stream=cat(2,bits_stream,code_word);
end
end