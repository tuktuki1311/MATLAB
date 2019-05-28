I =imread('coins.png');
%I= rgb2gray(I);
[M,N] = size(I);
L= 256;
SP = M*N;
pdf1 = zeros(1,L);
for i = 1:M
    for j = 1:N
        pdf1( I(i,j)+1) = pdf1( I(i,j)+1 )+1;
    end
end

pdf1= pdf1./SP;

cdf1 = zeros(1,L);
cdf1(1) = pdf1(1);
for i = 2:L
    cdf1(i) = cdf1(i-1)+ pdf1(i);
end

figure;
bar(1:L,cdf1);



pdf3 = zeros(1,L);
for i = 1:1:32
    pdf3(i)=1/640;
end
for i = 33:1:64
    pdf3(i)=1/320;
end
for i = 65:1:96
    pdf3(i)=3/640;
end
for i = 97:1:160
    pdf3(i)=1/160;
end
for i = 161:1:192
    pdf3(i)=3/640;
end
for i = 193:1:224
    pdf3(i)=1/320;
end
for i = 224:1:256
    pdf3(i)=1/640;
end




cdf3 = zeros(1,L);
cdf3(1) = pdf3(1);
for i = 2:L
    cdf3(i) = cdf3(i-1)+ pdf3(i);
end

figure;
bar(1:L,cdf3);
title('New cdf');




comp = zeros(1,L);

for i =1:L
    s = 999;
    x=1;
    for j =1:L
        cal =abs(cdf3(j)-cdf1(i));
        if(cal<s)
            s = cal;
            x=j;
        end
    end
    
    comp(i)=x;
    
end


I3 = uint8(zeros(M,N));

for i =1:M
    for j = 1:N
        I3(i,j) = comp( I(i,j)+1 );
    end
end


figure;
imshow(I3);
figure;
imshow(I);
              
















