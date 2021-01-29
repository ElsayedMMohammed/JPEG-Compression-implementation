function sys_probs = get_probabilities(data)

% This function calculates the symbols' probabilities in an input vector.
%% Input:
%       data : The vector of teh symbols
%% Output:
%       sys_probs = 2D Cell array; the first column is the symbols
%                                  the second column is the corresponging probabilities

[counts,symbols]=hist(data,unique(data)); 
probability=counts./length(data);
sys_probs = cell(length(symbols),2);
for i=1:length(symbols)
 sys_probs{i,1} = symbols(i);
 sys_probs{i,2} = probability(i);
end

end