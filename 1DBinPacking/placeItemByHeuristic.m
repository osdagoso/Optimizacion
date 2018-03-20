function [bin, items] = placeItemByHeuristic(id, bin, maxCapacity, items)
    itFits = false;
    switch id
        %First fit
        case 1 
            for i  = 1 : size(bin, 2)
                x = sum(bin{i});
                if maxCapacity - x >= items(1)
                    itFits = true;
                    bin{i} = [bin{i} items(1)];
                    break;
                end
            end
        %Best Fit
        case 2
            index = -1;
            best = intmax;
            for i  = 1 : size(bin, 2)
                x = sum(bin{i});
                if maxCapacity - x >= items(1)
                    if maxCapacity - x - items(1) < best 
                        best = maxCapacity - x - items(1);
                        index = i;
                    end
                 end
            end
            if index ~= -1 
                bin{index} = [bin{index} items(1)];
                itFits = true;
            end 
            
        %Worst Fit
        case 3
            index = -1;
            worst = -1;
            for i  = 1 : size(bin, 2)
                x = sum(bin{i});
                if maxCapacity - x >= items(1)
                    if maxCapacity - x - items(1) > worst 
                        worst = maxCapacity - x - items(1);
                        index = i;
                    end
                 end
            end
            if index ~= -1 
                bin{index} = [bin{index} items(1)];
                itFits = true;
            end 
        %Almost Worst Fit
        case 4
           index = -1;
           worst = -1;
           indexNTB = -1;
           notThatBad = -1;
           for i  = 1 : size(bin, 2)
               x = sum(bin{i});
               if maxCapacity - x >= items(1)
                   if maxCapacity - x - items(1) > worst
                       notThatBad = worst;
                       indexNTB = index;
                       worst = maxCapacity - x - items(1);
                       index = i;
                   elseif maxCapacity - x - items(1) > notThatBad
                       notThatBad = maxCapacity - x - items(1);
                       indexNTB = i;
                   end
                end
           end
           if index ~= -1 && indexNTB ~= -1 
               bin{indexNTB} = [bin{indexNTB} items(1)];
               itFits = true;
           end  
           if index ~= -1 && indexNTB == -1 
               bin{index} = [bin{index} items(1)];
               itFits = true;
           end 
    end
    if ~itFits
        bin{size(bin, 2) + 1} = [items(1)];
    end
    items(1) = [];
end
