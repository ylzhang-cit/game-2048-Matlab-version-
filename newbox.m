function newbox(integer)
hFig = figure('Position',[965 300 200 100]);
hFig.ToolBar='none';
hFig.MenuBar='none';

hText = uicontrol(hFig,... % this UI object lies under hFig
'Style','text',... % it is a text
'Units','normalized',... % the unit is relative position
'Position',[0.1,0.65,0.8,0.25],... 
'FontSize',20 ...
);
hButton = uicontrol(hFig,... % this UI object lies under hFig
'Style','pushbutton',... % it is a pushbutton
'Units','normalized',... % the unit is relative position
'Position',[0.1,0.1,0.8,0.5],... 
'FontSize',20,...
'CallBack',@Mycontinue);

switch integer
    case 1
        hText.String='Wrong KeyPress!';
        hButton.String='Continue!';

    case 2
        hText.String='Game Over!';
        hButton.String='New Game!';
        
    case 3
        hText.String='You Win!';
        hButton.String='Continue!';
        
end

uiwait(hFig);

end


function Mycontinue( uiobj, eventdata )
close
end
