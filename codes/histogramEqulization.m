clc; clear all; close all;
g=imread('coins.png');
figure, imshow(g);
h=g;
[M,N]=size(g);

r = 1: 256;
t=1:256;
n=0:255;
count=0;

for z=1:256
    for i=1:M
        for j=1:N
            
            if g(i,j)==z-1
                count=count+1;
            end
        end
    end
            t(z)=count;
            count=0;
end



%plot(n,t); 
hold on;

p=zeros(1,256);
for i=1:256
    p(i)=t(i)/(M*N);
end

%plot(n,p);
hold on;
      
c=zeros(1,256);
c(1)=p(1);
for i=2:256
    c(i)=c(i-1)+p(i);
end

figure,bar(r,c);

b=zeros(1,256);
for i=1:256
    b(i)=c(i)*255;
end


for i=1:256
    b(i)=round(b(i));
end
%plot(n,b);
hold off;

b=zeros(1,256);
for i=1:256
    b(i)=c(i)*255;
end


for i=1:256
    b(i)=round(b(i));
end

pdf=zeros(1,256);
for i=1:1:32    
    pdf(i)= 1/640;
end
for i=33:1:64    
    pdf(i)= 1/320;
end
for i=65:1:96   
    pdf(i)= 3/640;
end
for i=97:1:160    
    pdf(i)= 1/80;
end
for i=161:1:192   
    pdf(i)= 3/640;
end
for i=193:1:224    
    pdf(i)= 1/320;
end
for i=225:256   
     pdf(i)= 1/640;
end

cdf=zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end

b1=zeros(1,256);
for i=1:256
    b1(i)=cdf(i)*255;
end


for i=1:256
    b1(i)=round(b1(i));
end
figure,bar(r,cdf);
comp=zeros(1,256);
for i =1:256
    s = 257;
    x=1;
    for j =1:256
        if(b(i)>b1(j))
            x=j;
        end
    end  
    comp(i)=x;    
end


%figure,bar(r,b);
I = uint8(zeros(M,N));
for i=1:M
        for j=1:N
                 h(i,j) = comp(g(i,j)+1);
        end
end

imwrite(h,'modified_coin.jpg')
figure, imshow(h);
%ylabel('no. of pixels with such intensity levels---->');
%xlabel('intensity levels---->'); title('HISTOGRAM OF THE IMAGE')