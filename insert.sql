USE tugasBesar;
INSERT INTO Lokasi (Nama_Lokasi, Kode_Ruangan, Penanggung_Jawab)
VALUES
  ('Ruang Kelas 7A', dbo.GenerateRoomCode(1,1), 'Wali Kelas'), --1
  ('Ruang Kelas 7B', dbo.GenerateRoomCode(1,2), 'Wali Kelas'), --2
  ('Ruang Kelas 7C', dbo.GenerateRoomCode(1,3), 'Wali Kelas'), --3
  ('Ruang Kelas 7D', dbo.GenerateRoomCode(1,4), 'Wali Kelas'), --4
  ('Ruang Kelas 8A', dbo.GenerateRoomCode(2,1), 'Wali Kelas'), --5
  ('Ruang Kelas 8B', dbo.GenerateRoomCode(2,2), 'Wali Kelas'), --6
  ('Ruang Kelas 8C', dbo.GenerateRoomCode(2,3), 'Wali Kelas'), --7
  ('Ruang Kelas 8D', dbo.GenerateRoomCode(2,4), 'Wali Kelas'), --8
  ('Ruang Kelas 9A', dbo.GenerateRoomCode(3,1), 'Wali Kelas'), --9
  ('Ruang Kelas 9B', dbo.GenerateRoomCode(3,2), 'Wali Kelas'), --10
  ('Ruang Kelas 9C', dbo.GenerateRoomCode(3,3), 'Wali Kelas'), --11
  ('Ruang Kelas 9D', dbo.GenerateRoomCode(3,4), 'Wali Kelas'), --12
  ('Laboratorium IPA', dbo.GenerateRoomCode(1,5), 'Guru Lab'), --13
  ('Laboratorium Komputer', dbo.GenerateRoomCode(2,6), 'Guru Lab'), --14
  ('Aula',  dbo.GenerateRoomCode(3,5), 'Penjaga Sekolah'), --15
  ('Ruang Tata Usaha',  dbo.GenerateRoomCode(1,6), 'Admin TU'), --16
  ('Masjid', null, 'DKM'), --17
  ('Lapangan', null, 'Penjaga Sekolah'), --18
  ('Ruang Penjaga Sekolah', null, 'Penjaga Sekolah'), --19
  ('Ruang Kepala Sekolah',  dbo.GenerateRoomCode(1,7), 'Kepala Sekolah'), --20
  ('Ruang Guru', dbo.GenerateRoomCode(2,7),'Penjaga Sekolah'), --21
  ('Ruang BK', dbo.GenerateRoomCode(3,6),'Guru BK'), --22
  ('Ruang UKS', dbo.GenerateRoomCode(2,8),'Guru'), --23
  ('Perpustakaan', dbo.GenerateRoomCode(3,7),'Pustakawan'), --24
  ('Toilet Putra',null ,'Penjaga Kebersihan Sekolah'), --25
  ('Toilet Putri',null,'Penjaga Kebersihan Sekolah'), --26
  ('Toilet Guru',null ,'Penjaga Kebersihan Sekolah'), --27
  ('Ruang Olahraga', dbo.GenerateRoomCode(1,8),'Guru Olahraga'), --28
  ('Ruang kesenian', dbo.GenerateRoomCode(1,9),'Guru Kesenian'), --29
  ('Kantin',null,'Penjaga Kantin'); --30

    INSERT INTO Sumber (Nama_Sumber, No_Kontak, Email)
VALUES
  ('Ahmad Shobari', '081234567894', 'ashobari@gmail.com'), --1
  ('Muhammad Zaldi', '08213456711', 'zaldizaldi@gmail.com'), --2
  ('PT Insan Mulia', '0222345678', 'Insanmulia@gmail.com'), --3
  ('Toko Sejahtera', '084234567893', 'sejahtera@gmail.com'), --4
  ('PT Sarana Edukasi', '0222345677', 'sarana.edukasi@gmail.com'), --5
  ('Chemical Jaya', '086234567895', 'jchemical@gmail.com'), --6
  ('Toko Andalan', '087234567896', 'toko.andalan@gmail.com'), --7
  ('CV Perlengkapan Sekolah', '088234567897', 'perlengkapan@gmail.com'), --8
  ('Toko Serba Ada', '089234567898', 'toko.serba@gmail.com'), --9
  ('Toko Pionir', '089746524444', 'pionir@gmail.com'), --10
  ('CV Dunia Belajar', '081234567890', 'duniabelajar@gmail.com'),--11
  ('Dua Putra Mandiri','0234356420', 'dpmandiri@gmail.com'), --12
  ('CV Slamet Abadi','082332456876','sabadi@gmail.com'),--13
  ('Rumah Pustaka','089333837621','rpustaka@gmail.com'), --14
  ('Cakra Media','088215934876','cakramedia@gmail.com'), --15
  ('Muafi electro','085777893215','mel3ctr0@gmail.com'), --16
  ('Akses Komputer','0821354889','akseskom@gmail.com'), --17
  ('Mitra Farma','087267888564','mitrafarma@gmail.com'), --18
  ('Toko Sederhana','081214789671','sederhana@gmail.com'),--19
  ('Putra Buana','081715989765','buanaputra@gmail.com'), --20
  ('Pengrajin Gamelan dan Angklung','081234567892','kesenian@gmail.com'), --21
  ('PT Alat musik Jaya', '081234567891', 'alatsekolahjaya@gmail.com'),--22
  ('CV sajadah abadi', '082134567891', 'sajadah _abadi@gmail.com'),--23
  ('PT Elektronik Canggih', '083134567892', 'elektronikcanggih@gmail.com'),--24
  ('PT Alat kantor Makmur', '084134567893', 'alatkantormakmur@gmail.com'),--25
  ('CV Olahraga Prima', '085134567894', 'olahragaprima@gmail.com'),--26
  ('PT Elektronik Modern', '086134567895', 'elektronikmodern@gmail.com'),--27
  ('PT Alat Sekolah Unggul', '087134567896', 'alatsekolahunggul@gmail.com'),--28
  ('CV Olahraga Jaya', '088134567897', 'olahragajaya@gmail.com'),--29
  ('PT Espom Technology', '089134567898', 'elektroniterdepan@gmail.com'),--30
  ('PT Alat Perjaya', '081234567899', 'alatsekolahterbaik@gmail.com');--31

   INSERT INTO Alat(Nama_Alat, Deskripsi, Jenis_Alat)
VALUES
  ('Meja Belajar', 'Meja kayu untuk siswa dari kelas 1-6 termasuk lab', 'Mebel'), --1
  ('Kursi Belajar', 'Kursi kayu untuk siswa', 'Mebel' ), --2
  ('Jam Dinding', 'Jam dinding di pasang di seluruh ruangan kecuali gudang dan WC', 'Elektronik'), --3
  ('Kipas Angin', 'Kipas angin untuk ruang guru, kepala sekolah, Perpus, masjid, UKS, TU & lab', 'Elektronik'), --4
  ('Papan Tulis Putih', 'untuk ruang kelas, lab dan ruang guru', 'Peralatan Kelas'), --5
  ('Meja Guru','Meja kayu untuk guru', 'Mebel'), --6
  ('Kursi Guru','Kursi kayu untuk guru', 'Mebel'), --7
  ('Spidol', 'digunakan untuk papan tulis putih', 'Peralatan Kelas'), --8
  ('Penghapus Papan Tulis', 'digunakan untuk papan tulis putih', 'Peralatan Kelas'), --9
  ('Sapu','Sapu untuk di setiap kelas, lab, dan masjid, ruang guru, BK, TU, UKS', 'alat kebersihan'), --10
  ('Sikat Wc','Untuk membersihkan Toilet','alat kebersihan'), --11
  ('Lap Pel', 'Untuk mengepel lantai','alat kebersihan'), --12
  ('Sapu Lidi lapangan', 'Untuk membersihkan lapangan','alat kebersihan'), --13
  ('Printer', 'Printer multifungsi untuk guru, lab komputer, kepsek, TU, BK, UKS, Perpus', 'Elektronik'), --14
  ('CPU', 'CPU untuk laboratorium komputer, kepala sekolah, TU', 'Elektronik'), --15
  ('Monitor', 'Monitor untuk laboratorium komputer, kepala sekolah, TU', 'Elektronik'),--16
  ('Keyboard', 'Keyboard untuk laboratorium komputer, kepala sekolah, TU', 'Elektronik'), --17
  ('Mouse', 'Mouse untuk laboratorium komputer, kepala sekolah, TU', 'Elektronik'), --18
  ('Mikroskop', 'Mikroskop untuk pengamatan laboratorium IPA', 'Laboratorium IPA'), --19
  ('Kaca Pembesar', 'Kaca pembesar untuk pengamatan laboratorium IPA', 'Laboratorium IPA'), --20
  ('Kerangka Manusia', 'Kerangka manusia untuk pengamatan laboratorium IPA', 'Laboratorium IPA'), --21
  ('Botol Kimia', 'Botol kimia untuk penyimpanan bahan kimia', 'Laboratorium IPA'), --22
  ('Proyektor', 'Untuk keperluan pembelajaran, aula, ruang guru', 'Elektronik'), --23
  ('P3K', 'Untuk keperluan kesehatan', 'P3K'), --24
  ('Stand Speaker', 'Untuk keperluan untuk upacara, kesenian', 'Elektronik'), --25
  ('Speaker Didinding', ' Keperluan ibadah di masjid dan aula', 'Elektronik'), --26
  ('Mic', 'Untuk keperluan upacara, kesenian, masjid, aula', 'Elektronik'), --27
  ('Stand Mic', 'Untuk keperluan Aula, upacara, dan kesenian', 'Elektronik'), --28
  ('Rak Buku 2 x 1 x 0,5', 'Rak buku untuk perpustakaan', 'Mebel'), --29
  ('Karpet sajadah', 'Karpet untuk masjid', 'alat solat'), --30
  ('Bola Basket', 'Bola untuk permainan basket', 'Olahraga'), --31
  ('Ring Basket', 'Ring untuk permainan basket', 'Olahraga'), --32 
  ('Bola Sepak', 'Bola untuk permainan sepak bola', 'Olahraga'), --33
  ('Gawang', 'Gawang untuk permainan sepak bola', 'Olahraga'), --34
  ('Bola Voli', 'Bola untuk permainan voli', 'Olahraga'), --35
  ('Net Voli', 'Net untuk permainan voli', 'Olahraga'), --36
  ('Meja Pingpong', 'Meja untuk permainan pingpong', 'Olahraga'), --37
  ('Bola Pingpong', 'Bola untuk permainan pingpong', 'Olahraga'), --38
  ('Matras', 'Matras untuk senam lantai', 'Olahraga'), --39
  ('Saron','Saron untuk kesenian', 'Kesenian'), --40
  ('Bonang', 'Bonang untuk kesenian', 'Kesenian'), --41
  ('Kendang', 'Kendang untuk kesenian', 'Kesenian'), --42
  ('Angklung', 'Angklung untuk kesenian', 'Kesenian'), --43
  ('Meja kantin', 'Meja untuk kantin', 'Mebel'), --44
  ('Kursi kantin', 'Kursi untuk kantin', 'Mebel'),--45
  ('Kursi Aula', 'Kursi untuk event yang di laksanakan di aula', 'Mebel'),--46
  ('Meja Perpus', 'Meja untuk perpustakaan', 'Mebel'),--47
  ('Kursi Perpus', 'Kursi untuk perpustakaan', 'Mebel'),--48
  ('kasur uks', 'kasur untuk ruang UKS', 'Mebel'),--49
  ('Ember','Ember untuk di wc','alat kebersihan'),--50
  ('Gayung','Gayung untuk di wc','alat kebersihan');--51

    INSERT INTO AlatDariSumber (Id_Alat, Id_Sumber, Jumlah_Dari_Sumber, Tanggal_Masuk)
VALUES
(1, 3, 180, '2021-01-01'), (1, 5, 30, '2022-01-02'),
(2, 3, 360, '2021-01-02'), (2, 5, 60, '2022-01-03'),
(3, 5, 23, '2021-01-05'), (4, 10, 7, '2021-01-07'),
(4, 9, 6, '2021-01-07'), (4, 1, 1, '2021-06-08'),
(5, 9, 16, '2021-01-09'), (6, 12, 40, '2021-01-11'),
(6, 12, 10, '2021-11-12'), (7, 11, 40, '2021-01-13'),
(7, 12, 20, '2021-01-14'), (8, 15, 144, '2021-01-15'),
(9, 15, 24, '2021-01-17'), (10, 19, 40, '2021-01-19'),
(11, 9, 3, '2021-01-21'), (12, 8, 18, '2021-01-23'),
(12, 2, 2, '2022-03-24'), (13, 8, 4, '2021-01-25'),
(14, 27, 4, '2021-01-27'), (14, 25, 3, '2023-12-28'),
(15, 24, 2, '2021-01-29'), (15, 30, 11, '2022-01-30'),
(16, 24, 2, '2021-01-31'), (16, 30, 11, '2022-02-01'),
(17, 24, 2, '2021-02-02'), (17, 27, 11, '2022-02-03'),
(18, 5, 2, '2021-02-04'), (18, 17, 11, '2022-02-05'),
(19, 6, 2, '2022-01-06'), (20, 4, 4, '2021-02-08'),
(21, 7, 2, '2021-02-10'), (22, 13, 10, '2021-02-12'),
(23, 15, 12, '2021-06-14'), (23, 16, 5, '2022-01-15'),
(24, 18, 16, '2021-02-16'), (25, 20, 4, '2021-02-18'),
(26, 22, 4, '2021-02-20'), (26, 22, 4, '2023-05-30'),
(27, 30, 7, '2021-02-22'), (27, 30, 3, '2023-05-30'),
(28, 30, 7, '2021-02-24'), (28, 30, 3, '2023-05-24'),
(29, 14, 10, '2021-02-25'), (30, 23, 10, '2021-02-28'),
(31, 26, 10, '2022-03-29'), (32, 26, 2, '2022-03-29'),
(33, 29, 15, '2022-03-29'), (34, 29, 2, '2022-03-29'),
(35, 28, 15, '2022-03-29'), (36, 28, 1, '2022-03-29'),
(37, 31, 1, '2022-03-29'), (38, 31, 10, '2022-03-29'),
(39, 31, 10, '2022-03-25'), (40, 21, 3, '2022-02-25'),
(41, 21, 3, '2022-02-25'), (42, 21, 2, '2022-02-25'),
(43, 21, 50, '2022-02-25'), (44, 14, 25, '2023-02-25'),
(45, 14, 50, '2023-02-25'), (46, 15, 100, '2023-02-25'),
(47, 14, 10, '2023-02-25'), (48, 14, 20, '2023-02-25'),
(49, 18, 3, '2023-02-25'), (50, 19, 6, '2023-02-25'),
(51, 19, 6, '2023-02-25');

  INSERT INTO PenempatanAlat (Jumlah_Dilokasi, Id_Lokasi, Id_Alat)
VALUES
(15, 1, 1), (30, 1, 2), (1, 1, 6), (1, 1, 7), (1, 1, 3), (1, 1, 5), (3, 1, 8), (1, 1, 9), (2, 1, 10), (1, 1, 12), (1, 1, 23), (1, 1, 24),
(15, 2, 1), (30, 2, 2), (1, 2, 6), (1, 2, 7), (1, 2, 3), (1, 2, 5), (3, 2, 8), (1, 2, 9), (2, 2, 10), (1, 2, 12), (1, 2, 23), (1, 2, 24),
(15, 3, 1), (30, 3, 2), (1, 3, 6), (1, 3, 7), (1, 3, 3), (1, 3, 5), (3, 3, 8), (1, 3, 9), (2, 3, 10), (1, 3, 12), (1, 3, 23), (1, 3, 24),
(15, 4, 1), (30, 4, 2), (1, 4, 6), (1, 4, 7), (1, 4, 3), (1, 4, 5), (3, 4, 8), (1, 4, 9), (2, 4, 10), (1, 4, 12), (1, 4, 23), (1, 4, 24),
(15, 5, 1), (30, 5, 2), (1, 5, 6), (1, 5, 7), (1, 5, 3), (1, 5, 5), (3, 5, 8), (1, 5, 9), (2, 5, 10), (1, 5, 12), (1, 5, 23), (1, 5, 24),
(15, 6, 1), (30, 6, 2), (1, 6, 6), (1, 6, 7), (1, 6, 3), (1, 6, 5), (3, 6, 8), (1, 6, 9), (2, 6, 10), (1, 6, 12), (1, 6, 23), (1, 6, 24),
(15, 7, 1), (30, 7, 2), (1, 7, 6), (1, 7, 7), (1, 7, 3), (1, 7, 5), (3, 7, 8), (1, 7, 9), (2, 7, 10), (1, 7, 12), (1, 7, 23), (1, 7, 24),
(15, 8, 1), (30, 8, 2), (1, 8, 6), (1, 8, 7), (1, 8, 3), (1, 8, 5), (3, 8, 8), (1, 8, 9), (2, 8, 10), (1, 8, 12), (1, 8, 23), (1, 8, 24),
(15, 9, 1), (30, 9, 2), (1, 9, 6), (1, 9, 7), (1, 9, 3), (1, 9, 5), (3, 9, 8), (1, 9, 9), (2, 9, 10), (1, 9, 12), (1, 9, 23), (1, 9, 24),
(15, 10, 1), (30, 10, 2), (1, 10, 6), (1, 10, 7), (1, 10, 3), (1, 10, 5), (3, 10, 8), (1, 10, 9), (2, 10, 10), (1, 10, 12), (1, 10, 23), (1, 10, 24),
(15, 11, 1), (30, 11, 2), (1, 11, 6), (1, 11, 7), (1, 11, 3), (1, 11, 5), (3, 11, 8), (1, 11, 9), (2, 11, 10), (1, 11, 12), (1, 11, 23), (1, 11, 24),
(15, 12, 1), (30, 12, 2), (1, 12, 6), (1, 12, 7), (1, 12, 3), (1, 12, 5), (3, 12, 8), (1, 12, 9), (2, 12, 10), (1, 12, 12), (1, 12, 23), (1, 12, 24),
(15, 13, 1), (30, 13, 2), (1, 13, 6), (1, 13, 7), (1, 13, 3), (1, 13, 5), (3, 13, 8), (1, 13, 9), (2, 13, 4), (2, 13, 10), (1, 13, 12), (1, 13, 23), (1, 13, 24), (2, 13, 19), (4, 13, 20), (2, 13, 21), (10, 13, 22),
(10, 14, 1), (30, 14, 2), (1, 14, 6), (1, 14, 7), (1, 14, 3), (1, 14, 5), (3, 14, 8), (1, 14, 9), (2, 14, 4), (2, 14, 10), (1, 14, 12), (1, 14, 23), (1, 14, 24), (1, 14, 14), (11, 14, 15), (11, 14, 16), (11, 14, 17), (11, 14, 18),
(3, 15, 28), (3, 15, 27), (4, 15, 26), (100, 15, 46), (1, 15, 3), (1, 15, 10),
(2, 16, 6), (2, 16, 7), (1, 16, 3), (1, 16, 14), (1, 16, 15), (1, 16, 16), (1, 16, 17), (1, 16, 18), (1, 16, 4),
(10, 17, 30), (1, 17, 28), (1, 17, 27), (2, 17, 10), (1, 17, 12), (4, 17, 26),
(2, 18, 34), (2, 18, 32),
(1, 20, 6), (1, 20, 7), (1, 20, 4), (1, 20, 15), (1, 20, 16), (1, 20, 17), (1, 20, 18), (1, 20, 14), (1, 20, 3),
(25, 21, 6), (25, 21, 7), (1, 21, 23), (1, 21, 5), (3, 21, 8), (1, 21, 9), (2, 21, 4), (1, 21, 3), (1, 21, 24), (1, 21, 10),
(2, 22, 6), (6, 22, 7), (1, 22, 3), (1, 22, 4), (1, 22, 14), (1, 22, 10),
(2, 23, 6), (4, 23, 7), (1, 23, 24), (1, 23, 4), (1, 23, 3), (3, 23, 49), (1, 23, 10),
(2, 24, 6), (2, 24, 7), (1, 24, 3), (1, 24, 14), (10, 24, 29), (10, 24, 47), (20, 24, 48), (2, 24, 4),
(1, 25, 11), (2, 25, 50), (2, 25, 51),
(1, 26, 11), (2, 26, 50), (2, 26, 51),
(1, 27, 11), (2, 27, 50), (2, 27, 51),
(10, 28, 31), (15, 28, 33), (15, 28, 35), (1, 28, 36), (1, 28, 37), (10, 28, 38), (5, 28, 39),
(3, 29, 40), (3, 29, 41), (2, 29, 42), (50, 29, 43), (2, 29, 25), (3, 29, 28), (3, 29, 27), (1, 29, 3),
(25, 30, 44), (25, 30, 45),
(4, 19, 10), (4, 19, 12), (1, 19, 4), (4, 19, 13);

  INSERT INTO AdminIventaris (Username, Password) VALUES
('admin_1', 'admin1'), ('admin_2', 'admin2'),
('admin_3', 'admin3'), ('admin_4', 'admin4'),
('admin_5', 'admin5'), ('admin_6', 'admin6'),
('admin_7', 'admin7'), ('admin_8', 'admin8'),
('admin_9', 'admin9'), ('admin_10', 'admin10'),
('admin_11', 'admin11'), ('admin_12', 'admin12'),
('admin_13', 'admin13'), ('admin_14', 'admin14'),
('admin_15', 'admin15'), ('admin_16', 'admin16'),
('admin_17', 'admin17'), ('admin_18', 'admin18'),
('admin_19', 'admin19'), ('admin_20', 'admin20'),
('admin_21', 'admin21'), ('admin_22', 'admin22'),
('admin_23', 'admin23'), ('admin_24', 'admin24'),
('admin_25', 'admin25'), ('admin_26', 'admin26'),
('admin_27', 'admin27'), ('admin_28', 'admin28'),
('admin_29', 'admin29'), ('admin_30', 'admin30');


INSERT INTO Pengecekan (Kondisi_Alat_Baik, Kondisi_Alat_Rusak, Tanggal_Pengecekan, Keterangan, Id_Pemempatan, Id_Admin)
VALUES
  (13, 2, '2024-12-27', 'Kondisi alat sebagian baik, dua unit mengalami kerusakan ringan.', 1, 1),
  (30, 0, '2024-12-27', 'Kondisi alat dalam kondisi baik.', 2, 1),
  (1, 0, '2024-12-27', 'Kondisi alat dalam kondisi baik.', 3, 1),
  (1, 0, '2024-12-27', 'Kondisi alat dalam kondisi baik.', 4, 2),
  (1, 0, '2024-12-27', 'Kondisi alat Dalam Kondisi baik', 5, 2),
  (1, 0, '2024-12-27', 'Kondisi alat dalam kondisi baik.', 6, 3),
  (2, 1, '2024-12-28', 'Kondisi alat sebagian dalam kondisi baik, satu unit mengalami kerusakan ringan.', 7, 3),
  (1, 0, '2024-12-28', 'Kondisi alat dalam kondisi baik.', 8, 3),
  (1, 1, '2024-12-28', 'Kondisi alat sebagian baik, satu unit mengalami kerusakan Berat.', 9,3),
  (0, 1, '2024-12-28', 'Kondisi alat mengalami kerusakan ringan.', 10, 3),
  (1, 0, '2024-12-28', 'Kondisi alat dalam kondisi baik.', 11, 3),
  (1, 0, '2024-12-28', 'Kondisi alat dalam keadaan baik.', 12, 4),
  (12, 3, '2024-12-29', 'Kondisi alat sebagian baik, tiga unit mengalami kerusakan ringan.', 13, 4),
  (29, 1, '2024-12-29', 'Kondisi alat sebagian baik, satu unit mengalami kerusakan ringan.', 14, 5),
  (1, 0, '2024-12-29', 'Kondisi alat dalam kondisi baik.', 15, 5),
  (1, 0, '2024-12-29', 'Kondisi alat dalam kondisi baik.', 16, 6),
  (0, 1, '2024-12-29', 'satu unit mengalami kerusakan ringan. ', 17, 7),
  (1, 0, '2024-12-29', 'Kondisi alat dalam kondisi baik.', 18, 8),
  (2, 1, '2024-12-29', 'Kondisi alat dalam keaadaan baik. satu unit mengalami kerusakan Berat.', 19, 9),
  (1, 0, '2024-12-29', 'Kondisi alat dalam kondisi baik.', 20, 10),
  (1, 1, '2024-12-30', 'Kondisi alat sebagian baik, satu unit mengalami kerusakan ringan.', 21, 11),
  (1, 0, '2024-12-30', 'Kondisi alat dalam kondisi baik.', 22, 12),
  (0, 1, '2024-12-30', 'satu unit mengalami kerusakan ringan.', 23, 13),
  (1, 0, '2024-12-30', 'Kondisi alat masih layak pakai', 24, 14),
  (14, 1, '2024-12-30', 'Kondisi alat sebagian baik, satu unit mengalami kerusakan ringan.', 25, 15),
  (30, 0, '2024-12-30', 'Kondisi alat dalam keadaan masih layak', 26, 16),
  (1, 0, '2024-12-31', 'Kondisi alat dalam kondisi baik.', 27, 16),
  (1, 0, '2024-12-31', 'Kondisi alat dalam kondisi baik.', 28, 16),
  (1, 0, '2024-12-31', 'Kondisi alat dalam kondisi baik.', 29, 17),
  (0, 1, '2024-12-29', 'satu unit mengalami kerusakan ringan.', 30, 18);