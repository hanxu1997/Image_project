function output_img = padding(input_img, r)
    [m, n]=size(input_img);
    imshow(input_img);
    output_img=zeros(m+2*r+1,n+2*r+1);
    output_img(r+1:m+r,r+1:n+r)=input_img;
    output_img(1:r,r+1:n+r)=input_img(1:r,1:n);                 %��չ�ϱ߽�
    output_img(1:m+r,n+r+1:n+2*r+1)=output_img(1:m+r,n:n+r);    %��չ�ұ߽�
    output_img(m+r+1:m+2*r+1,r+1:n+2*r+1)=output_img(m:m+r,r+1:n+2*r+1);    %��չ�±߽�
    output_img(1:m+2*r+1,1:r)=output_img(1:m+2*r+1,r+1:2*r);       %��չ��߽�
end

