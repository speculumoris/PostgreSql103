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

select * from notlar;

--INSERT_ tablo icine veri eklene

insert into notlar values ('Evren',85.5);
insert into notlar values ('baba',81.5);
insert into notlar values ('Evren',65.5);
insert into notlar values ('vanga',25.5);
insert into notlar values ('tata',45.5);


