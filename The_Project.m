 function varargout = The_Project(varargin)
% THE_PROJECT MATLAB code for The_Project.fig
%      THE_PROJECT, by itself, creates a new THE_PROJECT or raises the existing
%      singleton*.
%
%      H = THE_PROJECT returns the handle to a new THE_PROJECT or the handle to
%      the existing singleton*.
%
%      THE_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THE_PROJECT.M with the given input arguments.
%
%      THE_PROJECT('Property','Value',...) creates a new THE_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before The_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to The_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help The_Project

% Last Modified by GUIDE v2.5 29-May-2015 21:54:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @The_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @The_Project_OutputFcn, ...
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


% --- Executes just before The_Project is made visible.
function The_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to The_Project (see VARARGIN)

% Choose default command line output for The_Project
handles.output = hObject;
set(handles.axes1,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes The_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = The_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global img 
[filename,pathname]=imgetfile();
if pathname 
msgbox('Plz Choose Your Image','error','Error');
return
end
img=imread(filename);
axes(handles.axes1);
imshow(img);
title('Loaded Image'); 



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

global img 
contents = get(hObject,'value')
switch contents 
    case 1 
     imshow(img); 
     
               % averge method  GrayScale=(R+G+B)/3
case 2
y2=(img(:,:,1)+img(:,:,2)+img(:,:,3))/3; 
imshow(y2); title('Average method');
 
               % Weighted method 0.3*R + 0.59*G + 0.11*B
               
    case 3   
y3 = (0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11* img(:,:,3));
imshow(y3); title('Weighted methed');
 
               % Lightness Method GrayScale=(max([R,G,B])+min([R,G,B]))/2
    case 4 
        for i=1:size(img,1);
for j=1:size(img,2);
 y4(i,j)=(max([img(i,j,1),img(i,j,2),img(i,j,1)])+min([img(i,j,1),img(i,j,2),img(i,j,3)]))/2;
end
        end
        imshow(y4); title('Lightness method');
    otherwise
end


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global img 
for i=1:size(img,1);
    for j=1:size(img,2);
        flip(i,(size(img,2)-j)+1,:)=img(i,j,:);
    end
end
imshow(flip); title('Flipped');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global img
for i=1:size(img,1);
    for j=1:size(img,2);
        Negative_Transpose(j,i,:)=255-img(i,j,:);
    end
end
imshow(Negative_Transpose); title('Negative & Transpose');

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% global img
% 
% if (hObject==handles.Dublurring)
%   PSF = fspecial('motion', 21, 12);
%   blurred = imfilter(img, PSF, 'conv', 'circular');
%  imshow(blurred);
%          
% else if (hObject==handles.Gaussian)
%    
%  G = imnoise(img,'gaussian',0,0.25);
%       
%    imshow(G) ; title('Gaussian Method');
%     else
%            S=imnoise(i,'salt & pepper',0.25); 
%       
%        imshow(S); title('salt & pepper Method');
%     end
        


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global img
imblack=im2bw(img);
imshow(imblack); title('Black & White');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global img
imshow(img); title('Load Image');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% œÊ—«‰ 90 œ—ÃÂ „‰ «·Ì”«—
global img
for i=1:size(img,1)
    for j=1:size(img,2);
      NewImage((size(img,2)+1) -j ,i,:) = img(i,j,:);
    end
end
      imshow(NewImage); title('90 Degree At Left');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
%œÊ—«‰ 180 œ—ÃÂ „‰ «·Ì”«—
global img 
for i=1:size(img,1)
    for j=1:size(img,2);
      NewImage((size(img,1)+1) -i ,j,:) = img(i,j,:);
    end
end
      imshow(NewImage); title('180 Degree At Left');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

%œÊ—«‰ 90 œ—ÃÂ „‰ «·Ì„Ì‰
global img 
for i=1:size(img,1)
    for j=1:size(img,2);
        B(j,size(i,1)+i,:)=img(i,j,:);
    end
end
imshow(B); title('90 Degree At Right');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img 
G = imnoise(img,'gaussian',0,0.20);
imshow(G); title('Gaussian');

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img ;

           S=imnoise(img,'salt & pepper',0.20); 
       imshow(S); title('salt & pepper Method');


% --- Executes on button press in pushbutton5.


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img ;
 PSF = fspecial('motion', 31, 21);
  blurred = imfilter(img, PSF, 'conv', 'circular');
 imshow(blurred); title('Dublurring');
         


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
global img ;
imshow(img); title('RGB ^_^');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
global img ;

     red=img(1:size(img,1),1:size(img,2),1);   
 
imshow(red); title('RED');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
global img ;

     green=img(1:size(img,1),1:size(img,2),2);   
imshow(green); title('GREEN');


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
 global img ;

     blue=img(1:size(img,1),1:size(img,2),3);   
imshow(blue); title('BLUE');


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global img ;
s=str2num(get(handles.edit1,'string'));
for i=1:size(img,1);
    for j=1:size(img,2);
        Relpucation((s*i)-1,(s*j)-1,:)=img(i,j,:);
         Relpucation((s*i)-1,s*j,:)=img(i,j,:);
          Relpucation((s*i),(s*j)-1,:)=img(i,j,:);
           Relpucation(s*i,s*j,:)=img(i,j,:);
    end
end

figure(1) ,imshow(Relpucation);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global img ;
image = MyGrayScale(img);
imshow(image,'parent',handles.axes1);
guidata(hObject,handles);
