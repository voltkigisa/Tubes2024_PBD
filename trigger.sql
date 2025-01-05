-- Trigger untuk menghash password sebelum disimpan
CREATE TRIGGER trg_HashPassword
ON AdminIventaris
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Username varchar(30);
    DECLARE @Password varchar(64);
    -- password hashed dalam bentuk binary
    DECLARE @HashedPassword varbinary(64);
    -- password hashed dalam bentuk hexadecimal
    DECLARE @HashedPasswordHex varchar(128);

    -- Loop setiap row di inserted table
    DECLARE cur CURSOR FOR
    SELECT Username, Password
    FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Username, @Password;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- mengecek apakah password sudah di hash
        IF LEN(@Password) != 64
        BEGIN
            -- menghash password
            SET @HashedPassword = HASHBYTES('SHA2_256', @Password);
            
            -- mengubah hashed password ke hexadecimal
            SET @HashedPasswordHex = CONVERT(varchar(128), @HashedPassword, 2);
            
            -- update password yang sudah di hash
            UPDATE AdminIventaris
            SET Password = @HashedPasswordHex
            WHERE Username = @Username;
        END

        FETCH NEXT FROM cur INTO @Username, @Password;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
-- Drop Trigger trg_HashPassword;
GO
-- Trigger untuk mengupdate jumlah_total di alat ketika ada penambahan atau perubahan jumlah alat di AlatDariSumber
CREATE TRIGGER trg_UpdateJumlahTotal
ON AlatDariSumber
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Id_Alat int;
    DECLARE @Jumlah_Dari_Sumber int;
    DECLARE @Jumlah_Dari_Sumber_Old int;

    -- Loop setiap row di inserted table
    DECLARE cur CURSOR FOR
    SELECT Id_Alat, Jumlah_Dari_Sumber
    FROM inserted;
    
    OPEN cur;
    FETCH NEXT FROM cur INTO @Id_Alat, @Jumlah_Dari_Sumber;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted WHERE Id_Alat = @Id_Alat)
        BEGIN
            -- update jumlah total alat for update
            SELECT @Jumlah_Dari_Sumber_Old = Jumlah_Dari_Sumber
            FROM deleted
            WHERE Id_Alat = @Id_Alat;

            UPDATE Alat
            SET Jumlah_Total = Jumlah_Total + (@Jumlah_Dari_Sumber - @Jumlah_Dari_Sumber_Old)
            WHERE Id_Alat = @Id_Alat;
        END
        ELSE
        BEGIN
            -- update jumlah total alat for insert
            UPDATE Alat
            SET Jumlah_Total = Jumlah_Total + @Jumlah_Dari_Sumber
            WHERE Id_Alat = @Id_Alat;
        END

        FETCH NEXT FROM cur INTO @Id_Alat, @Jumlah_Dari_Sumber;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
-- drop trigger trg_UpdateJumlahTotal;
GO
-- Trigger Validasi Jumlah Alat di Pengecekan
CREATE TRIGGER trg_ValidasiJumlahAlatPengecekan
ON Pengecekan
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Id_Pemempatan int;
    DECLARE @Jumlah_Dilokasi int;
    DECLARE @Kondisi_Alat_Rusak int;
    DECLARE @Kondisi_Alat_Baik int;
    DECLARE @TotalKondisi int;

    -- Loop setiap row di inserted table
    DECLARE cur CURSOR FOR
    SELECT Kondisi_Alat_Rusak, Kondisi_Alat_Baik, Id_Pemempatan
    FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Kondisi_Alat_Rusak, @Kondisi_Alat_Baik, @Id_Pemempatan;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- mengambil jumlah alat dilokasi
        SELECT @Jumlah_Dilokasi = Jumlah_Dilokasi from PenempatanAlat where Id_Pemempatan = @Id_Pemempatan;
        -- menghitung total kondisi alat
        SET @TotalKondisi = @Kondisi_Alat_Rusak + @Kondisi_Alat_Baik;

        -- validasi jumlah alat
        IF @Jumlah_Dilokasi != @TotalKondisi
        BEGIN
            RAISERROR ('Jumlah alat tidak valid.Total jumlah alat rusak dan baik harus sama dengan Jumlah alat di lokasi.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        FETCH NEXT FROM cur INTO @Kondisi_Alat_Rusak, @Kondisi_Alat_Baik, @Id_Pemempatan;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;
-- drop trigger trg_ValidasiJumlahAlatPengecekan;
GO
-- Trigger validasi jumlah alat di PenempatanAlat
CREATE TRIGGER trg_ValidasiJumlahAlatPenempatan
ON PenempatanAlat
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Id_Alat int;
    DECLARE @Jumlah_Dilokasi int;
    DECLARE @Jumlah_Tersedia int;

    -- Loop setiap row di inserted table
    DECLARE cur CURSOR FOR
    SELECT Jumlah_Dilokasi, Id_Alat
    FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @Jumlah_Dilokasi, @Id_Alat;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- menghitung jumlah alat tersedia di iventaris
        Select @Jumlah_Tersedia = a.Jumlah_Total - ISNULL(SUM(pa.Jumlah_Dilokasi), 0) 
        from 
            Alat as a 
            inner join PenempatanAlat as pa on a.Id_Alat = pa.Id_Alat
        where 
            pa.Id_Alat = @Id_Alat
        Group by 
            a.Jumlah_Total;
        -- validasi jumlah alat
        IF @Jumlah_Tersedia < @Jumlah_Dilokasi
        BEGIN
            RAISERROR ('Jumlah alat tidak valid. Jumlah alat di lokasi melebihi jumlah alat yang tersedia.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        FETCH NEXT FROM cur INTO @Jumlah_Dilokasi, @Id_Alat;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;