% fid = fopen('testing_file_51.txt');
% baca = textscan(fid, '%s');
% 
% fid2 = fopen('training_50.txt');
% baca2 = textscan(fid2, '%s');
% 
% % 
% % load model_norm_training_with_label_0705_8TL.mat;
% % load model_norm_datatest_with_label_0705_8TL.mat;
% 
% load model_norm_with_label.mat;
% load model_norm_dataset_with_label.mat

result=struct();
total_result=struct();
maxima=37;
for j=1:maxima
disp(strcat('testing ke- ',int2str(j))); 
input= data_testing(j).histogram;

%hitung nilai
for i=1:229

distance=dist_chisquare(input,data_training(i).histogram);
mean_distance=mean(distance);
result(i).nilai=mean_distance;
result(i).label=data_training(i).class;
result(i).filename=data_training(i).filename;
end
[ss,sx]=sort([result.nilai]);
 ss=result(sx);
 total_result(j).filename = data_testing(j).filename;
 total_result(j).actual = data_testing(j).class;


%knn
c_class= [ 0 0 0 0 0 ]
flag= [ 1 1 1 1 1 ]
for k=1:5
    for l=1:5
        if strcmp(ss(k).label,ss(l).label) & flag(l)==1
            c_class(k)=c_class(k)+1;
            flag(l)=0;
         
        end
    end
end
double_count=0;
rekap=[];
n=1;
%cek angka
if max(c_class)>1
    for m=1:5
        if c_class(m)==max(c_class)
            double_count=double_count+1;
            rekap(n)=m;
            n=n+1;
        end
    end
end


if c_class(1) == c_class(2) == c_class(3) == c_class(4) == c_class(5)
total_result(j).filename2=ss(1).filename;
total_result(j).nilai=ss(1).nilai;
total_result(j).predicted=ss(1).label;
elseif double_count>1
    banding=[0 0];
    for p=1:2
        
        cek=ss(rekap(p)).label;
        for y=1:5
            if strcmp(cek ,ss(y).label)
                banding(p)=banding(p)+ss(y).nilai;
            end
        end
        banding(p)=banding(p)/2;
    end
 
    for t=1:2
        if banding(t)==min(banding)
            
            total_result(j).filename2=ss(rekap(t)).filename;
            total_result(j).nilai=ss(rekap(t)).nilai;
            total_result(j).predicted=ss(rekap(t)).label;
    end
        
    end
else
    for b=1:5
        if c_class(b)==max(c_class)
            
            total_result(j).filename2=ss(b).filename;
            total_result(j).nilai=ss(b).nilai;
            total_result(j).predicted=ss(b).label;
            break;
        end
    end
end
    
if double_count>1
    total_result(j).nnmax=double_count;
end
end

data_benar=struct();
nilai_benar=0;
for i=1:maxima
if size(total_result(i).actual) == size(total_result(i).predicted)
    if total_result(i).actual == total_result(i).predicted
    nilai_benar=nilai_benar+1;
    data_benar(nilai_benar).filename=total_result(i).filename;
    data_benar(nilai_benar).class=total_result(i).predicted;
    end
end

end

presentase_val=nilai_benar/maxima;
disp(presentase_val);