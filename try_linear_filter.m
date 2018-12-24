clear; clc;
I0 = imread('alpaca.jpg');
I = rgb2gray(I0);

% increasing of H*___ , making image brighter
H = [1 1 1;1 1 1;1 1 1];
H = H.*(0.05);
I2 = uint8(zeros(size(I,1),size(I,2)));

for i = 1:size(I,1)
    for j = 1:size(I,2)
        for a = -1:1
            for b = -1:1
                if i+a>0 && j+b >0
                    if i+a<size(I,1) && j+b <size(I,2)
                        I1(i,j) = I(i+a,j+b)*H(a+2,b+2);
                        I2(i,j) = I1(i,j) + I2(i,j);
                    end
                end
            end
        end
    end
end

output = I2;
subplot(2,2,1);imshow(I); title('input');
subplot(2,2,2);histogram(I);
subplot(2,2,3);imshow(output);title('output');
subplot(2,2,4);histogram(output);