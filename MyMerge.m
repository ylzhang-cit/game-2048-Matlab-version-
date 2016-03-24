function [mat,score,step,move,wrong]=MyMerge(mat,score,step,arrow)
% this function returns the new matrix, score, step, move, wrong

wrong=0;
switch arrow
    case 'leftarrow'
        [mat,score,step,move]=Leftmerge(mat,score,step);
        % Leftmerge function merge the tiles along the left direction
        
    case 'rightarrow'
        mat(:,1:end)=mat(:,end:-1:1);
        [mat,score,step,move]=Leftmerge(mat,score,step);
        mat(:,1:end)=mat(:,end:-1:1); 
        % merge the tiles along the right direction
        
    case 'uparrow'
        mat=mat';
        [mat,score,step,move]=Leftmerge(mat,score,step);
        mat=mat'; 
        % merge the tiles along the up direction
        
    case 'downarrow'
        mat=mat';
        mat(:,1:end)=mat(:,end:-1:1);
        [mat,score,step,move]=Leftmerge(mat,score,step);
        mat(:,1:end)=mat(:,end:-1:1);
        mat=mat';
        % merge the tiles along the down direction
        
    otherwise
        % if wrong key is pressed, then no tile moves,
        % wrong input is true
        move=0;
        wrong=1;     
        
end        




end