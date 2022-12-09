drop table if exists personel_bilgi
CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50),
maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id from personel where sehir='Istanbul' or sehir='Ankara';

--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3)

--3) Iki sorguyu INTERSECT ile birlestirin
select id from personel where sehir in('Istanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in(2,3)
order by id asc limit 1 

--Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas'
intersect
select isim from personel where sirket='Honda'


--1) 5000’den az maas alip Honda’da calismayanlari yazdirin
select isim,sirket from personel where maas<5000
except
select isim,sirket from personel where sirket='Honda'

--2) Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim,sehir from personel where isim='Mehmet Ozturk'
except
Select isim,sehir from personel where sehir='Istanbul'

CREATE TABLE sirketler
(sirket_id int,
 sirket_isim varchar(20) 
);
CREATE TABLE siparisler (
siparis_id int,
sirket_id int,
siparis_tarihi date );
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');
INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

select * from sirketler;
select * from siparisler;

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler FULL join siparisler
on siparisler.sirket_id=sirketler.sirket_id;


CREATE TABLE persone (
id int,
isim varchar(20), 
title varchar(60),
yonetici_id int
);
INSERT INTO persone VALUES(1, 'Ali Can', 'SDET', 2); 
INSERT INTO persone VALUES(2, 'Veli Cem', 'QA', 3); 
INSERT INTO persone VALUES(3, 'Ayse Gul', 'QA Lead',4);
INSERT INTO persone VALUES(4, 'Fatma Can', 'CEO', 5);

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select p1.isim,p2.isim from persone p1
 inner join persone p2
 on p1.yonetici_id=p2.id
 
 select * from musteriler
 
--SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
select isim from musteriler where isim ~~* 'A%';

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim from musteriler where isim ~~* '%e';

--SORU : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim from musteriler where isim Ilike '%er%'

--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_atma'

--SORU : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a%'

--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s%'

--SORU : Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s_'

--SORU : Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~ 'F___%'

--SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~* '_a_m%'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin
select * from kelimeler where kelime ~'h[a-k]t'

--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'[mi]'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '^[as]'

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~'[mf]$'

select upper(kelime) from kelimeler
select initcap(kelime) from kelimeler

 CREATE TABLE musteri_urun (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
 
--Tabloda kac farkli meyve vardir ?
select count(distinct (urun_isim)) as urun_cesit_sayisi from musteri_urun

-- Sirali tablodan ilk 3 kaydi listeleyin
select * from musteri_urun order by urun_id
fetch next 3 row only

--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun order by urun_id
offset 3 row
fetch next 4 row only

----3) Sirali tablodan 2. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun order by urun_id
offset 2
limit 7
--1) ADD default deger ile tabloya bir field ekleme
ALter table personel
add ulke_isim varchar(20);

--tabloya birden fazla field ekle
alter table personel
add  krmanc int default(12345)
--sutun silme
alter table personel
drop ulke_isim

--) RENAME COLUMN sutun adi degistirme
alter table personel 
rename krmanc to kurdo
 
 --Tablonun adını degisme
 alter table personel
 rename to baboli
 
 alter table baboli 
 rename to personel
 
 select * from personel
 alter table personel
 add ulke_ismi varchar(20)
 
--6) TYPE/SET sutunlarin ozelliklerini degistirme
alter table personel
alter column maas type varchar(20);  

alter column maas 
TYPE int USING(maas::varchar(20))



 
 
 

