-DESCRIPTION-
The following code are the implementation from paper below.

#####paper: ##### Giovanni Maria Farinella, Dario Allegra, Marco Moltisanti, Filippo Stanco, Sebastiano Battiatto; 2016
#####Retrieval and Classification of food images
#####Computers in Biology and Medicine vol. 77



-requirement
1. Matlab 2015
2. download dataset di http://iplab.dmi.unict.it/UNICT-FD1200/

-membuat texton library
1. buat file .txt berisi nama-nama file data yang ingin dijadikan data training untuk membuat texton library. Contoh file bisa anda lihat di buattextonlibrary.txt
2. buka file create_texton_library.m
3. pada line 1, tuliskan file txt yang ingin anda input
4. pada line terakhir (52) tuliskan nama file texton library yang sudah anda buat. format file nya adalah .mat

-mendapatkan histogram anti texton
1. Pada command window, ketik Anti_Texton_1TM('namafile.jpg')

-extract anti texton utk semua data
1. Siapkan file .txt berisi nama file
2. Buka file Compute_AntiTexton_All.m 
3. pada line 1, tuliskan file txt yang ingin anda input
4. pada line terakhir (27) tuliskan nama file data histogram anti texton yang sudah anda buat. format file nya adalah .mat

-klasifikasi
1. buka kfold.m
2. pada line 1, tuliskan file mat yang ingin anda input
3. ada 3 macam knn disini, yaitu 1-nn,3-nn, dan 5-nn.
untuk menggunakannya, pada line 43 tepatnya di constructknn_x dimana x bisa anda ganti dengan 1,3, atau 5