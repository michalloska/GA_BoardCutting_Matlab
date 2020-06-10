function decodedRectVec = decodeChromosome(p_chromosome, p_oneChromSize, p_planksSizes)
    decodedRectVec = [];
    numOfRect = length(p_chromosome) / p_oneChromSize
    for i = 0 : numOfRect - 1
        tempChrom = p_chromosome(1,i*p_oneChromSize+1 : (i+1)*p_oneChromSize )
        decodedRect.posX = bin2dec(convertVecOfNumToString(tempChrom(1:12)));
        decodedRect.posY = bin2dec(convertVecOfNumToString(tempChrom(13:24)));
        decodedRect.width = (p_planksSizes(i+1,1));
        decodedRect.height = (p_planksSizes(i+1,2));
        decodedRect.area = (decodedRect.width * decodedRect.height);
        decodedRect.isRotated = (tempChrom(25));
        decodedRect.exists = (tempChrom(26));
        if i == 0
            decodedRectVec = [decodedRect];
        else
            decodedRectVec = [decodedRectVec decodedRect];
        end
    end
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
