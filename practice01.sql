drop table if exists isci_bilgileri
create table isci_bilgileri
(
id char(9),
isim varchar(30),
soyisim varchar(30),
email varchar(50),
ise_bas_tarihi varchar(10),
unvan varchar(10),
maas int
);
insert into isci_bilgileri values('123456789','Ali','Bas','a@gmail.com','10-12-22','isci',5000);
insert into isci_bilgileri values('123456788','Veli','Kafa','b@gmail.com','10-12-22','isci',4000);
insert into isci_bilgileri values('123456787','Ayse','Taktak','c@gmail.com','10-12-22','muhendis',5500);
insert into isci_bilgileri values('123456786','Fatma','Haci','d@gmail.com','10-12-22','tamirci',4300);
select * from isci_bilgileri;
/*
b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin 
c) Iscilerin tum bilgilerini listeleyin
d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
e) Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
*/
--b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin 
select * from isci_bilgileri where maas<5000 or unvan='isci';

--c) Iscilerin tum bilgilerini listeleyin
select * from isci_bilgileri;

--d) Soyadi Bas,Kafa veya Haci olanlarin unvanlarini ve maaslarini listeleyin
select soyisim,unvan,maas from isci_bilgileri where soyisim in('Bas','Kafa','Haci');

--e) Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
select maas,email,ise_bas_tarihi from isci_bilgileri where maas>=5000;

--f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
select * from isci_bilgileri where 5000<maas and maas<7000;
DROP TABLE IF EXISTS insanlar
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
SELECT isim, soyisim FROM insanlar ORDER BY LENGTH (soyisim); 

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar order by isim asc ,soyisim desc;

--1) Isme gore alinan toplam urunleri bulun
select isim,sum(urun_miktar) from manav
group by isim;
--2) Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi,count(isim) from manav
group by urun_adi

--3) Alinan kilo miktarina gore musteri sayisi
SELECT urun_miktar,COUNT(isim) AS urun_miktarini_alan_kisiSayisi FROM manav
GROUP BY urun_miktar

--1) Isme gore toplam maaslari bulun
select isim,sum(maas) as toplam_maas from personel
group by isim;

--sehre gore toplam personel sayisini bulun
SELECT sehir,COUNT(isim) AS toplam_eleman_sayisi FROM personel
GROUP BY sehir

--3) Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket,count(*) as calisan_sayisi
from personel where maas>5000 group by sirket;

--4) Her sirket icin Min ve Max maasi bulun
SELECT MIN(maas) AS min_maas,MAX(maas) AS max_maas from personel
GROUP BY sirket 

--1) Her sirketin MIN maaslarini eger 2000’den buyukse goster
select sirket,min(maas) from personel 
group by sirket
having min(maas)>4000;

--2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
--ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas)as toplam_maas from personel group by isim
having sum(maas)>10000;
--3) Eger bir sehirde calisan personel sayisi 1’den 
--coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir,count(isim)as personel_sayisi from personel
group by sehir
having count(isim)>1;

--4) Eger bir sehirde alinan MAX maas 5000’den dusukse 
--sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir,max(maas) as max_maas from personel
group by sehir
having max(maas)<5000;

--1) Maasi 4000’den cok olan isci isimlerini ve 
--5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_ve_sehir,maas  from personel where maas>4000
union
select sehir,maas from personel where maas>5000

--3) Sehirlerden odenen ucret 3000’den fazla olanlari ve
--personelden ucreti 5000’den az olanlari bir tabloda maas miktarina 
--gore sirali olarak gosteren sorguyu yaziniz

select sehir,maas from personel where maas>3000
union 
select isim,maas from personel where maas<5000
order by sehir

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50), maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)

--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini,
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin

select sehir as sehir_ve_telNo,maas from personel where id='123456789'
union
select tel,cocuk_sayisi from personel_bilgi where id='123456789';
	
	