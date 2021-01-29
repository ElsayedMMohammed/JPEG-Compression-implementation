function block_f=perform_dct(block,bases)

%This function performs the DCT for a 8x8 matrix
%% Inputs:
    % block: 8x8 matrix
    % bases: The used DCT bases functions.
%% Outputs:
    % block_f : 8x8 matrix in the frequency domain after using DCT.
    
block_f = zeros(size(block));
for u=1:8
    for v=1:8
        base = bases{u,v};
        block_f(u,v)=sum(block.*base,'all');  
    end
end
block_f=block_f/16;
block_f(1,:)=block_f(1,:)/2;
block_f(:,1)=block_f(:,1)/2;
end