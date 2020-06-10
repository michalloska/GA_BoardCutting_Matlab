function nothingToReturn = saveOutputData(p_BestChrome, p_fileName, p_planksSizes)
    fileID = fopen('output.txt','w');

    BestChromTotalArea = 0;
    for i = 1:length(p_BestChrome.Gene)
        if p_BestChrome.Gene(i).exists == 1
            BestChromTotalArea = BestChromTotalArea + p_BestChrome.Gene(i).area;
        end
    end
    disp(['The total Area: ' num2str(BestChromTotalArea)]);

    fprintf(fileID,'%d\n',BestChromTotalArea);

    for i = 1:length(p_BestChrome.Gene)
        if p_BestChrome.Gene(i).exists == 1
            if i == length(p_BestChrome.Gene)
                fprintf(fileID,'%d %d %d %d %d',p_planksSizes(i,1), p_planksSizes(i,2), p_BestChrome.Gene(i).posX, p_BestChrome.Gene(i).posY, p_BestChrome.Gene(i).isRotated);
            else
                fprintf(fileID,'%d %d %d %d %d\n',p_planksSizes(i,1), p_planksSizes(i,2), p_BestChrome.Gene(i).posX, p_BestChrome.Gene(i).posY, p_BestChrome.Gene(i).isRotated);
            end
        elseif p_BestChrome.Gene(i).exists == 0
            if i == length(p_BestChrome.Gene)
                fprintf(fileID,'%d %d %d %d %d',p_planksSizes(i,1), p_planksSizes(i,2), -1, -1, p_BestChrome.Gene(i).isRotated);
            else
                fprintf(fileID,'%d %d %d %d %d\n',p_planksSizes(i,1), p_planksSizes(i,2), -1, -1, p_BestChrome.Gene(i).isRotated);
            end
        end
    end

    fclose(fileID);
end