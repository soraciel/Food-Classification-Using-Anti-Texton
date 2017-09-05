% fid = fopen('testing_file_51.txt');
% baca = textscan(fid, '%s');
% 
% fid2 = fopen('training_50.txt');
% baca2 = textscan(fid2, '%s');

% 
% load model_norm_training_with_label_0705_8TL.mat;
% load model_norm_datatest_with_label_0705_8TL.mat;

% load model_norm_with_label.mat;
% load model_norm_dataset_with_label.mat

% field1 = 'nilai';  
% field2 = 'label';
% result = struct(field1,{},field2,{});
result=struct();
total_result=struct();
%total_result=struct('actual' , {} , 'predicted',{});
max=37;
for j=1:max
disp(strcat('testing ke- ',int2str(j))); 
input= data_testing(j).histogram;

%hitung nilai
for i=1:229

distance=dist_chisquare(input,data_training(i).histogram);
mean_distance=mean(distance);
 %similarity=1-(distance/max(distance));
 %mean_similarity=mean(similarity);
result(i).nilai=mean_distance;
%result(i).nilai=std(distance);
%result(i).nilai=mean_similarity;
%result(i).nilai=distance/max(distance);
result(i).label=data_training(i).class;
result(i).filename=data_training(i).filename;
end
[ss,sx]=sort([result.nilai]);
 ss=result(sx);
 total_result(j).filename = data_testing(j).filename;
 total_result(j).actual = data_testing(j).class;


%knn
c=1;
for k=1:3
    
    
if k==1
    if strcmp(ss(k).label , ss(k+1).label)  | strcmp(ss(k+2).label,ss(k).label)
        c=k;
        break;
    end
elseif k==2
    if strcmp(ss(k).label, ss(k+1).label)
        c=k;
        break;
    end
    
end
end

total_result(j).filename2=ss(c).filename;
total_result(j).nilai=ss(c).nilai;
total_result(j).predicted=ss(c).label;
total_result(j).c=c;
end

data_benar=struct();
nilai_benar=0;
for i=1:max
if size(total_result(i).actual) == size(total_result(i).predicted)
    if total_result(i).actual == total_result(i).predicted
    nilai_benar=nilai_benar+1;
    data_benar(nilai_benar).filename=total_result(i).filename;
    data_benar(nilai_benar).class=total_result(i).predicted;
    end
end

end

presentase_val=nilai_benar/max;
disp(presentase_val);