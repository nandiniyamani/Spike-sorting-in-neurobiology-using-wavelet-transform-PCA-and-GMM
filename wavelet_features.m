% wavelet_features.m
function features = wavelet_features(data)
    spike_len = 64;
    threshold = 4 * median(abs(data))/0.6745;
    spike_idx = find(data > threshold);
    spike_idx = spike_idx(spike_idx > spike_len & spike_idx < length(data)-spike_len);
    spike_idx = unique(round(spike_idx));

    num_spikes = length(spike_idx);
    features = zeros(num_spikes, spike_len);
    for i = 1:num_spikes
        segment = data(spike_idx(i)-31:spike_idx(i)+32);
        [C, ~] = wavedec(segment, 4, 'db4');
        features(i, :) = C(1:spike_len);
    end
end