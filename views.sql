CREATE VIEW
  AlatMasuk2023 AS -- 1
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  ads.Jumlah_Dari_Sumber,
  ads.Tanggal_Masuk,
  s.Nama_Sumber
FROM
  Alat a
  JOIN AlatDariSumber ads ON a.Id_Alat = ads.Id_Alat
  JOIN Sumber s ON ads.Id_Sumber = s.Id_Sumber
WHERE
  YEAR (ads.Tanggal_Masuk) = 2023;

CREATE VIEW
  AlatRusak AS -- 2
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  p.Kondisi_Alat_Rusak,
  p.Tanggal_Pengecekan,
  p.Keterangan
FROM
  Alat a
  JOIN Pengecekan p ON a.Id_Alat = p.Id_Pemempatan
WHERE
  p.Kondisi_Alat_Rusak > 0;

CREATE VIEW
  JumlahAlatPerKelas AS -- 3 
SELECT
  l.Nama_Lokasi,
  SUM(pa.Jumlah_Dilokasi) AS Jumlah_Alat
FROM
  Lokasi l
  JOIN PenempatanAlat pa ON l.Id_Lokasi = pa.Id_Lokasi
WHERE
  l.Nama_Lokasi LIKE 'Ruang Kelas%'
GROUP BY
  l.Nama_Lokasi;

CREATE VIEW
  AlatLabIPA AS -- 4
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  pa.Jumlah_Dilokasi,
  l.Nama_Lokasi
FROM
  Alat a
  JOIN PenempatanAlat pa ON a.Id_Alat = pa.Id_Alat
  JOIN Lokasi l ON pa.Id_Lokasi = l.Id_Lokasi
WHERE
  l.Nama_Lokasi = 'Laboratorium IPA';

CREATE VIEW
  AlatLabKomputer AS -- 5
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  pa.Jumlah_Dilokasi,
  l.Nama_Lokasi
FROM
  Alat a
  JOIN PenempatanAlat pa ON a.Id_Alat = pa.Id_Alat
  JOIN Lokasi l ON pa.Id_Lokasi = l.Id_Lokasi
WHERE
  l.Nama_Lokasi = 'Laboratorium Komputer';

CREATE VIEW
  TotalJumlahAlatSekolah AS -- 6
SELECT
  a.Nama_Alat,
  SUM(p.Jumlah_Dilokasi) AS Total_Jumlah
FROM
  Alat a
  JOIN PenempatanAlat p ON a.Id_Alat = p.Id_Alat
GROUP BY
  a.Nama_Alat;

CREATE VIEW
  AlatDariPT AS --7
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  ads.Jumlah_Dari_Sumber,
  s.Nama_Sumber
FROM
  Alat a
  JOIN AlatDariSumber ads ON a.Id_Alat = ads.Id_Alat
  JOIN sumber s ON ads.Id_Sumber = s.Id_Sumber
WHERE
  s.Nama_Sumber LIKE 'PT%';

CREATE VIEW
  RuanganTanpaKode AS --8
SELECT
  Nama_Lokasi,
  Penanggung_Jawab
FROM
  Lokasi
WHERE
  Kode_Ruangan IS NULL;

CREATE VIEW
  TempatPenjagaSekolah AS --9
SELECT
  l.Nama_Lokasi,
  l.Kode_Ruangan,
  l.Penanggung_Jawab
FROM
  Lokasi l
WHERE
  l.Penanggung_Jawab = 'Penjaga Sekolah';

CREATE VIEW
  ViewAlatByJenis AS --10
SELECT
  Jenis_Alat,
  COUNT(*) AS Jumlah_Alat
FROM
  Alat
GROUP BY
  Jenis_Alat;

CREATE VIEW
  JumlahSumberNonPTCV AS --11
SELECT
  s.Nama_Sumber,
  COUNT(*) AS Jumlah_Sumber
FROM
  Sumber s
WHERE
  s.Nama_Sumber NOT LIKE 'PT%'
  AND s.Nama_Sumber NOT LIKE 'CV%'
GROUP BY
  s.Nama_Sumber;

CREATE VIEW
  JumlahSeluruhAlat AS --12
SELECT
  SUM(pa.Jumlah_Dilokasi) AS Total_Jumlah_Alat
FROM
  PenempatanAlat pa;

CREATE VIEW
  RataRataTahunMasuk AS --13
SELECT
  a.Nama_Alat,
  AVG(YEAR (ads.Tanggal_Masuk)) AS RataRataTahunMasuk
FROM
  Alat a
  JOIN AlatDariSumber ads ON a.Id_Alat = ads.Id_Alat
GROUP BY
  a.Nama_Alat;

CREATE VIEW
  JumlahSumberCVPT AS --14
SELECT
  CASE
    WHEN s.Nama_Sumber LIKE 'CV%' THEN 'CV'
    WHEN s.Nama_Sumber LIKE 'PT%' THEN 'PT'
  END AS Jenis_Sumber,
  COUNT(*) AS Jumlah_Sumber
FROM
  Sumber s
WHERE
  s.Nama_Sumber LIKE 'CV%'
  OR s.Nama_Sumber LIKE 'PT%'
GROUP BY
  CASE
    WHEN s.Nama_Sumber LIKE 'CV%' THEN 'CV'
    WHEN s.Nama_Sumber LIKE 'PT%' THEN 'PT'
  END;

CREATE VIEW
  AlatRuangKesenian AS --15
SELECT
  a.Nama_Alat,
  a.Deskripsi,
  a.Jenis_Alat,
  pa.Jumlah_Dilokasi,
  l.Nama_Lokasi
FROM
  alat a
  JOIN PenempatanAlat pa ON a.Id_Alat = pa.Id_Alat
  JOIN lokasi l ON pa.Id_Lokasi = l.Id_Lokasi
WHERE
  l.Nama_Lokasi = 'Ruang Kesenian';