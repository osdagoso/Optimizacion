function value = getFeaturesBin(idFeature, items, maxCapacity)
    switch idFeature
        % Average of items 
        case 1 
            value = mean(items);
        % Standard dev
        case 2
            value = std(items);
        % Ratio of items greater than half capacity
        case 3
            value = size(items(items > maxCapacity / 2)) / size(items);
    end
end