%Tạo function Highpass filter 
%% Parameters:
% filter_type ——————————filter type
% order——————————filter order (level −
% Wavelet or point——Fir)
% raw_data——————————raw PPG signal
% Fs——————————sample frequency
% fc——————————Cutoff Frequency

function [filtered_data, filter_SOS] = PPG_Highpass(raw_data, filter_type, order, sample_freq, fc)
    Fn = sample_freq / 2;

    switch filter_type
        case 1
            [A, B, C, D] = butter(order, fc / Fn, 'high');
            [filter_SOS, g] = ss2sos(A, B, C, D);
            filtered_data = filtfilt(filter_SOS, g, raw_data);

        case 2
            [A, B, C, D] = cheby1(order, 0.1, fc / Fn, 'high');
            [filter_SOS, g] = ss2sos(A, B, C, D);
            filtered_data = filtfilt(filter_SOS, g, raw_data);

        case 3
            [A, B, C, D] = cheby2(order, 20, fc / Fn, 'high');
            [filter_SOS, g] = ss2sos(A, B, C, D);
            filtered_data = filtfilt(filter_SOS, g, raw_data);

        case 4
            [A, B, C, D] = ellip(order, 0.1, 30, fc / Fn, 'high');
            [filter_SOS, g] = ss2sos(A, B, C, D);
            filtered_data = filtfilt(filter_SOS, g, raw_data);

        case 5
            d = fir1(order, fc / Fn, 'high');
            filtered_data = filtfilt(d, 1, raw_data);

        case 6
            d = designfilt('highpassfir', 'FilterOrder', order, 'StopbandFrequency', fc - 0.2, ...
                           'PassbandFrequency', fc, 'DesignMethod', 'ls', 'SampleRate', sample_freq);
            filtered_data = filtfilt(d, raw_data);

        case 7
            filtered_data = smooth(raw_data, order);

        case 8
            filtered_data = medfilt1(raw_data, order);

        case 9
            filtered_data = wden(raw_data, 'modwtsqtwolog', 's', 'mln', order, 'db2');
    end
end
