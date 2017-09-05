fid = fopen('ujicobacoy.txt');
baca = textscan(fid, '%s');
size_datall=size(data_all);
size_dt=size_datall(2);
data_training=struct();
data_testing=struct();
keepnomor=[];
for i=1:31
    namafile=baca{1}{i};
    disp(namafile);
for j=1:size_dt
    if strcmp(namafile,data_all(j).filename)  
    data_testing(i).filename=data_all(j).filename;
    data_testing(i).histogram=data_all(j).histogram;
    data_testing(i).class=data_all(j).class;
    keepnomor(i)=j;
        break;
    end
end
end
count_tr=1;
%read data training
for k=1:size_dt
    flag_testing=0;
    for m=1:31
        if k==keepnomor(m)
            flag_testing=1;
            break;
        end
    end
    if flag_testing==0
        data_training(count_tr).filename=data_all(k).filename;
        data_training(count_tr).histogram=data_all(k).histogram;
        data_training(count_tr).class=data_all(k).class;
        count_tr=count_tr+1;
    end
end

[total_result,akurasi]=constructknn_1(data_testing,data_training,31,size_dt);
%hasil_knn(iterasi).result=total_result;
%hasil_knn.akurasi=akurasi*100;
