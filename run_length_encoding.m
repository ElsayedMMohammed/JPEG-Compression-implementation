function out = run_length_encoding(block)
%  This function transform the 2D 8x8 matrix to 1D vector using the (ziz-zag)
%  and then applies run length encoding to the 1D vector
%%  Inputs:
    % block: A 8x8 block
%% Outputs:
    % out : The output 1D vector (1*64)

 %% The algorithm  
    % (1) Tranform to 1D vector 
         vec = transform_2Dto1D(block);
   %  (2) Initializations..
   len = length(vec);
   counter=0;  out = []; i=1; 
   
   %  (3) Run length Encoding..
   while i<=len
    if vec(i) == 0
       while vec(i) == 0
        counter=counter+1;
        i=i+1;
            if i>len % Stopping Condition
                break;
            end
       end
       out = [out 0 counter];
       counter=0;
   else
       out = [out vec(i)];
       i=i+1;
   end
   end
end