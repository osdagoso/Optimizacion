function mainBin
    bin = {};
    items = [0.2 0.3 0.6 0.1 0.9 0.5 0.1 0.2 0.4 0.7 0.8 0.3 0.2 0.1];
    heuristics = [1 3 2];
    hyperHeuristics = [0.5 0.5 0.5; 0.2 0.2 0.2; 0.7 0.7 0.7];
    featuresV = [1 2 3];
    maxCapacity = 0.9;
    while (~isempty(items))
        idHeuristic = getHeuristicByEuclideanDistanceBin(items, hyperHeuristics, featuresV, maxCapacity);
        [bin, items] = placeItemByHeuristic(heuristics(idHeuristic), bin, maxCapacity, items);
    end
    avgwaste = 0;
    for i = 1 : size(bin,2)
        disp(bin{i});
        avgwaste = avgwaste + maxCapacity - sum(bin{i});
    end
    avgwaste = avgwaste / (size(bin,2) * maxCapacity);
    disp(avgwaste);
end
