function words= jpeg_huffman_table(prs)

% This function generates a huffman look-up table for encoding/decoding depending on the symbols' probabilities 

%% Input:
%       prs : a 2D-cell array of 2 columns:
%              The 1st column includes the symbols
%              The 2nd column includes the corresponding probabilities   
%% Output:
%      words: a 2D-cell array of 3 columns:
%              The 1st column includes the symbols sorted descendingly
%              accrording to the probabilities (column 2)
%              The 2nd column includes the corresponding probabilities 
%              The 3rd column includes the corresponging binary
%              representation using huffman encoding algorithm.

len = length(prs);
words = cell(len,3);
probabilities = cell2mat(prs(:,2));
words(:,1) = prs(:,1);
words(:,2) = num2cell(probabilities');
words = sortrows(words,[2],'descend');
words(end-1,3) = num2cell(0); words(end,3) = num2cell(1);
temp = words(:,2:3);
temp(:,2) = num2cell(linspace(1,len,len))';

times = len-2;

for i=1:times
new_temp = cell(len-i,2);
new_temp(1:end-1,1:2) = temp(1:end-2,1:2);
new_temp{end,1} = temp{end-1,1}+temp{end,1};
new_temp{end,2} = cat(2,temp{end-1,2},temp{end,2});
temp = new_temp;
temp = sortrows(temp,[1],'descend');

 for j=0:1
   idx = length(temp{end-j,2});
   for i=1:idx
     words{temp{end-j,2}(i),3} = cat(2,j,words{temp{end-j,2}(i),3});
   end  
 end
   
end

end