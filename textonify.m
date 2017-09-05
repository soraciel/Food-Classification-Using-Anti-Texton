function [textonMap2,aaa] = textonify(citra)

load TextonLibrary_cobarandperm.mat;
TextonLibrary=rY;

citra =RGB2Lab(citra);
citra=double(citra);
TextonLibrary=rY;
numFeatures = 13;
K=size(TextonLibrary,1);
N=size(TextonLibrary,2); % No. of Filter Responses 
%TextonizedIm=zeros(192,272,3);
a=makeSfilters();
a=double(a);
textonMap=zeros(192,272);  
temp=zeros(K,1);
aaa=zeros(192*272, numFeatures);
%ekstrasi filter response
for f=1:13

for i=1:3
testing(:,:,i) =conv2(citra(:,:,i),a(:,:,f),'valid');
testing2 = reshape(testing(:,:,i),[192*272,1]);
     pixelFeatureVec = testing2;
     pixelFeatureVec = pixelFeatureVec - mean(pixelFeatureVec);
     pixelFeatureVec=pixelFeatureVec/std(pixelFeatureVec);       
     aaa(:,(f-1)*3+i) = pixelFeatureVec; %hasil semua filter respon  per gambarend
     
%disp(f)

end
%subplot(5,3,f),imshow(testing);
end
%[def,hasil]=kmeans(flipud(X),4,'EmptyAction','drop');

    

%k = dsearchn(TextonLibrary,hasil);
temp=pdist2(aaa,TextonLibrary);
%textonMap=reshape(temp',192,272);
[aaa,index]=min(temp');
textonMap2=reshape(index,192,272);
imagesc(textonMap2);
%textonHisto=histc(index,1:K);

end

