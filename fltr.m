function y=fltr(x,n,fs)
y2=normalize(x);
% Delete DC offset
y3=detrend(y2);
% Rectification
rec_y=abs(y3);
% High pass filter with cutoff frequency of 5 Hz
[d,c]=butter(n,0.5/(fs),'high'); 
yh=filtfilt(d,c,rec_y);
yh=abs(yh);
% % High pass filter with cutoff frequency of 500 Hz
[b,a]=butter(n,80/(fs),'low'); 
% Filtering the Raw signal
y=filtfilt(b,a,yh);
end