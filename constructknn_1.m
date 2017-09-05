function [ total_result , presentase_val ] = constructknn_1 ( data_testing , data_training,k ,sizedata)

result=struct();
total_result=struct();

max=k;
maxx=sizedata-k;
for j=1:max

input= data_testing(j).histogram;

%hitung nilai
for i=1:maxx

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
 total_result(j).predicted=ss(1).label;
total_result(j).filename2=ss(1).filename;
total_result(j).nilai=ss(1).nilai;
end
%data_sidedish=struct();
nilai_benar=0;
for i=1:max
if size(total_result(i).actual) == size(total_result(i).predicted)
    if total_result(i).actual == total_result(i).predicted
    nilai_benar=nilai_benar+1;
    %data_sidedish(nilai_benar).filename=total_result(i).filename; 
    end
end

end

presentase_val=nilai_benar/max;
%disp(presentase_val);
end
%save data_singlecourse.mat data_dessert;