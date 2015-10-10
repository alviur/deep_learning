%==========================================================================
% Prepara base de datos de algas para evaluacion
%
%
%==========================================================================

% contadores

contTest=0;
contTraining=0;
contTestF=0;
contTraingF=0;

% Paths
path='/home/lex/2_SISTEMIC/9_Deep_Learning/1_Datasets/1_Microalgas/raw/';
pathTest='/home/lex/2_SISTEMIC/9_Deep_Learning/1_Datasets/1_Microalgas/gray/testing/';
pathTrain='/home/lex/2_SISTEMIC/9_Deep_Learning/1_Datasets/1_Microalgas/gray/training/';

for l=0:3
l
    
    pathF=horzcat(path,int2str(l),'/')
    D = dir([pathF, '*.png']);
    Num = length(D(not([D.isdir])))
    
    
    for i=1:Num
        str=int2str(i);
        pathImg=horzcat(pathF,str,'.png');
        img=imread(pathImg);
        
        % Preproceso
        img=rgb2gray(img);
        img=rellenar(img);
        
        if i<=round(Num*0.7)       
          
            contTraining=contTraining+1;
            contTraingF=contTraingF+1;
            pathSave=horzcat(pathTrain,int2str(l),'/',int2str(contTraingF),'.jpg');
            pathSaveLMDB=horzcat('/home/lex/2_SISTEMIC/9_Deep_Learning/1_Datasets/1_Microalgas/gray/training/toLMDB/',int2str(contTraining),'.jpg');
            imwrite(img,pathSave);
            imwrite(img,pathSaveLMDB);
            
            
        else

            contTest=contTest+1;
            contTestF=contTestF+1;
            pathSave=horzcat(pathTest,int2str(l),'/',int2str(contTestF),'.jpg');
            pathSaveLMDB=horzcat('/home/lex/2_SISTEMIC/9_Deep_Learning/1_Datasets/1_Microalgas/gray/testing/toLMDB/',int2str(contTest),'.jpg');
            imwrite(img,pathSave);
            imwrite(img,pathSaveLMDB);

        end


    end
    

    
    numFilesTest(1,l+1)=contTestF;
    numFilesTrain(1,l+1)=contTraingF;
    contTestF=0;
    contTraingF=0;

end


%% Generacion archivos txt
pathlist(contTraining,'train.txt',numFilesTrain(1,1),numFilesTrain(1,2),numFilesTrain(1,3));
pathlist(contTraining,'test.txt',numFilesTest(1,1),numFilesTest(1,2),numFilesTest(1,3));