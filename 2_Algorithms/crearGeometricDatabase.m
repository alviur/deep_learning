%==========================================================================
% Script - Crear base de datos

%==========================================================================


numberOfimagesPerClass=100;
imagesize=256; 
pathSave='/home/lex/Desktop/shapesDatabase/';


%% Generate Forms



for i=1:numberOfimagesPerClass
    i
    input=imread('/home/lex/Desktop/baseIMage');% Background
    trianglea=[50 1 1 100 100 100]; % Basic points of triangle

    % Shapes drawing
    circle = insertShape(input, 'FilledCircle', [randi([50,200]) randi([50,200]) 100],'Color', 'white','Opacity',1);
    rectangle = insertShape(input, 'FilledRectangle', [randi([50,200]) randi([50,200]) 100 100],'Color', 'white','Opacity',1);
    line = insertShape(input, 'FilledRectangle', [randi([50,200]) randi([50,200]) 100 3],'Color', 'white','Opacity',1);
    trianglea=trianglea+randi([0,200]);
    triangle = insertShape(input, 'FilledPolygon', [trianglea],'Color', 'white','Opacity',1);

    % Save images
    
    pathCircle=horzcat(pathSave,'/circle/',num2str(i));
    imwrite(circle,pathCircle,'bmp');
    
    pathRect=horzcat(pathSave,'/rectangle/',num2str(i));
    imwrite(rectangle,pathRect,'bmp');
    
    pathTriangle=horzcat(pathSave,'/triangle/',num2str(i));
    imwrite(triangle,pathTriangle,'bmp'); 
    
    pathLine=horzcat(pathSave,'/line/',num2str(i));
    imwrite(line,pathLine,'bmp');    
end


%% Rectangles