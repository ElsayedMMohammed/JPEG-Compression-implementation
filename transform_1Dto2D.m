function block = transform_1Dto2D(vec)

%  This function transform the 1D vector to 8x8 matrixusing the (ziz-zag)
%  criteria

%%  Inputs:
    % vec  : 1D vector (1x64)
%% Outputs:
    % block: 8x8 matrix
 
%% The algorithm..
% (1) Initialization
len = length(vec);
rows = sqrt(len);

j=1; sum=1;
block=zeros(rows,rows);

% First Half
for iteration = 1:rows
   sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            block(i,sum-i) = vec(1,j);
        else
            block(sum-i,i) = vec(1,j);
        end
        j=j+1;
    end
end

% Second Half
for iteration = rows-1:-1:1
  sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            block(i+sum-(rows+1),sum-(i+sum-(rows+1)))=vec(1,j);
        else
            block(sum-(i+sum-(rows+1)),i+sum-(rows+1)) = vec(1,j);
        end
        j=j+1;
    end
end
end