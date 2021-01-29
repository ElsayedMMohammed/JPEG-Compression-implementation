function stream = jpeg_huffman_decoder(table,bits_stream)

% This function decodes a bitstream into symbols according to any coding
% scheme
%% Input:
%       table : A table of the symbols with their corresponding bits
%       bits_stream: The input bit stream to be decoded
%% Output:
%      stream = The stream of decoded symbols


[nr,~] = size(table);
len = length(bits_stream);
stream=[];
temp_stream=[];

 for i=1:len
   temp_stream = cat(2,temp_stream,bits_stream(i));
   for j=1:nr
       if isequal(table{j,3},temp_stream)
           stream = cat(2,stream, table{j,1});
           temp_stream=[];
           continue;
       end
   end
 end
 
end
