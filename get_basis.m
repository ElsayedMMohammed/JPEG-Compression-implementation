function basis = get_basis()

% This function returns the basis functions for DCT 'Discrete Cosine
%% Outputs:
    % basis: 8x8 Cell array of the bases functions of DCT
    
x =(0:7); y =(0:7);
basis = cell(8,8);
for u=1:8
    bx = cos((2*(x)+1)*(u-1)*pi/16);
    for v =1:8
        by = cos((2*(y)+1)*(v-1)*pi/16);
        basis{u,v}= bx'*by;
    end
end
end
