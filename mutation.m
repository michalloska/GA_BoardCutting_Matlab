function [child] = mutation(child, Pm)
    Gene_no = length(child.Gene);

    for k = 1: Gene_no
        R = rand();
        if R < Pm
            mutationPoint = generateNumberInRange(1,4);
            switch mutationPoint
                case 1
                    child.Gene(k).posX = generateNumberInRange(0,2800);
                case 2
                    child.Gene(k).posY = generateNumberInRange(0,2070);
                case 3
                    child.Gene(k).isRotated = generateNumberInRange(0,1);
                case 4
                    child.Gene(k).exists = generateNumberInRange(0,1);
                otherwise
                    dist('error');
            end
        end
    end
end