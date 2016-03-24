function h=MyFigure(A)
% this function draws the m-by-n patches for input 2048 matrix
% all elements of A should be 0,2,4,8,16,32,64 ...

[m,n]=size(A);
x_edge=1/n*0.04*[1,-1,-1,1];
y_edge=1/m*0.04*[-1,-1,1,1];
patch([0,1,1,0]-x_edge,[1,1,0,0]-y_edge,[0.6,0.6,0.6]);
% draw a big patch
for i=1:m
    for j=1:n
        x=1/n*[j-1,j,j,j-1]+x_edge;
        y=1/m*[m-i+1,m-i+1,m-i,m-i]+y_edge;
        % the position of the tile corresponding to A(i,j)
        
        mycolor=[255,255,224;
            255,228,181;
            244,164,96;
            255,165,0;
            255,99,71;
            255,69,0;
            255,0,0;
            255,255,102;
            255,215,0;
            255,255,0;
            0,255,0;
            0,255,255;
            64,224,208;
            100,149,237;
            30,144,255;
            0,0,255]/255; % rgb color
        
        if A(i,j)>=2
             if A(i,j)<=2^16
                 patch(x,y,mycolor(log(A(i,j))/log(2),:));
             else 
                 patch(x,y,mycolor(16,:))
             end
             
             value=A(i,j);
             text(1/n*(j-1+0.5),1/m*(m-i+1-0.5), num2str(value), ...
                'FontSize', 30, ...
                'FontWeight', 'bold', ...
                'Color', 'Black', ...
                'HorizontalAlignment', 'Center');
            
        else % A(i,j) are 0, draw a white patch
            patch(x,y,[240 240 240 ]/255)
        end
    end


end
axis off
axis equal
xlim([-1/n*0.04,1+1/n*0.04]);
ylim([-1/m*0.04,1+1/m*0.04]);

h=gcf;


