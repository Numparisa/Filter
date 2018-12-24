clear; clc;
I0 = imread('alpaca.jpg');
I = rgb2gray(I0);
siz = 3;
I2 = uint8(zeros(size(I,1),size(I,2)));
I3 = uint8(zeros(size(I,1),size(I,2)));
for i = 1:size(I,1)
    for j = 1:size(I,2)
        c = 1;
        for a = -1:1
            for b = -1:1
                if i+a>0 && j+b >0
                    if i+a<=size(I,1) && j+b <=size(I,2)
                        I1(c) = I(i+a,j+b);
                        c = c+1;
                    end
                end
            end
        end
        I2(i,j) = max(I1);
        I3(i,j) = min(I1);
    end
end

output = I2;
subplot(3,2,1);imshow(I); title('input');
subplot(3,2,2);histogram(I);
subplot(3,2,3);imshow(output);title('max filter result');
subplot(3,2,4);histogram(output);
subplot(3,2,5);imshow(I3); title('min filter result');
subplot(3,2,6);histogram(I3);

