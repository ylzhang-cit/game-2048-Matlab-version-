function [ini_matrix,ini_score,ini_step] = Initialize(N)
% this function returns initial 4-by-4 matrix, 0 score, 0 step
% the entire program generates 2048 game with N-by-N tiles

ini_matrix=zeros(N);
ini_position=randi(N^2,1,2);
% randomly choose two positions
ini_number=(rand(1,2)>0.75);
ini_matrix(ini_position(1))=2^(1+ini_number(1));
ini_matrix(ini_position(2))=2^(1+ini_number(2));
% generate two numbers with 75% probability of 2 and 25% of 4
ini_score=0;
ini_step=0;


% a=1:16;
% ini_matrix=reshape(2.^a,4,4);

end


