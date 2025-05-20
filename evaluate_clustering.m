% evaluate_clustering.m
function evaluate_clustering(reduced, labels)
    figure;
    scatter3(reduced(:,1), reduced(:,2), reduced(:,3), 25, labels, 'filled');
    title('GMM Clustering in PCA-Reduced Space');
    xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
    grid on;
end