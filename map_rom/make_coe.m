% function make_coe( filename, coefile )
%Makes COE files for xilinx from a given image

f1 = fopen( './coe5121.coe', 'w+' );

img = imread('wtf.png');
% 
fprintf(f1, 'memory_initialization_radix=2;\nmemory_initialization_vector= ');
for i = 1:80
%     disp(img(i,j))
    for j = 1:80
        if ( j==80 && i==80)
            if(img(i,j)==255) 
            fprintf(f1, '1 ; ');
            
            else
                fprintf(f1, '%d ; ', img(i,j));
            end
        else
            if(img(i,j)==255)
%                 disp(img(i,j))
                fprintf(f1, '1 , ');
            
            else
                fprintf(f1, '%d , ', img(i,j));
            end
        end
    end
    fprintf(f1, '\n');
end

fclose(f1);


