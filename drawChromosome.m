function nothingToReturn = drawChromosome(p_chromosomes, p_generationNum)
    l_currentFitness = calculateFitnessFromDecodedChromes(p_chromosomes, p_generationNum);
    for i = 1:length(p_chromosomes)
        drawPlannedPlankExt(p_chromosomes(i).posX , p_chromosomes(i).posY , p_chromosomes(i).width , p_chromosomes(i).height , p_chromosomes(i).isRotated , p_chromosomes(i).exists, p_generationNum, l_currentFitness)
    end
end

function nothingToReturn = drawPlannedPlankExt(p_xCord , p_yCord , p_plankWidth , p_plankHeight , p_isRotated , p_exists , p_generationNum, p_currentFitness)
    hold on
    X = 2800;
    Y = 2070;
    set(gca, 'ydir', 'reverse')
    x = linspace(0,X,X+1);
    y = linspace(0,Y,Y+1);
    figure(69);
    title(["Najlepszy rozklad w gen " num2str(p_generationNum) ', fit= ' num2str(p_currentFitness)]);

    rectangle('Position', [0, 0, X, Y]);
    chcol = getRandomColor();
    if p_isRotated == 0 && p_exists == 1
        rectangle('Position', [p_xCord, p_yCord, p_plankWidth, p_plankHeight], 'FaceColor', chcol);
    elseif p_isRotated == 1 && p_exists == 1
        rectangle('Position', [p_xCord, p_yCord, p_plankHeight, p_plankWidth], 'FaceColor', chcol);
    end
    hold off
end

function chosenColor = getRandomColor()
    colors = ["blue";
              "red";
              "black";
              "cyan";
              "magenta";
              "white";
              "green";
              "yellow"];
    chosenColor = colors(ceil(rand * length(colors)));
end