function [data, fs, raw_signal] = preprocess_spikes()
    fs = 10000;

    % Define spike shapes over a short window (10 ms)
    t_spike = 0:1/fs:0.01;  % 10 milliseconds
    spike1 = sin(2*pi*300*t_spike).*exp(-100*(t_spike-0.005).^2);
    spike2 = cos(2*pi*250*t_spike).*exp(-100*(t_spike-0.005).^2);
    spike3 = sin(2*pi*400*t_spike).*exp(-100*(t_spike-0.005).^2);
    spike_len = length(spike1);

    % Define full signal duration
    t = 0:1/fs:5;  % 5 seconds
    signal = 0.2*randn(size(t));
    signal_len = length(signal);

    max_index = signal_len - spike_len;
    if max_index < 1
        needed_duration = (spike_len + 1) / fs;
        error('Signal too short. Increase duration to at least %.2f seconds.', needed_duration);
    end

    % Random spike times
    spike_times1 = randi([1, max_index], 1, 20);
    spike_times2 = randi([1, max_index], 1, 20);
    spike_times3 = randi([1, max_index], 1, 20);

    % Inject spikes
    for k = spike_times1
        signal(k:k+spike_len-1) = signal(k:k+spike_len-1) + spike1;
    end
    for k = spike_times2
        signal(k:k+spike_len-1) = signal(k:k+spike_len-1) + spike2;
    end
    for k = spike_times3
        signal(k:k+spike_len-1) = signal(k:k+spike_len-1) + spike3;
    end

    % Bandpass filter
    [b, a] = butter(4, [300 3000]/(fs/2), 'bandpass');
    raw_signal = signal;  % Before filtering
    data = filtfilt(b, a, signal);
end
