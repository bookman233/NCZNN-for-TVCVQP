function d= GetTarget_d(initial_img,bw_img,m,n)%���������Ϊԭͼ�񣬶�ֵ��ͼ������������������Ӷ�ֵ��ͼ���ȡĿ��λ�ã���ȡ��ԭͼ��Ӧλ�õ�Ŀ�����d������ƽ��ֵ
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