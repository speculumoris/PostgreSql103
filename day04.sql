CREATE TABLE ogrenciler93
(
ogrenci_no char(7),
isim varchar(20), public.ogrenciler93
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no,isim),  --COMPOSİTE PK  
unique (soyisim,not_ort)
);

---ALIASES

CREATE TABLE calisanlar (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789,'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar;

-- eger iki sutunun verilerini birlestirmek istersek concat sembolu olan "||" sembolu kullaniriz...
select calisan_id as id, calisan_isim || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar;

--2.yol
select calisan_id as id, concat(calisan_isim,calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar;



CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli'); 

select * from insanlar;

--Name sutununda null olan degerleri listeleyelim

-- Name sutununda null olan değerleri listeleyelim
SELECT isim FROM insanlar WHERE isim IS NULL

-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz
SELECT isim FROM insanlar WHERE isim IS NOT NULL

-- Insanlar tablosunda null değer almış verileri no name olarak değiştiriniz

UPDATE insanlar
SET isim='No Name'
WHERE isim IS NULL;

select * from insanlar


-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
drop table if exists insanlar
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

select * from insanlar;

--Insanlar tablosundaki datalari adres’e gore siralayin

select * from insanlar order by adres;

select * from insanlar order by isim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar where isim='Mine' order by ssn;

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar where soyisim = 'Bulut' order by 1;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar order by isim asc, soyisim desc;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız;

select isim,soyisim from insanlar order by LENGTH(soyisim) desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select * from insanlar;

select isim ||' '||soyisim as isim_soyisim from insanlar order by length(isim||soyisim) ;

select isim ||' '||soyisim as isim_soyisim from insanlar order by length(isim)+length (soyisim);

CREATE TABLE manav
(
isim varchar(50),  
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

--isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz


select isim,sum(urun_miktar) as aldigi_toplam_urun from manav
group by isim
order by aldigi_toplam_urun desc;

-- Urun ismine gore urunu alan toplam kisi sayisi

select urun_adi,count(isim) as urunu_alan_kisi_sayisi
from manav
group by urun_adi;

















