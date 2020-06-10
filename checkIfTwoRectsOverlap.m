function areaOfCoveringPart = checkIfTwoRectsOverlap(p_firstRect, p_secondRect)
    areaOfCoveringPart = 0;
    if p_firstRect.isRotated == 0
        firstRectSizes  = [p_firstRect.posX, p_firstRect.posY, p_firstRect.width, p_firstRect.height];
    elseif p_firstRect.isRotated == 1
        firstRectSizes  = [p_firstRect.posX, p_firstRect.posY, p_firstRect.height, p_firstRect.width];
    end
    if p_secondRect.isRotated == 0
        secondRectSizes = [p_secondRect.posX, p_secondRect.posY, p_secondRect.width, p_secondRect.height];
    elseif p_secondRect.isRotated == 1
        secondRectSizes = [p_secondRect.posX, p_secondRect.posY, p_secondRect.height, p_secondRect.width];
    end

    areaOfCoveringPart = rectint(firstRectSizes, secondRectSizes);
end
