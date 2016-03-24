function varargout = interface2048(varargin)
% INTERFACE2048 MATLAB code for interface2048.fig
%      INTERFACE2048, by itself, creates a new INTERFACE2048 or raises the existing
%      singleton*.
%
%      H = INTERFACE2048 returns the handle to a new INTERFACE2048 or the handle to
%      the existing singleton*.
%
%      INTERFACE2048('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE2048.M with the given input arguments.
%
%      INTERFACE2048('Property','Value',...) creates a new INTERFACE2048 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface2048_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface2048_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface2048

% Last Modified by GUIDE v2.5 16-May-2015 11:55:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface2048_OpeningFcn, ...
                   'gui_OutputFcn',  @interface2048_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT





% --- Executes just before interface2048 is made visible.
function interface2048_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface2048 (see VARARGIN)


% the following program lines initialize all parameters and figures
handles.N=varargin{1};
[handles.matrix,handles.score,handles.step]=Initialize(handles.N);
set(handles.myscore,'String',{'Scores:  ';num2str(handles.score)}); 
set(handles.mystep,'String',{'Steps:  ';num2str(handles.step)});
handles.first2048=1; 
    % this number will be used when you get the 1st 2048
handles.figure=MyFigure(handles.matrix);
    % Myfigure generates the 4-by-4 tiles of game 2048


% Choose default command line output for interface2048
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface2048 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface2048_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% when you push the button 'New Game', 
% then all parameters and figures will be initialized
[handles.matrix,handles.score,handles.step]=Initialize(handles.N);
set(handles.myscore,'String',{'Scores:  ';num2str(handles.score)}); 
set(handles.mystep,'String',{'Steps:  ';num2str(handles.step)});
handles.first2048=1;
handles.figure=MyFigure(handles.matrix);

% Update handles structure
guidata(hObject, handles);






% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% this function detects your key-press and executes corresponding operations
mat=handles.matrix;
sc=handles.score;
st=handles.step;

[handles.matrix,handles.score,handles.step,move,wrong]=...
    MyMerge(mat,sc,st,eventdata.Key);
% MyMerge algorithm returns new parameters according to key-press

if wrong
    newbox(1);
    % if you press wrong key, a new box will appears showing
    % 'Wrong KeyPress', and you have an option to continue

else
    
str1={'Scores: '; num2str(handles.score)};
set(handles.myscore,'String',str1); 
str2={'Steps:  ';num2str(handles.step)};
set(handles.mystep,'String',str2);
handles.figure=MyFigure(handles.matrix);
pause(0.01); 
% show the new 4-by-4 tiles, scores and steps after merging 

Max=max(max(handles.matrix));
if (Max==2048)&&(handles.first2048==1)
    % if the maximum number is 2048 and it is the first 2048
    newbox(3);
    % then a new box appears showing 'You Win!'
    % and you have an option to continue
    handles.first2048=0;
end

if move
   % after running the function MyMerge, if some tiles move,
   % it will generate a new tile on empty positions
   
   zeros_position=find(handles.matrix==0);
       % find empty position
   [zeros_num,~]=size(zeros_position);
   new_num=2^(1+(rand(1)>0.75));
       % generate a number with 75% probability of 2 and 25% of 4
   new_position=zeros_position(randi(zeros_num));
       % randomly choose an empty position
   handles.matrix(new_position)=new_num;
   handles.figure=MyFigure(handles.matrix);
       % draw the 4-by-4 tiles including new tile after merging

else  % no tile moves after running the function MyMerge
    [D,~]=size(handles.matrix);
    gameover=isequal(handles.matrix>1,ones(D));
        % if all number are nonzero, gameover=1
    if gameover
        % if no tile moves and all number are nonzero, then game over
        newbox(2);
        % a new box appears showing 'Game Over'
        % you have only one option to start a new game
        
        % after you push the button 'New Game!',
        % then all parameters and figures will be initialized
       
        [handles.matrix,handles.score,handles.step]=Initialize(handles.N);
        set(handles.myscore,'String',{'Scores:  ';num2str(handles.score)}); 
        set(handles.mystep,'String',{'Steps:  ';num2str(handles.step)});
        handles.first2048=1;
        handles.figure=MyFigure(handles.matrix);
        
    end
    
    % if no tile moves and empty position exists, it doesn't do anything
end


end
% Update handles structure
guidata(hObject, handles);



