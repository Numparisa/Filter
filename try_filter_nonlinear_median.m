clear; clc;
I0 = imread('alpaca.jpg');
I = rgb2gray(I0);
siz = 3;
I2 = uint8(zeros(size(I,1),size(I,2)));
w = [1 2 1;2 3 2;1 2 1];

for i = 1:size(I,1)
    for j = 1:size(I,2)
        c = 1;
        for a = -1:1
            for b = -1:1
                if i+a>0 && j+b >0
                    if i+a <= size(I,1) && j+b <= size(I,2)
                        for e = 1:w(a+2,b+2)
                            I1(c) = I(i+a,j+b);
                            c = c+1;
                        end
                    end
                end
            end
        end
        I2(i,j) = median(I1);
    end
end

output = I2;
subplot(2,2,1);imshow(I); title('input');
subplot(2,2,2);histogram(I);
subplot(2,2,3);imshow(output);title('weight median filter result');
subplot(2,2,4);histogram(output);