function img_2 = run_length_decoding(vec,new_size)
  % This functions perform run length decoding of 1D array to convert it to
  % the original 1D array before run length encoding.
  % In addition, it transforms the 1D vector to 2D matrix using the zigzag
  % criteria.
  
  %% Inputs:
    % vec:      The 1D vector to be transformmed
    % new_size: The needed size for the 2D output matrix
  %% Outputs:
    % img_2:    The output 2D matrix after run length decoding and 2D
    % transformation
    
   %% The algorithm
   len = length(vec);
   out = []; i=1;
   
 % Run length Decoding..
   while i<=len
     if vec(i)==0 
        out = [out zeros(1,vec(i+1))];
        i = i + 2;
     else
       out = [out vec(i)];
       i=i+1;
     end
   end
   
  %1D to 2D Transformation
rows= new_size(1); cols=new_size(2);
img_2 = zeros(new_size);
i = 1;

for n_row=1:rows/8
    for n_col=1:cols/8
        n_start_row = 8*(n_row-1)+1; n_start_col = 8*(n_col-1)+1;
       temp= out(i:i+63);
        temp_2D = transform_1Dto2D(temp);
        img_2(n_start_row:n_start_row+7,n_start_col:n_start_col+7)= temp_2D;
        i = i+64;
    end
end

 %% Transform 1D to 2D block

 % temp= out(i,i+63);
 % temp_2D = transform_1Dto2D(temp);
  
end