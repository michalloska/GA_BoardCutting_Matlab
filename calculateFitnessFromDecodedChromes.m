
function calculatedFitness = calculateFitnessFromDecodedChromes(p_decodedChromes, p_genNum, p_currentPenaltyFactor)
    calculatedFitness = 0;
    l_mainPlank.posX = 0;
    l_mainPlank.posY = 0;
    l_mainPlank.width = 2800;
    l_mainPlank.height = 2070;
    l_mainPlank.area = l_mainPlank.width * l_mainPlank.height;
    l_mainPlank.isRotated = 0;
    l_mainPlank.exists = 1;
    sumOfAllFitnesses = 0;
    PenaltyFit = 0;
    PenaltyFit_mainPlank = 0;
    persistent l_penaltyFactor;

    l_penaltyFactor = p_currentPenaltyFactor;

    for i = 1:length(p_decodedChromes)
        if p_decodedChromes(i).exists == 1
            sumOfAllFitnesses = sumOfAllFitnesses + p_decodedChromes(i).area;
        end
    end

    lenToIter = length(p_decodedChromes);
    for i = 1:lenToIter
        for j = i:lenToIter
            if j ~= i && p_decodedChromes(i).exists == 1 && p_decodedChromes(j).exists == 1
                PenaltyFit = PenaltyFit + checkIfTwoRectsOverlap(p_decodedChromes(i), p_decodedChromes(j))^l_penaltyFactor;
            end
        end
    end

    for i = 1:length(p_decodedChromes)
        if p_decodedChromes(i).exists == 1
            PenaltyFit_mainPlank = PenaltyFit_mainPlank + (p_decodedChromes(i).area - checkIfTwoRectsOverlap(p_decodedChromes(i), l_mainPlank))^l_penaltyFactor;
        end
    end
    calculatedFitness = sumOfAllFitnesses - PenaltyFit - PenaltyFit_mainPlank;
end

function convertedVec = convertVecOfNumToString(p_vector)
    convertedVec = "";
    for i = 1:length(p_vector)
       if p_vector(1,i) == 1
           convertedVec = strcat(convertedVec, "1");
       else
           convertedVec = strcat(convertedVec, "0");
       end
    end
end
