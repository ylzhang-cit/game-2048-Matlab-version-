This is the midterm project for course ACM 11 “Matlab and Matehmatica” at Caltech in 2015 Spring.

To play the game 2048, you can run start2048 or interface2048(N) where N is a positive integer.

“interface2048” is designed by GUIDE. All major functions are included in this file.

Initialize returns the initial N-by-N matrix, 0 score, 0 step.

“MyFigure” draws the m-by-n patches for input 2048 matrix that all elements of A should be 0,2,4,8,16,32,64 ...

“MyMerge” returns the new matrix, score, step, move, wrong after merging the matrix

“Leftmerge” merges the matrix along the left direction and returns new matrix, score, step, and move

“newbox” generates new figures to show ‘Wrong KeyPress’, ‘You Win’, ‘Game Over’, and corresponding button options.
