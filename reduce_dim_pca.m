% reduce_dim_pca.m
function reduced = reduce_dim_pca(features)
    [coeff, score, ~] = pca(features);
    reduced = score(:, 1:3);
end