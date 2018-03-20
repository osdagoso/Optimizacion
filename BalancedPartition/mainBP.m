function mainBP
    items1 = [17 21 9 15 27 27 3 6 1 13 0 14 20 8 20];
    items2 = [];
    heuristics = [1 2];
    hyperHeuristics = [0.25; 0.5];
    features = [1];
    while (getFeaturesBP(1, items1, items2) < 0.5)
        idHeuristic = getHeuristicByEuclideanDistanceBP(items1, items2, hyperHeuristics, features);
        [items1, items2] = getItemByHeuristicBP(heuristics(idHeuristic), items1, items2);
    end
    disp(items1);
    disp(items2);
    disp(getQBP(items1, items2));
end