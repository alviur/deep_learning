%==========================================================================
% Rellena con ceros
%
%
%==========================================================================

function pathlist(numImagenes,name,lim1,lim2,lim3)

    
    fileID = fopen(name,'w');
    
    for i=1:numImagenes
        
        numeroToString = int2str(i);
        fileName = strcat(numeroToString,'.jpg');

        if(i<lim1)fileName = horzcat(fileName,' ','0');end
        if(i>lim1 && i<lim2+lim1)fileName = horzcat(fileName,' ','1');end
        if(i>=lim2+lim1 && i<lim3+lim2+lim1)fileName = horzcat(fileName,' ','2');end
        if(i>=lim3+lim2+lim1)fileName = horzcat(fileName,' ','3');end


        fprintf(fileID,fileName);
        fprintf(fileID,'\n');


    end


    fclose(fileID);

end