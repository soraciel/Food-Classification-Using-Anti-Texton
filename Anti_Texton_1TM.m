function [ Anti_Texton_Histogram ] = Anti_Texton_1TM ( citra )
% % %UNTITLED Summary of this function goes here
% % % Detailed explanation goes here
load textonLibrary.mat %load texton library yang sudah dibuat
[wkwk,aaa]=textonify_1M(citra);
textonMap= wkwk;
size_bin=100;
H_sumall=zeros(1,size_bin);
ping=zeros(1,size_bin);
for id_r=136:136


%textonID= TextonLibrary(8,39);
nol=0;
for k=1:192
for l=1:272
if textonMap(k,l)==id_r
biner(k,l)=1;
nol=nol+1;
else biner(k,l)=0;
end
end
end


if(nol~=0)
DT=bwdist(biner);
assignin('base', 'DT', DT);
% 
% %normalisasi
max_value=max(DT(:));
DT2=DT/max_value;
assignin('base', 'DT2', DT2);

%figure(5),imshow(DT2);
Ei=1-DT2;
%figure(6), imshow(Ei);
hn = histogram(Ei,size_bin);
ping=hn.Values;
else
Ei=biner;
for g=1:size_bin
    ping(g)=0;
end

end



H_sumall=H_sumall+ping;
end

Anti_Texton_Histogram=H_sumall/375;

end  