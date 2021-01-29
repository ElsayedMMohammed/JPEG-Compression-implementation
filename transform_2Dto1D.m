function vec = transform_2Dto1D(block)

%  This function transform the 2D 8x8 matrix to 1D vector using the (ziz-zag)
%%  Inputs:
    % block: A 8x8 block
%% Outputs:
    % out : The output 1D vector (1*64)
%% The algorithm:
 % (1) Initializations
    [rows,cols] = size(block); 
    j=1; sum=1;
    vec=zeros(1,rows*cols);
 % (2) (CHECK!) Block should be squared
 if (rows ~= cols) 
    return; 
 end
 
  % (3) First Half
for iteration = 1:rows
   sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            vec(1,j)=block(i,sum-i);
        else
            vec(1,j)=block(sum-i,i);
        end
        j=j+1;
    end
end

  % (4) Second Half
for iteration = rows-1:-1:1
  sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            vec(1,j)=block(i+sum-(rows+1),sum-(i+sum-(rows+1)));
        else
            vec(1,j)=block(sum-(i+sum-(rows+1)),i+sum-(rows+1));
        end
        j=j+1;
    end
end
end