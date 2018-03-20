function mainKP
    % Assuming that the table has the following format [ID, Profit, Weight, Profit/Weight]
    KP = [1 1900 410 1900/410; 2 1312 720 1312/720; 3 190 41 190/41;
          4 1312 720 1312/720; 5 820 450 820/450; 6 1520 328 1520/328;
          7 820 450 820/450; 8 984 540 984/540; 9 190 41 190/41;
          10 164 90 164/90; 11 380 82 380/82; 12 1312 720 1312/720;
          13 1640 900 1640/900; 14 984 540 984/540; 15 760 164 760/164;
          16 380 82 380/82; 17 1312 720 1312/720; 18 1640 900 1640/900;
          19 164 90 164/90; 20 1640 900 1640/900];
    heuristics = [4 2 3];
    hyperHeuristics = [0.1 0.2 0.3; 0.9 0.5 0.1; 0.5 0.8 0.6];
    features = [1 6 7];
    backpack.capacity = 900;
    backpack.items = [];
    backpack.profit = 0;
    while ~isempty(KP)
        idHeuristic = getHeuristicByEuclideanDistance(KP, hyperHeuristics, features);    
        [KP, output] = getItemByHeuristic(heuristics(idHeuristic), KP);
        if output(3) <= backpack.capacity
            backpack.capacity = backpack.capacity - output(3);
            backpack.items = [backpack.items output(1)];
            backpack.profit = backpack.profit + output(2);
        end
    end
    disp(backpack);
end