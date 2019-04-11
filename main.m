%---C1769600 - George Browning
function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 09-Apr-2019 12:54:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
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

%load audio file that user chooses
filter1 = {'*.*'};
file = uigetfile(filter1);
[handles.y, handles.Fs] = audioread(file);
handles.stereoy = handles.y;

%apply a peak filter over the entire audio to normalise it
G = 0; fc = 11000; Q = 3; fb = 11000;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%save a copy of this audio so the user can revert any changes they make
%later
handles.originaly = handles.y;
handles.player = audioplayer(handles.originaly, handles.Fs);
audioplot = plot(handles.axes1, handles.y);
xlabel('Time');
ylabel('Audio Signal');

%enable all EQ-associated buttons
set(handles.pushbutton3,'Enable','on');
set(handles.playbutton, 'Enable', 'on');
set(handles.stopbutton, 'Enable', 'on');
set(handles.applybutton, 'Enable', 'on');
set(handles.reset, 'Enable', 'on');
set(handles.applywah, 'Enable', 'on');
set(handles.applyflanger, 'Enable', 'on');
set(handles.loadpreset, 'Enable', 'on');
set(handles.savepreset, 'Enable', 'on');

guidata(hObject, handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%save the audio in the EQ to a file
filter = {'*'};
file = uiputfile(filter);
audiowrite(file, handles.y, handles.Fs);
guidata(hObject, handles);


% --- Executes on button press in playbutton.
function playbutton_Callback(hObject, eventdata, handles)
% hObject    handle to playbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.player);



% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.player);


% --- Executes on button press in applybutton.
function applybutton_Callback(hObject, eventdata, handles)
% hObject    handle to applybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%when the user clicks apply, all the EQ filters are applied sequentially

%the shelving filter for band 1 and 10 is from
%https://uk.mathworks.com/matlabcentral/fileexchange/16568-bass-treble-shelving-filter
%by Jeff Tacket

%the peak filter for bands 2 through 9 is from "peakfilt.m" in
%DAFX: Digital Audio Effects Second Edition by Udo Zolzer - p65-66

%show a loading dialog to the user
set(handles.applying,'visible','on');
pause(0);

%band1
%get the gain value from the slider
G = get(handles.slider1, 'Value');
%specify a central frequency, a slope value, and a shelving type
fc = 31; Q = 3; type = "Base_Shelf";
%shelving.m returns values b and a
[b a] = shelving(G, fc, handles.Fs, Q, type);
%apply these values with filter() to y
handles.y = filter(b, a, handles.y);

%band2
%get the gain value from the slider
G = get(handles.slider2, 'Value');
%specify a central frequency, a slope value, and a frequency bandwidth
fc = 63; Q = 3; fb = 47;
%central frequency and frequency bandwidth must both be normalised to
%0<Wb,Wc<1
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
%peakfilt() applies a filter of this sort to y automatically
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band3
G = get(handles.slider3, 'Value');
fc = 125; Q = 3; fb = 93;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band4
G = get(handles.slider4, 'Value');
fc = 250; Q = 3; fb = 188;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band5
G = get(handles.slider5, 'Value');
fc = 500; Q = 3; fb = 375;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band6
G = get(handles.slider6, 'Value');
fc = 1000; Q = 3; fb = 750;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band7
G = get(handles.slider7, 'Value');
fc = 2000; Q = 3; fb = 1500;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band8
G = get(handles.slider8, 'Value');
fc = 4000; Q = 3; fb = 3000;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band9
G = get(handles.slider9, 'Value');
fc = 8000; Q = 3; fb = 6000;
Wc = 2*fc/handles.Fs;
Wb = 2*fb/handles.Fs;
handles.y = peakfilt(handles.y, Wc, Wb, G);

%band10
G = get(handles.slider10, 'Value');
fc = 16000; Q = 3; type = "Treble_Shelf";
[b a] = shelving(G, fc, handles.Fs, Q, type);
handles.y = filter(b, a, handles.y);

%gain
%multiply the final y values by the gain amount
G = get(handles.slider11, 'Value');
handles.y = G .* handles.y;

%panning
%peakfilt converts the audio back into mono, so it must be made into stereo
%for panning
handles.stereoy = [handles.y;handles.y];
pan = get(handles.panningslider, 'Value');
%flip the values of the slider to stop right and left panning being the
%wrong way around
pan = -pan;
%matpan.m retrieved from
%users.cs.cf.ac.uk/Dave.Marshall/CM0268/PDF/10_CM0268_Audio_FX.pdf
[handles.stereoy, handles.Fs] = matpan(handles.y, handles.Fs, pan);
%update the player with the final EQ'ed and panned audio
handles.player = audioplayer(handles.stereoy, handles.Fs);
%replot the audio
audioplot = plot(handles.axes1, handles.y);
xlabel('Time');
ylabel('Audio Signal');
%reset y to be the same as the original y value, this way any additional EQ
%changes are made to this and not the new audio.
handles.y = handles.originaly;
set(handles.applying,'visible','off');
guidata(hObject, handles);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%reset y to be its original value, reset the player and the plot as well
handles.y = handles.originaly;
handles.player = audioplayer(handles.originaly, handles.Fs);
audioplot = plot(handles.axes1, handles.originaly);
%set all sliders to their original state
set(handles.slider1,'Value',0);
set(handles.slider2,'Value',0);
set(handles.slider3,'Value',0);
set(handles.slider4,'Value',0);
set(handles.slider5,'Value',0);
set(handles.slider6,'Value',0);
set(handles.slider7,'Value',0);
set(handles.slider8,'Value',0);
set(handles.slider9,'Value',0);
set(handles.slider10,'Value',0);
set(handles.slider11,'Value',1);
set(handles.panningslider, 'Value', 0);
guidata(hObject, handles);


% --- Executes on button press in loadpreset.
function loadpreset_Callback(hObject, eventdata, handles)
% hObject    handle to loadpreset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load slider values from .mat file and set the corresponding sliders to be
%those values, then apply the EQ
reset_Callback(hObject, eventdata, handles);
filter = {'*.*'};
file = uigetfile(filter);
load(file, 'values');
set(handles.slider1, 'Value', values(1));
set(handles.slider2, 'Value', values(2));
set(handles.slider3, 'Value', values(3));
set(handles.slider4, 'Value', values(4));
set(handles.slider5, 'Value', values(5));
set(handles.slider6, 'Value', values(6));
set(handles.slider7, 'Value', values(7));
set(handles.slider8, 'Value', values(8));
set(handles.slider9, 'Value', values(9));
set(handles.slider10, 'Value', values(10));
set(handles.slider11, 'Value', values(11));
set(handles.panningslider, 'Value', values(12));
applybutton_Callback(hObject, eventdata, handles);
guidata(hObject, handles);

% --- Executes on button press in savepreset.
function savepreset_Callback(hObject, eventdata, handles)
% hObject    handle to savepreset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%saves all slider values to a .mat file
filter = {'.mat';'*.*'};
[file,path] = uiputfile(filter);
values = [get(handles.slider1, 'Value'); get(handles.slider2, 'Value');
    get(handles.slider3, 'Value'); get(handles.slider4, 'Value'); 
    get(handles.slider5, 'Value'); get(handles.slider6, 'Value'); 
    get(handles.slider7, 'Value'); get(handles.slider8, 'Value'); 
    get(handles.slider9, 'Value'); get(handles.slider10, 'Value'); 
    get(handles.slider11, 'Value'); get(handles.panningslider, 'Value')];
save(file, 'values');

% --- Executes on button press in loadcarrier.
function loadcarrier_Callback(hObject, eventdata, handles)
% hObject    handle to loadcarrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%loads a sound file, then displays it in the carrier audio window
filter1 = {'*.*'};
file = uigetfile(filter1);
[handles.y1, handles.fsx] = audioread(file);
handles.carrierplayer = audioplayer(handles.y1, handles.fsx);
plot(handles.carrieraxes, handles.y1);
guidata(hObject, handles);

%enable all carrier-associated buttons
set(handles.playcarrier,'Enable','on');
set(handles.stopcarrier, 'Enable', 'on');
set(handles.loadcrosssynth, 'Enable', 'on');



% --- Executes on button press in loadcrosssynth.
function loadcrosssynth_Callback(hObject, eventdata, handles)
% hObject    handle to loadcrosssynth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load modulating signal, then display it in modulating signal window
filter1 = {'*.*'};
file = uigetfile(filter1);
[handles.y2, handles.fsy] = audioread(file);
plot(handles.modaxes, handles.y2);
handles.modplayer = audioplayer(handles.y2, handles.fsy);

%This cross-synthesis code, including stft.m, istft.m, and specenv.m
%retrieved from
%https://uk.mathworks.com/matlabcentral/fileexchange/66200-cross-synthesis-example-with-matlab-implementation
%by Hristo Zhivomirov
x = handles.y1;
fsx = handles.fsx;
y = handles.y2;
fsy = handles.fsy;

x = x(:, 1);
y = y(:, 1);

% make x and y with equal sampling rate
fs = max(fsx, fsy);
if fsx > fsy
    y = resample(y, fsx, fsy);
else
    x = resample(x, fsy, fsx);
end

% make x and y with equal length
xlen = length(x);
ylen = length(y);
if xlen > ylen
    x = x(1:ylen);
else
    y = y(1:xlen);
end

% define the analysis and synthesis parameters
wlen = 1024;
hop = wlen/4;
nfft = wlen;

% perform time-frequency analysis
[X_stft, f] = stft(x, wlen, hop, nfft, fs);
[Y_stft, ~] = stft(y, wlen, hop, nfft, fs);

% memory optimization
clear x y

% extract spectral envelope of the carrier signal
X_stft_amp = abs(X_stft);
for k = 1:size(X_stft_amp, 2)
    X_env(:, k) = specenv(X_stft_amp(:, k), f);
end

% extract spectral envelope of the modulating signal
Y_stft_amp = abs(Y_stft);
for k = 1:size(Y_stft_amp, 2)
    Y_env(:, k) = specenv(Y_stft_amp(:, k), f);
end

% memory optimization
clear X_stft_amp Y_stft_amp Y_stft

% cross-synthesis
Z_stft = X_stft./X_env.*Y_env;
handles.z = istft(Z_stft, wlen, hop, nfft, fs);
handles.fsz = fs;
% memory optimization
clear X_stft Z_stft X_env Y_env

% send the resultant signal to the appropriate player
handles.synthplayer = audioplayer(handles.z, handles.fsz);

%enable all modulator-associated buttons
set(handles.playmodulator,'Enable','on');
set(handles.stopmodulator, 'Enable', 'on');
set(handles.applycrosssynth, 'Enable', 'on');
set(handles.playcrosssynth, 'Enable', 'on');
set(handles.stopcrosssynth, 'Enable', 'on');

guidata(hObject, handles);

% --- Executes on button press in applycrosssynth.
function applycrosssynth_Callback(hObject, eventdata, handles)
% hObject    handle to applycrosssynth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%puts the audio values from the cross-synthesis window into the main EQ
%window
handles.y = handles.z;
handles.Fs = handles.fsz;
handles.player = handles.synthplayer;
audioplot = plot(handles.axes1, handles.y);
handles.originaly = handles.y;
reset_Callback(hObject, eventdata, handles)

%enable all EQ-associated buttons
set(handles.pushbutton3,'Enable','on');
set(handles.playbutton, 'Enable', 'on');
set(handles.stopbutton, 'Enable', 'on');
set(handles.applybutton, 'Enable', 'on');
set(handles.reset, 'Enable', 'on');
set(handles.applywah, 'Enable', 'on');
set(handles.applyflanger, 'Enable', 'on');
set(handles.loadpreset, 'Enable', 'on');
set(handles.savepreset, 'Enable', 'on');

guidata(hObject, handles);

% --- Executes on button press in playcrosssynth.
function playcrosssynth_Callback(hObject, eventdata, handles)
% hObject    handle to playcrosssynth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.synthplayer);

% --- Executes on button press in stopcrosssynth.
function stopcrosssynth_Callback(hObject, eventdata, handles)
% hObject    handle to stopcrosssynth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.synthplayer);


% --- Executes on button press in playcarrier.
function playcarrier_Callback(hObject, eventdata, handles)
% hObject    handle to playcarrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.carrierplayer);

% --- Executes on button press in stopcarrier.
function stopcarrier_Callback(hObject, eventdata, handles)
% hObject    handle to stopcarrier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.carrierplayer);

% --- Executes on button press in playmodulator.
function playmodulator_Callback(hObject, eventdata, handles)
% hObject    handle to playmodulator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.modplayer);

% --- Executes on button press in stopmodulator.
function stopmodulator_Callback(hObject, eventdata, handles)
% hObject    handle to stopmodulator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.modplayer);


function wahedit_Callback(hObject, eventdata, handles)
% hObject    handle to wahedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wahedit as text
%        str2double(get(hObject,'String')) returns contents of wahedit as a double


% --- Executes during object creation, after setting all properties.
function wahedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wahedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in applywah.
function applywah_Callback(hObject, eventdata, handles)
% hObject    handle to applywah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%wah_wah.m retrieved from 
%users.cs.cf.ac.uk/Dave.Marshall/CM0268/PDF/10_CM0268_Audio_FX.pdf
%get the speed in Hz from the text box, wah_wah then returns the y and Fs
%values of the sound with wah applied
speed = get(handles.wahedit,'String');
[handles.wahy, handles.wahFs] = wah_wah(handles.y, handles.Fs, str2num(speed));
handles.wahplayer = audioplayer(handles.wahy, handles.wahFs);

%enable wah buttons
set(handles.loadwah, 'Enable', 'on');
set(handles.playwah, 'Enable', 'on');
set(handles.stopwah, 'Enable', 'on');

guidata(hObject, handles);

% --- Executes on button press in loadwah.
function loadwah_Callback(hObject, eventdata, handles)
% hObject    handle to loadwah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load the wah audio values into the main EQ
handles.y = handles.wahy;
handles.Fs = handles.wahFs;
handles.originaly = handles.y;
handles.player = handles.wahplayer;
audioplot = plot(handles.axes1, handles.y);
guidata(hObject, handles);

% --- Executes on button press in playwah.
function playwah_Callback(hObject, eventdata, handles)
% hObject    handle to playwah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.wahplayer);

% --- Executes on button press in stopwah.
function stopwah_Callback(hObject, eventdata, handles)
% hObject    handle to stopwah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.wahplayer);



function flangedit_Callback(hObject, eventdata, handles)
% hObject    handle to flangedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flangedit as text
%        str2double(get(hObject,'String')) returns contents of flangedit as a double


% --- Executes during object creation, after setting all properties.
function flangedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flangedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in applyflanger.
function applyflanger_Callback(hObject, eventdata, handles)
% hObject    handle to applyflanger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%flanger.m adapted from 
%users.cs.cf.ac.uk/Dave.Marshall/CM0268/PDF/10_CM0268_Audio_FX.pdf
%get speed in % from the text box
%flanger then returns y and Fs of the flanged audio
speed = get(handles.flangedit,'String');
[handles.flay, handles.flaFs] = flanger(handles.y, handles.Fs, str2num(speed));
handles.flaplayer = audioplayer(handles.flay, handles.flaFs);

%enable flanger buttons
set(handles.loadflanger, 'Enable', 'on');
set(handles.playflanger, 'Enable', 'on');
set(handles.stopflanger, 'Enable', 'on');

guidata(hObject, handles);

% --- Executes on button press in loadflanger.
function loadflanger_Callback(hObject, eventdata, handles)
% hObject    handle to loadflanger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%load the audio into the main EQ
handles.y = handles.flay;
handles.Fs = handles.flaFs;
handles.originaly = handles.y;
handles.player = handles.flaplayer;
audioplot = plot(handles.axes1, handles.y);
guidata(hObject, handles);

% --- Executes on button press in playflanger.
function playflanger_Callback(hObject, eventdata, handles)
% hObject    handle to playflanger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
play(handles.flaplayer);

% --- Executes on button press in stopflanger.
function stopflanger_Callback(hObject, eventdata, handles)
% hObject    handle to stopflanger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.flaplayer);


% --- Executes on slider movement.
function panningslider_Callback(hObject, eventdata, handles)
% hObject    handle to panningslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function panningslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panningslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
