%==========================================================================
% Rellena con ceros
%
%
%==========================================================================


function I=rellenar(I);
    %I = uint8(0.2989 * I1(:,:,1) + 0.5870 * I1(:,:,2) + ...
              %  0.1140 * I1(:,:,3));
    %I=I1;
    w=size(I,1);   
    while w<114
       
       a=zeros(1,size(I,2));  
       I=[a;I;a];
       w=size(I,1);
       
    end    

    h=size(I,2);
     while h<114
         
        a=zeros(size(I,1),1);           
        I=[a,I,a];            
   
       h=size(I,2);
        
        
     end
        
    I = imresize(I, [113 113]);

end




