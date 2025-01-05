-- Prosedur menampilkan total kondisi alat yang digunakan dan ketersediaan alat yang masih bisa di bagi dari nama alat atau lokasi
CREATE PROCEDURE GetAlatKondisi
    @Nama_Alat varchar(100) = null,
    @Nama_Lokasi varchar(100) = null
AS
BEGIN
select 
    a.Nama_Alat,
    l.Nama_Lokasi,
    pa.Jumlah_Dilokasi,
    ISNULL(SUM(p.Kondisi_Alat_Baik), 0) AS TotalKondisiBaik,
    ISNULL(SUM(p.Kondisi_Alat_Rusak), 0) AS TotalKondisiRusak
from PenempatanAlat as pa
inner join lokasi as l on pa.Id_Lokasi = l.Id_Lokasi
inner join alat as a on pa.Id_Alat = a.Id_Alat
left join pengecekan as p on pa.Id_Pemempatan = p.Id_Pemempatan
where 
    (a.Nama_Alat LIKE '%'+@Nama_Alat+'%' OR @Nama_Alat IS NULL)
    AND
    (l.Nama_Lokasi LIKE '%'+@Nama_Lokasi+'%' OR @Nama_Lokasi IS NULL)
GROUP BY 
    a.Nama_Alat, l.Nama_Lokasi, pa.Jumlah_Dilokasi;
END;
-- drop proc GetAlatKondisi;
GO
-- Prosedur melihat alat yang masih tersedia di iventaris
CREATE PROCEDURE GetAlatTersedia
@nama_alat varchar(100) = null
AS
BEGIN
select 
    a.Nama_Alat,
    (a.Jumlah_Total - ISNULL(SUM(pa.Jumlah_Dilokasi), 0)) as Jumlah_Tersedia_DiIventaris
from alat as a
inner join PenempatanAlat as pa on a.Id_Alat = pa.Id_Alat
where 
    a.Nama_Alat LIKE '%'+@nama_alat+'%' OR @nama_alat IS NULL
GROUP BY 
        a.Nama_Alat, a.Jumlah_Total
END;
-- drop proc GetAlatTersedia;
GO
-- Prosedur untuk CRUD AlatDariSumber
CREATE PROCEDURE CRUDAlatDariSumber
    @Mode varchar(10),
    @Id_Alat int = null,
    @Id_Sumber int = null,
    @Jumlah_Dari_Sumber int = null,
    @Tanggal_Masuk date = null
AS
BEGIN
    IF @Mode = 'INSERT'
    BEGIN
        IF @Tanggal_Masuk IS NULL
        BEGIN
            SET @Tanggal_Masuk = GETDATE();
        END
        INSERT INTO AlatDariSumber (Id_Alat, Id_Sumber, Jumlah_Dari_Sumber, Tanggal_Masuk)
        VALUES (@Id_Alat, @Id_Sumber, @Jumlah_Dari_Sumber, @Tanggal_Masuk);
    END
    ELSE IF @Mode = 'UPDATE'
    BEGIN
        UPDATE AlatDariSumber
        SET Jumlah_Dari_Sumber = @Jumlah_Dari_Sumber
        WHERE Id_Alat = @Id_Alat AND Id_Sumber = @Id_Sumber AND Tanggal_Masuk = @Tanggal_Masuk;
    END
    ELSE IF @Mode = 'DELETE'
    BEGIN
        DELETE FROM AlatDariSumber
        WHERE Id_Alat = @Id_Alat AND Id_Sumber = @Id_Sumber AND Tanggal_Masuk = @Tanggal_Masuk;
    END
    ELSE IF @Mode = 'READ'
    BEGIN
        SELECT CONCAT(a.Id_Alat, ' - ', a.Nama_Alat) as Alat, CONCAT(s.Id_Sumber, ' - ', s.Nama_Sumber) as Sumber, ads.Jumlah_Dari_Sumber, ads.Tanggal_Masuk 
        FROM AlatDariSumber as ads
        Join Sumber as s on ads.Id_Sumber = s.Id_Sumber
        Join Alat as a on ads.Id_Alat = a.Id_Alat
        where
            (ads.Id_Alat = @Id_Alat OR @Id_Alat IS NULL)
            AND 
            (ads.Id_Sumber = @Id_Sumber OR @Id_Sumber IS NULL)
            AND
            (ads.Jumlah_Dari_Sumber = @Jumlah_Dari_Sumber OR @Jumlah_Dari_Sumber IS NULL)
            AND
            (ads.Tanggal_Masuk = @Tanggal_Masuk OR @Tanggal_Masuk IS NULL);
    END
END;
-- drop proc CRUDAlatDariSumber;
GO
-- Prosedur untuk CRUD PenempatanAlat
CREATE PROCEDURE CRUDPenempatanAlat
    @Mode varchar(10),
    @Id_Pemempatan int = null,
    @Jumlah_Dilokasi int = null,
    @Id_Lokasi int = null,
    @Id_Alat int = null
AS
BEGIN
    IF @Mode = 'INSERT'
    BEGIN
        INSERT INTO PenempatanAlat (Jumlah_Dilokasi, Id_Lokasi, Id_Alat)
        VALUES (@Jumlah_Dilokasi, @Id_Lokasi, @Id_Alat);
    END
    ELSE IF @Mode = 'UPDATE'
    BEGIN
        UPDATE PenempatanAlat
        SET Jumlah_Dilokasi = @Jumlah_Dilokasi
        WHERE Id_Pemempatan = @Id_Pemempatan;
    END
    ELSE IF @Mode = 'DELETE'
    BEGIN
        DELETE FROM PenempatanAlat
        WHERE Id_Pemempatan = @Id_Pemempatan;
    END
    ELSE IF @Mode = 'READ'
    BEGIN
        SELECT 
        pa.Id_Pemempatan, 
        pa.Jumlah_Dilokasi, 
        CONCAT(l.Id_Lokasi, ' - ', l.Nama_Lokasi) as Lokasi, 
        CONCAT(a.Id_Alat, ' - ', a.Nama_Alat) as Alat
        FROM PenempatanAlat as pa
        JOIN Lokasi as l on pa.Id_Lokasi = l.Id_Lokasi
        JOIN Alat as a on pa.Id_Alat = a.Id_Alat
        WHERE
            (pa.Id_Pemempatan = @Id_Pemempatan OR @Id_Pemempatan IS NULL)
            AND 
            (pa.Jumlah_Dilokasi = @Jumlah_Dilokasi OR @Jumlah_Dilokasi IS NULL)
            AND
            (pa.Id_Lokasi = @Id_Lokasi OR @Id_Lokasi IS NULL)
            AND
            (pa.Id_Alat = @Id_Alat OR @Id_Alat IS NULL);
    END
END;
-- drop proc CRUDPenempatanAlat;
GO
-- Prosedur untuk CRUD Pengecekan
CREATE PROCEDURE CRUDPengecekan
    @Mode varchar(10),
    @Id_Pengecekan int = null,
    @Kondisi_Alat_Baik int = null,
    @Kondisi_Alat_Rusak int = null,
    @Keterangan text = null,
    @Id_Pemempatan int = null,
    @Id_Admin int = null,
    @Tanggal_Pengecekan date = null
AS
BEGIN
    IF @Mode = 'INSERT'
    BEGIN
        IF @Tanggal_Pengecekan IS NULL
        BEGIN
            SET @Tanggal_Pengecekan = GETDATE();
        END
        INSERT INTO Pengecekan (Kondisi_Alat_Baik, Kondisi_Alat_Rusak, Tanggal_Pengecekan, Keterangan, Id_Pemempatan, Id_Admin)
        VALUES (@Kondisi_Alat_Baik, @Kondisi_Alat_Rusak, @Tanggal_Pengecekan, @Keterangan, @Id_Pemempatan, @Id_Admin);
    END
    ELSE IF @Mode = 'UPDATE'
    BEGIN
        IF @Tanggal_Pengecekan IS NULL
        BEGIN
            Select @Tanggal_Pengecekan = Tanggal_Pengecekan from Pengecekan where Id_Pengecekan = @Id_Pengecekan;
        END
        IF @Id_Admin IS NULL
        BEGIN
            Select @Id_Admin = Id_Admin from Pengecekan where Id_Pengecekan = @Id_Pengecekan;
        END
        UPDATE Pengecekan
        SET Kondisi_Alat_Baik = @Kondisi_Alat_Baik,
            Kondisi_Alat_Rusak = @Kondisi_Alat_Rusak,
            Tanggal_Pengecekan = @Tanggal_Pengecekan,
            Keterangan = @Keterangan,
            Id_Admin = @Id_Admin
        WHERE Id_Pengecekan = @Id_Pengecekan;
    END
    ELSE IF @Mode = 'DELETE'
    BEGIN
        DELETE FROM Pengecekan
        WHERE Id_Pengecekan = @Id_Pengecekan;
    END
    ELSE IF @Mode = 'READ'
    BEGIN
        SELECT 
        p.Id_Pengecekan, 
        CONCAT(p.Kondisi_Alat_Baik, '/', p.Kondisi_Alat_Rusak) as Kondisi_Baik_Rusak, 
        p.Tanggal_Pengecekan, 
        p.Keterangan, 
        CONCAT(p.Id_Pemempatan, ' - ', a.Nama_Alat, ' - ', l.Nama_Lokasi) as penempatan, 
        CONCAT(ai.Id_Admin,' - ',ai.Username) as Admin
        FROM Pengecekan as p
        Join PenempatanAlat as pa on p.Id_Pemempatan = pa.Id_Pemempatan
        Join alat as a on pa.Id_Alat = a.Id_Alat
        Join Lokasi as l on pa.Id_Lokasi = l.Id_Lokasi
        Join AdminIventaris as ai on p.Id_Admin = ai.Id_Admin
        WHERE
            (p.Id_Pengecekan = @Id_Pengecekan OR @Id_Pengecekan IS NULL)
            AND 
            (p.Kondisi_Alat_Baik = @Kondisi_Alat_Baik OR @Kondisi_Alat_Baik IS NULL)
            AND
            (p.Kondisi_Alat_Rusak = @Kondisi_Alat_Rusak OR @Kondisi_Alat_Rusak IS NULL)
            AND
            (p.Tanggal_Pengecekan = @Tanggal_Pengecekan OR @Tanggal_Pengecekan IS NULL)
            AND
            (p.Id_Pemempatan = @Id_Pemempatan OR @Id_Pemempatan IS NULL)
            AND
            (p.Id_Admin = @Id_Admin OR @Id_Admin IS NULL);
    END
END;
-- drop proc CRUDPengecekan;
GO