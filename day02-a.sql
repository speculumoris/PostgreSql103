CREATE TABLE ogrenciler5
(
ogrenci_no char(7),--Uzunlugunu bildigimiz stringler icin CHAR kullanilir
isim varchar(20),--uzunlugunu bilmedigimiz stringler icin VARCHAR kullanilirz
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date
);
-- VAROLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMA

create table notlar
as
select isim,not_ort from ogrenciler5


--INSERT_ tablo icine veri eklene

insert into notlar values ('Evren',85.5);
insert into notlar values ('baba',81.5);
insert into notlar values ('Evren',65.5);
insert into notlar values ('vanga',25.5);
insert into notlar values ('tata',45.5);

select * from notlar;

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null ,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler6;

insert into ogrenciler7 values ('1234567','yusuf','bay',75.5,now());
insert into ogrenciler7 values ('1234568','ali','veli',75.5,now());
insert into ogrenciler7 (ogrenci_no,soyisim,not_ort) Values ('1234569','evren',45.6)--NO NULL 	kısıtlamasi oldugu icin bu veri eklenemez

select * from ogrenciler7;

--PRİMARY KEY OLUSTURMA
CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20) ,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

--PRİMARY KEY ATAMASİ İKİNCİ YOL

CREATE TABLE ogrenciler9
(
ogrenci_no char(7),
isim varchar(20)  ,
soyisim varchar(25),
not_ort real,
kayit_tarih date,
CONSTRAINT	ogr PRIMARY KEY(ogrenci_no)
);

CREATE TABLE ogrenciler10
(
ogrenci_no char(7),
isim varchar(20)  ,
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);


--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun 
--ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

create table tedarikciler3
(
tedarikci_id char(8) PRIMARY KEY,
tedarikci_ismi varchar(20),	
iletisim_isim  varchar(12)
);

create table urunler
(
tedarikci_id char(8),
urun_ıd varchar(5),
constraint urn_fk foreign key (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
select * from urunler
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * FROM calisanlar;
SELECT * FROM adresler;

CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10003', 'Mehmet Yılmaz1' ,19000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10008', null, 15000, '2018-04-14');
SELECT * FROM calisanlar1;




-- DQL -- WHERE kullanımı

select * from calisanlar;
select isim from calisanlar

-- calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz

select isim,maas FROM calisanlar WHERE maas >5000;

--Calisanlar tablosundan ismi veli han olan tüm verileri listeleyiniz

select * from calisanlar where isim='Veli Han';

--Calisanlar tablosundan maasi 5000 olan tüm verileri listeleyiniz
select * from calisanlar where maas='5000'

-- DML -- DELETE KOMUTU

DELETE FROM calisanlar ; -- eger parent tablo baska bir child tablo ile iliskili ise önce child table silinmelidir
delete from adresler;
select * from adresler;


--adresler tablosunda sehri antep olan verileri silelim
delete from adresler where sehir='Antep';


CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);






							  