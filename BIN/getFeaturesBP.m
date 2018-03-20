function value = getFeaturesBP(id, items1, items2)
    switch id
        % Ratio of items2 load and maximum load
        case  1
            value = sum(items2) / (sum(items1) + sum(items2));
    end
end