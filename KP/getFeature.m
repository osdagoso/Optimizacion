function value = getFeature(id, items)
    % Assuming that the table has the following format [ID, Profit, Weight, Profit/Weight]
    items(:, 2) = items(:, 2) ./ max(items(:, 2));
    items(:, 3) = items(:, 3) ./ max(items(:, 3));
    switch id
        % Profit mean
        case 1
            value = mean(items(:, 2));
        % Profit stdev
        case 2
            value = std(items(:, 2));
        % Profit median
        case 3
            value = median(items(:, 2));
        % Weight mean
        case 4
            value = mean(items(:, 3));
        % Weight stdve
        case 5
            value = std(items(:, 3));
        % Weight median
        case 6
            value = median(items(:, 3));
        % Correlation between weight and items profit, divided by 2 plus
        % 0.5 corr(w,p)
        case 7
            value = corr(items(:, 3), items(:, 2)); 
    end
end