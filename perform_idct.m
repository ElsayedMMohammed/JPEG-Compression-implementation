function new_block = perform_idct(block_f,bases)
%This function performs the IDCT for a 8x8 matrix
%% Inputs:
    % block_f: 8x8 The matrix in the frequency domain after using DCT.
    % bases:  The used DCT/IDCT bases functions.
%% Outputs:
    % block_f : The 8x8 matrix after performing IDCT
    
new_block = zeros(size(block_f));
for u=1:8
    for v=1:8
        base = bases{u,v};
        new_block=new_block + block_f(u,v).*base;  
    end
end

end