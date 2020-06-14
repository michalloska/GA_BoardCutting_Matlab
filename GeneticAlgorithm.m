function [BestChrom]  = GeneticAlgorithm (popSize, chromosomeSize, amtOfGenerations, Pc, Pm, Er, planksSizes,visuailzation)

cgcurve = zeros(1 , amtOfGenerations);
[ population ] = initialization(popSize, chromosomeSize, planksSizes);
currentPenaltyFactor = 1.2;

for i = 1 : popSize
    population.Chromosomes(i).fitness = calculateFitnessFromDecodedChromes(population.Chromosomes(i).Gene, 1, currentPenaltyFactor);
end

g = 1;
disp(['Generation #' , num2str(g)]);
[max_val, indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
cgcurve(g) = population.Chromosomes(indx(1)).fitness;

if visuailzation == 1
    drawChromosome(population.Chromosomes(indx(1)).Gene , g);
end

currentFit_prev = 0;
currentFitIter = 0;
for g = 2 : amtOfGenerations
    disp(['Generation #' , num2str(g)]);
    for i = 1 : popSize
        population.Chromosomes(i).fitness = calculateFitnessFromDecodedChromes(population.Chromosomes(i).Gene, g, currentPenaltyFactor);
    end

    [max_val, indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
    if visuailzation == 1
        clf(69);
        drawChromosome(population.Chromosomes(indx(1)).Gene , g);
    end

    currentFit = population.Chromosomes(indx(1)).fitness;

    if currentFit == currentFit_prev
        currentFitIter = currentFitIter + 1;
    else
        currentFitIter = 0;
    end
    if mod(currentFitIter,10) == 0 && currentFitIter ~= 0
        currentPenaltyFactor = currentPenaltyFactor + 0.1;
        Pc = 1;
        Pm = 1;
    end

    if currentFitIter == 0
        Pc = 0.8;
        Pm = 0.4;
    end
    currentFit_prev = population.Chromosomes(indx(1)).fitness;

    for k = 1: 2: popSize
        % Selection
        [ parent1, parent2] = selection(population);

        % Crossover
        [child1 , child2] = crossover(parent1 , parent2, Pc, 'single');

        % Mutation
        [child1] = mutation(child1, Pm);
        [child2] = mutation(child2, Pm);

        newPopulation.Chromosomes(k).Gene = child1.Gene;
        newPopulation.Chromosomes(k+1).Gene = child2.Gene;
    end

    for i = 1 : popSize
        newPopulation.Chromosomes(i).fitness = calculateFitnessFromDecodedChromes(newPopulation.Chromosomes(i).Gene, g, currentPenaltyFactor);
    end

    [ newPopulation ] = addEliteFromPrevPop(population, newPopulation, Er);
    [max_val, indx] = sort([ newPopulation.Chromosomes(:).fitness ] , 'descend');
    cgcurve(g) = newPopulation.Chromosomes(indx(1)).fitness;
    population = newPopulation;
end

[max_val, indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
BestChrom.Gene    = population.Chromosomes(indx(1)).Gene;
BestChrom.Fitness = population.Chromosomes(indx(1)).fitness;
drawChromosome(population.Chromosomes(indx(1)).Gene , g);

end
