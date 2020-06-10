function [ population ] = initialization(popSize, chromosomeSize, p_planksSizes)
    for i = 1 : popSize
        for j = 1 : chromosomeSize
            Gene.posX = generateNumberInRange(0, 2800);
            Gene.posY = generateNumberInRange(0, 2070);
            Gene.width = p_planksSizes(j,1);
            Gene.height = p_planksSizes(j,2);
            Gene.area = Gene.width * Gene.height;
            Gene.isRotated = generateNumberInRange(0,1);
            Gene.exists = generateNumberInRange(0,1);
            population.Chromosomes(i).Gene(j) = Gene;
        end
    end

end
