% gmm_clustering.m
function [labels, model] = gmm_clustering(reduced)
    options = statset('MaxIter', 500);
    model = fitgmdist(reduced, 3, 'Options', options, 'Replicates', 5);
    labels = cluster(model, reduced);
end