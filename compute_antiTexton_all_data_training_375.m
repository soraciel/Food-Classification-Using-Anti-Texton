fid = fopen('DataAllTraining_3005.txt');
baca = textscan(fid, '%s');
load Data_Filename_Label.mat;
disp(baca);
value=zeros(1,256,51);
data_training=struct();
%hasil=zeros(1,192,272);
for i=1:229
disp(strcat('iterasi ke-',int2str(i)));
disp(baca{1}{i});
filename=strcat('_',baca{1}{i});
citra = imread(strcat('UNICT-FD1200_Small\',filename));
hasil=Anti_Texton_Norm_1TM(citra);
data_training(i).histogram=hasil;
data_training(i).filename=filename;
for j=1:4754
    if filename == strcat('_',data_filename_all(j).filename)
        data_training(i).class=data_filename_all(j).classname;
        break;
    end
 
end
%disp('berhenti dulu coy');
end

save model_norm_training_375_50New_3005.mat data_training;
