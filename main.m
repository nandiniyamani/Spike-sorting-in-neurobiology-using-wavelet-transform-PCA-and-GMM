clear; clc;

% Step 1: Simulate or load data
[data, fs, raw_signal] = preprocess_spikes();  % Modified to return raw signal

% Plot raw signal (before filtering)
figure;
plot((1:length(raw_signal))/fs, raw_signal);
title('Raw Signal (Before Filtering)');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot filtered signal
figure;
plot((1:length(data))/fs, data);
title('Filtered Signal (After Bandpass)');
xlabel('Time (s)');
ylabel('Amplitude');

% Step 2: Extract wavelet features
features = wavelet_features(data);

% Plot wavelet features
figure;
imagesc(features);
colormap jet;
colorbar;
title('Extracted Wavelet Features');
xlabel('Feature Index');
ylabel('Spike Number');

% Step 3: Reduce dimensionality using PCA
reduced_features = reduce_dim_pca(features);

% Plot PCA 2D
figure;
scatter(reduced_features(:,1), reduced_features(:,2), 25, 'filled');
title('PCA Projection (2D)');
xlabel('PC1');
ylabel('PC2');
grid on;

% Step 4: Cluster using GMM
[labels, gmm_model] = gmm_clustering(reduced_features);

% Step 5: Visualize and evaluate in 3D
evaluate_clustering(reduced_features, labels);