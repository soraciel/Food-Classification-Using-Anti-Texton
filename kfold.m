load data_histogram.mat; %load data histogram anti texton
%kfold implementation
sizey=size(data_all); %data_all adl total data yg km pake, bentuknya struct
dataz=sizey(2); %dataz = besar ukuran data_all
%make random number 1-dataz
nomor=randperm(dataz);
mykfold = 15; 
%tentukan nilai mykfold. ex: data_all=50 , mykfold=5. 
%harus pas yaa maksudnya mykfold nya harus bisa membagi data_all menjadi sama 
%rata, bukan ada desimal2nya (contoh salah: data_all: 50, mykfold=3)
k=dataz/mykfold;

total_iterasi= mykfold;
hasil_knn=struct();
keepnomor=[];
%ambil data testing sebanyak k
%data testing = data yg menjadi data uji. bentuknya struct.
data_testing=struct();
addition=0;
for iterasi=1:total_iterasi
disp(strcat('testing ke- ',int2str(iterasi))); 
for test_number=1:k
    ambil=nomor(test_number+addition);
    keepnomor(test_number)=ambil; %ini kesalahan nanti pikirin lagi
    data_testing(test_number).filename=data_all(ambil).filename;
    data_testing(test_number).histogram=data_all(ambil).histogram;
    data_testing(test_number).class=data_all(ambil).class;
end
    addition=addition+k;
%masukkan data sisanya ke training
data_training=struct();
train_number=1;
for all_number=1:dataz
    if ismember(all_number,keepnomor) == 0
        data_training(train_number).filename=data_all(all_number).filename;
        data_training(train_number).histogram=data_all(all_number).histogram;
        data_training(train_number).class=data_all(all_number).class;
        train_number=train_number+1;
    end      
end
%knn implementation
%lakukan uji klasisfikasi/retrieval disini
[total_result,akurasi]=constructknn_1(data_testing,data_training,k,dataz);
hasil_knn(iterasi).result=total_result;
hasil_knn(iterasi).akurasi=akurasi*100;
end
%rata2 akurasi
rata2=sum(cat(1,hasil_knn.akurasi))/total_iterasi;
disp(rata2);
