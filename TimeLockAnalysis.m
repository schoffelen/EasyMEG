function varargout = TimeLockAnalysis(varargin)
% LOWPASSFILTER MATLAB code for LowPassFilter.fig
%      LOWPASSFILTER, by itself, creates a new LOWPASSFILTER or raises the existing
%      singleton*.
%
%      H = LOWPASSFILTER returns the handle to a new LOWPASSFILTER or the handle to
%      the existing singleton*.
%
%      LOWPASSFILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOWPASSFILTER.M with the given input arguments.
%
%      LOWPASSFILTER('Property','Value',...) creates a new LOWPASSFILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LowPassFilter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LowPassFilter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LowPassFilter

% Last Modified by GUIDE v2.5 29-Aug-2016 12:39:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TimeLockAnalysis_OpeningFcn, ...
                   'gui_OutputFcn',  @TimeLockAnalysis_OutputFcn, ...
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


% --- Executes just before TimeLockAnalysis is made visible.
function TimeLockAnalysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TimeLockAnalysis (see VARARGIN)

% Choose default command line output for TimeLockAnalysis
handles.output = hObject;
handles.cfg = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TimeLockAnalysis wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TimeLockAnalysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.cfg;

delete(handles.figure1);



% --- Executes on button press in btnOk.
function btnOk_Callback(hObject, eventdata, handles)
% hObject    handle to btnOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
channel = [];

if get(handles.checkboxMEG,'value')
    channel{length(channel)+1} = 'meg';
end

if get(handles.checkboxEEG,'value')
    channel{length(channel)+1} = 'eeg';
end

if get(handles.checkboxEOG,'value')
    channel{length(channel)+1} = 'eog';
end

if get(handles.checkboxECG,'value')
    channel{length(channel)+1} = 'ecg';
end

if get(handles.checkboxEMG,'value')
    channel{length(channel)+1} = 'emg';
end

if get(handles.checkboxALL,'value')
    channel = 'all';
end

cfg = [];
cfg.channel = channel;
cfg.trails = eval(get(handles.editTrails,'String'));

if get(handles.rbtnKeepTrailsYes,'Value')
    cfg.keeptrials = 'yes';
else
    cfg.keeptrials = 'no';
end

if get(handles.rbtnVarLength0,'Value');
    cfg.vartrllength = 0;
elseif get(handles.rbtnVarLength1,'Value');
    cfg.vartrllength = 1;
else
    cfg.vartrllength = 2;
end

if get(handles.checkboxCovariance,'Value')
    cfg.covariance = 'yes';
    cfg.covariancewindow = eval(get(handles.editCovWindow,'String'));
    if get(handles.rbtnRmMeanYes,'Value')
        cfg.removemean = 'yes';        
    else
        cfg.removemean = 'no';
    end
end

handles.cfg = cfg;
guidata(hObject, handles);

uiresume(handles.figure1);


% --- Executes on button press in btnCancel.
function btnCancel_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.figure1);



% --- Executes during object creation, after setting all properties.
function editBandPass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBandPass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBandPass_Callback(hObject, eventdata, handles)
% hObject    handle to editBandPass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBandPass as text
%        str2double(get(hObject,'String')) returns contents of editBandPass as a double


% --- Executes on button press in checkboxALL.
function checkboxALL_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxALL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxALL


% --- Executes on button press in checkboxMEG.
function checkboxMEG_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxMEG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxMEG


% --- Executes on button press in checkboxEEG.
function checkboxEEG_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxEEG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxEEG


% --- Executes on button press in checkboxEOG.
function checkboxEOG_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxEOG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxEOG


% --- Executes on button press in checkboxECG.
function checkboxECG_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxECG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxECG


% --- Executes on button press in checkboxEMG.
function checkboxEMG_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxEMG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxEMG


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
% The GUI is still in UIWAIT, us UIRESUME
    uiresume(hObject);
else
% The GUI is no longer waiting, just close it
    delete(hObject);
end


% --- Executes on button press in checkboxCovariance.
function checkboxCovariance_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxCovariance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxCovariance



function editCovWindow_Callback(hObject, eventdata, handles)
% hObject    handle to editCovWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCovWindow as text
%        str2double(get(hObject,'String')) returns contents of editCovWindow as a double


% --- Executes during object creation, after setting all properties.
function editCovWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCovWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbtnRmMeanYes.
function rbtnRmMeanYes_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnRmMeanYes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnRmMeanYes
if get(hObject,'Value')
    set(handles.rbtnRmMeanNo,'Value',0);
else
    set(handles.rbtnRmMeanNo,'Value',1);
end

% --- Executes on button press in rbtnRmMeanNo.
function rbtnRmMeanNo_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnRmMeanNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnRmMeanNo
if get(hObject,'Value')
    set(handles.rbtnRmMeanYes,'Value',0);
else
    set(handles.rbtnRmMeanYes,'Value',1);
end


% --- Executes on button press in rbtnKeepTrailsYes.
function rbtnKeepTrailsYes_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnKeepTrailsYes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnKeepTrailsYes
if get(hObject,'Value')
    set(handles.rbtnKeepTrailsNo,'Value',0);
else
    set(handles.rbtnKeepTrailsNo,'Value',1);
end

% --- Executes on button press in rbtnKeepTrailsNo.
function rbtnKeepTrailsNo_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnKeepTrailsNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnKeepTrailsNo
if get(hObject,'Value')
    set(handles.rbtnKeepTrailsYes,'Value',0);
else
    set(handles.rbtnKeepTrailsYes,'Value',1);
end

% --- Executes on button press in rbtnVarLength0.
function rbtnVarLength0_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnVarLength0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnVarLength0
if get(hObject,'Value')
    set(handles.rbtnVarLength1,'Value',0);
    set(handles.rbtnVarLength2,'Value',0);
else
    set(handles.rbtnVarLength1,'Value',1);
    set(handles.rbtnVarLength2,'Value',1);
end


% --- Executes on button press in rbtnVarLength1.
function rbtnVarLength1_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnVarLength1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnVarLength1
if get(hObject,'Value')
    set(handles.rbtnVarLength0,'Value',0);
    set(handles.rbtnVarLength2,'Value',0);
else
    set(handles.rbtnVarLength0,'Value',1);
    set(handles.rbtnVarLength2,'Value',1);
end

% --- Executes on button press in rbtnVarLength2.
function rbtnVarLength2_Callback(hObject, eventdata, handles)
% hObject    handle to rbtnVarLength2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbtnVarLength2
if get(hObject,'Value')
    set(handles.rbtnVarLength0,'Value',0);
    set(handles.rbtnVarLength1,'Value',0);
else
    set(handles.rbtnVarLength0,'Value',1);
    set(handles.rbtnVarLength1,'Value',1);
end


function editTrails_Callback(hObject, eventdata, handles)
% hObject    handle to editTrails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTrails as text
%        str2double(get(hObject,'String')) returns contents of editTrails as a double


% --- Executes during object creation, after setting all properties.
function editTrails_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTrails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end