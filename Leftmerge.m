function [mat,score,step,move]=Leftmerge(mat,score,step)
% this function merges the matrix along the left direction
% and returns new matrix, score, step, move


[m,n]=size(mat);
mat_before=mat;

for i=1:m
    rowvec=mat(i,:);
    nonzeros=find(rowvec);
    % find nonzero numbers in the row vector
    [~,N1]=size(nonzeros);
    
    
    if N1>1  
    % if the number of nonzeros is greater than 1, we'll merge them
        
        j=1;
        while j<N1
        
            if mat(i,nonzeros(j+1))==mat(i,nonzeros(j))

               mat(i,nonzeros(j))=2*mat(i,nonzeros(j));
               mat(i,nonzeros(j+1))=0;
               % merge mat(i,nonzeros(j+1)) into mat(i,nonzeros(j))
               score=score+mat(i,nonzeros(j));
               j=j+2; 
               % after merging, compare the next pair of nonzeros
            else 
               j=j+1;
               % if no merger, compare the next nonzero number with
               % the following nonzero number
            
            end
        
        end
    end
    
    rowvec2=mat(i,:);
    nonzeros2=find(rowvec2);
    [~,N2]=size(nonzeros2);
    
    if (N2>0)&&(N2<n)
        mat(i,1:N2)=mat(i,nonzeros2(1:N2));
        mat(i,N2+1:n)=0;
        % move the nonzero numbers to the left positions
    end
    
end

move=~(isequal(mat_before,mat));
% if the matrix doesn't change, move=0

step=step+1*(move>0);

end

