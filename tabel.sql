Create database tugasBesar;
use tugasBesar;
create table Lokasi (
  Id_Lokasi int IDENTITY(1,1) primary key,
  Nama_Lokasi varchar(100) not null,
  Kode_Ruangan char(5) null,
  Penanggung_Jawab varchar(100) not null
);

create table Sumber(
    Id_Sumber int IDENTITY(1,1) primary key,
    Nama_Sumber varchar(50) not null,
    No_Kontak varchar(13) unique not null,
    Email varchar(100) Unique not null
);

create table Alat(
    Id_Alat int IDENTITY(1,1) primary key,
    Nama_Alat varchar(100) not null unique,
    Jumlah_Total int not null DEFAULT 0,
    Deskripsi text not null,
    Jenis_Alat varchar(100) not null,
);

CREATE TABLE AlatDariSumber(
    Id_Alat int not null foreign key (Id_Alat) references alat(Id_Alat) on UPDATE cascade on DELETE cascade,
    Id_Sumber int not null foreign key (Id_Sumber) references sumber(Id_Sumber) on UPDATE cascade on DELETE cascade,
    Jumlah_Dari_Sumber int not null,
    Tanggal_Masuk date not null DEFAULT GETDATE()
    );

CREATE TABLE PenempatanAlat(
    Id_Pemempatan int IDENTITY(1,1) primary key,
    Jumlah_Dilokasi int not null,
    Id_Lokasi int not null foreign key (Id_Lokasi) references lokasi(Id_Lokasi) on UPDATE cascade on DELETE cascade,
    Id_Alat int not null foreign key (Id_Alat) references alat(Id_Alat) on UPDATE cascade on DELETE cascade
);

create TABLE AdminIventaris (
    Id_Admin int IDENTITY(1,1) primary key,
    Username varchar(30) not null unique,
    Password char(64) not null unique
);

CREATE table Pengecekan(
    Id_Pengecekan int IDENTITY(1,1) primary key,
    Kondisi_Alat_Baik int not null,
    Kondisi_Alat_Rusak int not null,
    Tanggal_Pengecekan date not null DEFAULT GETDATE(),
    Keterangan text not null,
    Id_Pemempatan int not null foreign key (Id_Pemempatan) references PenempatanAlat(Id_Pemempatan) on UPDATE cascade on DELETE cascade,
    Id_Admin int not null foreign key (Id_Admin) references AdminIventaris(Id_Admin) on UPDATE cascade on DELETE cascade
);
