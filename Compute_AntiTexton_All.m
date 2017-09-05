fid = fopen('dataset\dataset3.txt'); %file input
baca = textscan(fid, '%s');
load Data_Filename_Label.mat;
disp(baca);
data_all=struct();
ukuran=37;
%hasil=zeros(1,192,272);
for i=1:ukuran
disp(strcat('iterasi ke-',int2str(i)));
disp(baca{1}{i});
%filename=strcat('_',baca{1}{i});
filename=baca{1}{i};
citra = imread(strcat('UNICT-FD1200_Small\',filename));
hasil=Anti_Texton_1TM(citra);
data_all(i).histogram=hasil;
data_all(i).filename=filename;
for j=1:4754
    if filename == strcat('_',data_filename_all(j).filename)
        data_all(i).class=data_filename_all(j).classname;
        break;
    end
 
end
%disp('berhenti dulu coy');
end

save antitexton_dataset3.mat data_all; %save file

