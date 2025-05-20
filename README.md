# 🧠 Spike-sorting-in-neurobiology-using-wavelet-transform-PCA-and-GMM

This project implements a complete **spike sorting pipeline** in MATLAB using **Wavelet Transform**, **Principal Component Analysis (PCA)**, and **Gaussian Mixture Models (GMM)**. It simulates neural data, extracts spike features, reduces dimensionality, and performs unsupervised clustering to classify spikes from multiple neurons.

---

## 📌 Objective

- Simulate extracellular recordings with spikes from different neurons.
- Extract time-frequency features using **Discrete Wavelet Transform**.
- Apply **PCA** to reduce dimensionality and enhance cluster separation.
- Use **GMM clustering** to assign spikes to neuron-specific groups.
- Visualize each step for interpretability and validation.

---

## 📁 File Structure

| File                  | Description |
|-----------------------|-------------|
| `main.m`              | Runs the complete pipeline from data generation to evaluation |
| `preprocess_spikes.m` | Generates synthetic spike data and applies bandpass filtering |
| `wavelet_features.m`  | Extracts spike features using wavelet decomposition |
| `reduce_dim_pca.m`    | Reduces features to top 3 principal components |
| `gmm_clustering.m`    | Clusters the data using Gaussian Mixture Models |
| `evaluate_clustering.m`| Plots 3D scatter of clustered PCA-reduced features |

---

## 🧪 Methodology

### 1. Simulated Data  
Synthetic spikes from 3 neurons were injected into Gaussian noise to replicate realistic recordings.

### 2. Signal Preprocessing  
Bandpass filtered between **300–3000 Hz** using a 4th-order Butterworth filter.

### 3. Feature Extraction  
Wavelet coefficients were extracted from 64-sample windows using the **Daubechies 4 (db4)** wavelet.

### 4. Dimensionality Reduction  
Used PCA to project features into a **3D subspace** retaining most variance.

### 5. Clustering  
**GMM with Expectation-Maximization** was used to identify 3 spike classes based on PCA features.

### 6. Evaluation  
- PCA 2D and 3D plots show distinct spike clusters.
- GMM assigns probabilities, providing soft classification of spikes.

---

## 📊 Results

- **Wavelet features** captured subtle spike shape differences.
- **PCA projections** revealed separable clusters in 2D/3D space.
- **GMM clustering** achieved accurate classification of spike types.

---

## 📚 References

1. Lewicki, M. (1998). *A review of methods for spike sorting*. Network: Computation in Neural Systems.
2. Rey et al. (2015). *Past, present and future of spike sorting techniques*. Brain Research Bulletin.
3. Quiroga et al. (2004). *Unsupervised spike detection and sorting with wavelets*. Neural Computation.

---

## 🛠️ Skills & Tools Used

- MATLAB, Signal Processing Toolbox
- Wavelet Decomposition (`wavedec`)
- PCA (`pca`)
- GMM Clustering (`fitgmdist`, `cluster`)
- Data Visualization (`plot`, `scatter3`, `imagesc`)

---

## 💡 Future Work

- Integrate real extracellular recordings.
- Explore other clustering methods (e.g., DBSCAN, HDBSCAN).
- Optimize for real-time performance in embedded systems.

---

