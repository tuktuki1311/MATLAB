

%{
A = [1 2 3; 4 5 6; 7 8 9]

B = [9 8 7; 6 5 4; 3 2 1]

C = A .* B
C = A .* A
c1 = pi : 2*pi :20*pi
R= ceil(rand(5))
C = R*.10 
%}
%{
X = [-9 7 5 8 -6];
Y = [-3 8 6 7 1];
plot(X, Y, '*')
%}
%{
A = floor(rand(5,5)*10);
B = ones(5,5)*9;
C = A + B;
[row, col] = size(C); % size() returns the dimension of a matrix
D = zeros(row, col);
for i = 1:row
for j = 1:col
if i==j
D(i,j) = (C(i,j));
end
end
end
disp(D) %disp() prints a variable in command
%}

I = imread('peppers_color.jpg');
[row, col] = size(I);
K = uint8(ones(row, col));
L = uint8(ones(row, col));
M = uint8(ones(row, col));

for i = 1:row
    for j = 1:col
        K(j,i) = I(i,j);
    end
end
figure; imshow(K);
r = I(:, :, 1);
g = I(:, :, 2);
b = I(:, :, 3);
plot(2,2,1);
%imshow(r)
figure;

plot(2,2,2)
%imshow(g)
figure;










