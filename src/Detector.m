function varargout = Detector(varargin)
% DETECTOR MATLAB code for Detector.fig
%      DETECTOR, by itself, creates a new DETECTOR or raises the existing
%      singleton*.
%
%      H = DETECTOR returns the handle to a new DETECTOR or the handle to
%      the existing singleton*.
%
%      DETECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECTOR.M with the given input arguments.
%
%      DETECTOR('Property','Value',...) creates a new DETECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Detector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Detector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Detector

% Last Modified by GUIDE v2.5 06-May-2017 21:58:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Detector_OpeningFcn, ...
                   'gui_OutputFcn',  @Detector_OutputFcn, ...
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


% --- Executes just before Detector is made visible.

function Detector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Detector (see VARARGIN)

% Choose default command line output for Detector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Detector wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Detector_OutputFcn(hObject, eventdata, handles) 
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
global looper;
looper = 0;
drawnow();
%% Read in image
set(handles.text4,'string','');
n=get(handles.edit1,'string');
I = imread(n);
axes(handles.axes1)
handles.axes1 = imshow(I);
set(handles.text4,'string','Image Loaded');
drawnow();

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global looper;
looper = 1;
set(handles.text4,'string','Select Object');
n=get(handles.edit1,'string');
nnet=alexnet; 
I = imread(n);
while looper
Selection = getrect;
I2=imcrop(I,(Selection));
picture=imresize(I2,[227,227]);
label=classify(nnet,picture);
%set(handles.edit1,'String',char(label))
handles.axes1 = rectangle('position',(Selection),'EdgeColor','k','linewidth',3);
     x1 = Selection(1,1)+5;
     y1 = Selection(1,2)+10;
     %display(y1);
handles.axes1 = text(x1,y1,char(label),'color','k','FontSize',15);
%handles.drawLabel = text(bbox(1,1),bbox(1,2),'object','color',rndColor);
     %X_Cut_Min = Selection(1,1);
     %Y_Cut_Min = Selection(1,2);
     %X_Cut_Max = Selection(1,3) + Selection(1,1);
     %Y_Cut_Max = Selection(1,4) + Selection(1,2);
     %X_Cut_Min = X_Cut_Min/1000;
     %Y_Cut_Min = Y_Cut_Min/1000;
     %X_Cut_Max = X_Cut_Max/1000;
     %Y_Cut_Max = Y_Cut_Max/1000;
     %display(X_Cut_Min)
     %display(Y_Cut_Min)
     %display(X_Cut_Max)
     %display(Y_Cut_Max)
%handles.axes1 = annotation('textbox',[X_Cut_Min,Y_Cut_Min,X_Cut_Max,Y_Cut_Max],'String', char(label));
%annotation('textbox',(Selection),'String', char(label))
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text4,'string','Loading');
drawnow();
n=get(handles.edit1,'string');
nnet=alexnet;
I = imread(n);

Im=I;

rmat=Im(:,:,1);
gmat=Im(:,:,2);
bmat=Im(:,:,3);

%subplot(2,2,1), imshow(rmat);
%title('Red Plane');
%subplot(2,2,2), imshow(gmat);
%title('Green Plane');
%subplot(2,2,3), imshow(bmat);
%title('Blue Plane');
%subplot(2,2,4), imshow(I);
%title('Original Image');

%%
levelr = 0.63;
levelg = 0.5;
levelb = 0.4;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
Isum = (i1&i2&i3);

% Plot the data
%subplot(2,2,1), imshow(i1);
%title('Red Plane');
%subplot(2,2,2), imshow(i2);
%title('Green Plane');
%subplot(2,2,3), imshow(i3);
%title('Blue Plane');
%subplot(2,2,4), imshow(Isum);
%title('Sum of all the planes');

%% Complement Image and Fill in holes
Icomp = imcomplement(Isum);
Ifilled = imfill(Icomp,'holes');
%figure, imshow(Ifilled);

%% Morphological filter
se = strel('disk', 25);
Iopenned = imopen(Ifilled,se);
% figure,imshowpair(Iopenned, I);
%imshow(Iopenned);

%% Extract features

Iregion = regionprops(Iopenned, 'centroid');
[labeled,numObjects] = bwlabel(Iopenned,4);
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
eccentricities = [stats.Eccentricity];

idxOfObjects = find(eccentricities);
statsDefects = stats(idxOfObjects);

%figure, imshow(I); 
set(handles.text4,'string','Annotating');
drawnow();
for idx = 1 : length(idxOfObjects)
    % pause(0.01) % Do something important
    I2=imcrop(I,statsDefects(idx).BoundingBox);
    %imshow(I2);
    picture=imresize(I2,[227,227]);
    label=classify(nnet,picture);
    handles.axes1 = rectangle('position',(statsDefects(idx).BoundingBox),'EdgeColor','k','linewidth',3);
     x1 = statsDefects(idx).BoundingBox(1,1)+5;
     y1 = statsDefects(idx).BoundingBox(1,2)+10;
     %display(y1);
handles.axes1 = text(x1,y1,char(label),'color','k','FontSize',15);
        %h = rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',2);
        %set(h,'EdgeColor',[.75 0 0]);
        %hold on;
        drawnow()
end
set(handles.text4,'string','Done!');


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
axes(hObject)
x=imread('BackG.jpg');
imshow(x)
%set(axes1,'handlevisibility','off')

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
set(gca,'xtick',[])
set(gca,'ytick',[])

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%
global looper;
camera = webcam(2);
nnet=alexnet;
looper = 1;
while looper
    picture=camera.snapshot;
    picture=imresize(picture,[227,227]);
    label=classify(nnet,picture);
    set(handles.text4,'string',char(label));
    handles.axes1=imshow(picture);
    %title(char(label));
    %drawnow;
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global looper;
looper = 0;
