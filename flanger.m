%---C1769600 - George Browning
% Ronan O'Malley
% October 5th 2005
% Chorus.m
% M Script that creates a single delay  with the delay time ocilating from either 0-3 ms or 0-15 ms at 0.1 - 5 Hz
% this is not synthesisable unless buffering is used
% Possibility for extension:
%   - need to perfect allowable ranges
%   - do calculations with sampling frequency to convert delay in samples into miliseconds (need some 44.1kHz samples)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y, Fs] = flanger(x, Fs, rate)

% current sample is 11kHz so 0-3 ms is 0 - 33 samples

% read the sample waveform
% parameters to vary the effect %

max_time_delay=0.003; % 3ms max delayin seconds


index=1:length(x);

% sin reference to create oscillating delay
sin_ref = (sin(2*pi*index*(rate/Fs)))';    % sin(2pi*fa/fs);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


max_samp_delay=round(max_time_delay*Fs); %convert delay in ms to max delay in samples


y = zeros(length(x),1);       % create empty out vector



y(1:max_samp_delay)=x(1:max_samp_delay); % to avoid referencing of negative samples


amp=0.7; % suggested coefficient from page 71 DAFX

% for each sample
for i = (max_samp_delay+1):length(x),
    cur_sin=abs(sin_ref(i));    %abs of current sin val 0-1
    cur_delay=ceil(cur_sin*max_samp_delay);  % generate delay from 1-max_samp_delay and ensure whole number  
    y(i) = (amp*x(i)) + amp*(x(i-cur_delay));   % add delayed sample
end