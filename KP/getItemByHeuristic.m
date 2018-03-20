function [items, itemOutput] = getItemByHeuristic(id, items)
    % Asumiendo que la tabla tiene el formato [ID, Profit, Weight, Profit/Weight]
    switch id
        % Default
        case 1
            itemOutput = items(1, :);
            items(1, :) = [];
        % Max Profit
        case 2
            itemMaxColumn = items(:, 2);
            [~, item] = max(itemMaxColumn);
            itemOutput = items(item, :);
            items(item, :) = [];
        % Min Weight
        case 3
            itemMinColumn = items(:, 3);
            [~, item] = min(itemMinColumn);
            itemOutput = items(item, :);
            items(item, :) = [];
        % Max Profit / Weight    
        case 4
            itemRelationColumn = items(:, 4);
            [~, item] = max(itemRelationColumn);
            itemOutput = items(item, :);
            items(item, :) = [];
    end
end