function p_decodedChromes = checkIfRectsOverlap(p_decodedChromes)
    lenToIter = length(p_decodedChromes);
    for i = 1:lenToIter
        for j = i:lenToIter
            if j ~= i && p_decodedChromes(i).exists == 1 && p_decodedChromes(j).exists == 1
                p_decodedChromes(i).area = (p_decodedChromes(i).area - checkIfTwoRectsOverlap(p_decodedChromes(i), p_decodedChromes(j)) );
            end
        end
    end
end