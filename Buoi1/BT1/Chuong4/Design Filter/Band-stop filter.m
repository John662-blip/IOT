%Tạo function band-stop filter 
%% Parameters:
% filter_type ———————————filter type
% order——————————————————filter order
% raw_data———————————————raw PPG signal
% Fs—————————————————————sampling frequency
% fL—————————————————————lower cutoff frequency
% fH—————————————————————higher cutoff frequency

function [filtered_data] = PPG_Bandstop(raw_data, filter_type, order, Fs, fL, fH)

Fn = Fs/2;

switch filter_type
    case 1
        [A,B,C,D] = butter(order, [fL fH]/Fn, 'stop');
        [filter_SOS, g] = ss2sos(A, B, C, D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 2
        [A,B,C,D] = cheby1(order, 0.1, [fL fH]/Fn, 'stop');
        [filter_SOS, g] = ss2sos(A, B, C, D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 3
        [A,B,C,D] = cheby2(order, 20, [fL fH]/Fn, 'stop');
        [filter_SOS, g] = ss2sos(A, B, C, D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 4
        [A,B,C,D] = ellip(order, 0.1, 30, [fL fH]/Fn, 'stop');
        [filter_SOS, g] = ss2sos(A, B, C, D);
        filtered_data = filtfilt(filter_SOS, g, raw_data);
    case 5
        d = fir1(order, [fL fH]/Fn, 'stop');
        filtered_data = filtfilt(d, 1, raw_data);
    case 6
        % Placeholder for further filter types (if needed)
end

end
