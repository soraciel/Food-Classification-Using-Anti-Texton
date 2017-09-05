fid = fopen('dataset.txt'); %ubah masukkan file txt input data
baca = textscan(fid, '%s');
disp(baca);
a=makeSfilters();
X=[];
for i=1:8
disp(baca{1}{i});
citra = imread(strcat('dataset\',baca{1}{i}));
citra =RGB2Lab(citra);
%figure(30),imshow(citra);
citra = double(citra);
a=double(a);
numFeatures = 39;
[Im_n,Im_m,Im_d]=size(citra);
aaa=zeros(192*272, numFeatures);
for f=1:13
for i=1:3
testing(:,:,i) =conv2(citra(:,:,i),a(:,:,f),'valid');
testing2 = reshape(testing(:,:,i),[192*272,1]);
     pixelFeatureVec = testing2;
     pixelFeatureVec = pixelFeatureVec - mean(pixelFeatureVec);
     pixelFeatureVec=pixelFeatureVec/std(pixelFeatureVec);       
     aaa(:,(f-1)*3+i) = pixelFeatureVec; %hasil semua filter respon  per gambar
end

%disp(f)
%figure(f),imshow(testing);
end
x=randperm(52224);
y=randperm(39);
hasil_randperm=zeros(100,39);

for n=1:100
    for m=1:39
        hasil_randperm(n,m)=aaa(x(n),y(m));
    end
end
X=vertcat(X, hasil_randperm); %semua filter respon dari semua gambar dijadikan 1

end

fclose(fid);





disp('processing kmeans');
[def,rY]=kmeans(X,50,'EmptyAction','drop','MaxIter',1500);


save TextonLibrary_cobarandperm.mat rY %save namafile texton library



