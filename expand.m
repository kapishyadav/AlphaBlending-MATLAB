function limg = expand(img, gauss_img)

    exp_img = zeros(size(img,1)*2,size(img,2)*2);
    for i=1:2:size(exp_img,1)
        for j=1:2:size(exp_img,2)
            for k=1:3
            x = img(ceil(i/2),ceil(j/2),k);
            exp_img(i,j,k)=x;
            exp_img(i,j+1,k)=x;
            exp_img(i+1,j,k)=x;
            exp_img(i+1,j+1,k)=x;
            end
        end
    end
    if(size(exp_img,1)>size(gauss_img,1))
        gauss_img=padarray(img,[1,0], 'replicate','post');
    end
    if(size(exp_img,2)>size(gauss_img,2))
        gauss_img=padarray(img,[0,1], 'replicate','post');
    end
    if(size(exp_img,1)<size(gauss_img,1))
        exp_img=padarray(img,[1,0], 'replicate','post');
    end
    if(size(exp_img,2)<size(gauss_img,2))
        exp_img=padarray(img,[0,1], 'replicate','post');
    end
    
     limg= exp_img - gauss_img;

end

