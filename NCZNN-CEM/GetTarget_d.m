function d= GetTarget_d(initial_img,bw_img,m,n)%，输入参数为原图像，二值化图像和其行数，列数；从二值化图像获取目标位置，再取出原图对应位置的目标光谱d进行求平均值
sum1=[0;0;0];
k=0;
for i=1:m
    for j=1:n
        if bw_img(i,j)==1
            k=k+1;
            b1(k,1)=i;
            b1(k,2)=j;      
        else
        end
    end
end
for p=1:k
    sum1=sum1+[initial_img(b1(p,1),b1(p,2),1);initial_img(b1(p,1),b1(p,2),2);initial_img(b1(p,1),b1(p,2),3)];
end
d=sum1/k;