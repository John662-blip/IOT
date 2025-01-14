%Tạo function bandpass filter 
%% Parameters :
% filter_type ———————————filter type
% order——————————————————filter order
% raw_data———————————————raw PPG signal
% Fs—————————————————————sampling frequency
% fL—————————————————————lower cutoff frequency
% fH—————————————————————higher cutoff frequency

function [filtered_data] = PPG_Bandpass(raw_data, filter_type, order, Fs, fL, fH)

Fn = Fs/2;

switch filter_type
    case 1
        [A,B,C,D] = butter(order, [fL fH]/Fn);
        [filter_SOS, g] = ss2sos(A,B,C,D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 2
        [A,B,C,D] = cheby1(order, 0.1, [fL fH]/Fn);
        [filter_SOS, g] = ss2sos(A,B,C,D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 3
        [A,B,C,D] = cheby2(order, 20, [fL fH]/Fn);
        [filter_SOS, g] = ss2sos(A,B,C,D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 4
        [A,B,C,D] = ellip(order, 0.1, 30, [fL fH]/Fn);
        [filter_SOS, g] = ss2sos(A,B,C,D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 5
        d = fir1(order, [fL fH]/Fn, 'bandpass');
        filtered_data = filtfilt(d, 1, raw_data);
    case 6
        d = designfilt('bandpassfir', 'FilterOrder', order, 'StopbandFrequency1', fL-0.2, 'PassbandFrequency1', fL, ...
                        'PassbandFrequency2', fH, 'StopbandFrequency2', fH+2, 'DesignMethod', 'ls', 'SampleRate', Fs);
        filtered_data = filtfilt(d, raw_data);
    case 7
        filtered_data = smooth(raw_data, order);
    case 8
        filtered_data = medfilt1(raw_data, order);
    case 9
        filtered_data = wden(raw_data, 'modwtsqtwolog', 's', 'mln', order, 'db2'); %Wavelet level: order
end

end
