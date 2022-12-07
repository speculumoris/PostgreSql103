CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler  (
siparis_id int, 
sirket_id int,  
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17'); 
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

select * from sirketler
select * from siparisler


--JOIN

-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, 
--siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler INNER JOIN siparisler
on sirketler.sirket_id=siparisler.sirket_id;

/*
	NOT :
	1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
	2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
	3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
 */
 /*
 NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */
 
 --LEFT JOIN
 
 select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler LEFT JOIN siparisler
on sirketler.sirket_id=siparisler.sirket_id;

--RIGHT JOIN
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi 
from siparisler LEFT JOIN sirketler
on sirketler.sirket_id=siparisler.sirket_id;

/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/

drop table personel cascade
CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);
select * from personel

---- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select isim from personel

select p1.isim as personel_isim ,p2.isim as yonetici_isim 
from personel p1 inner join personel p2 
on p1.yonetici_id=p2.id

-- 								LIKE Condition
/*
LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
imkani verir.
*/
CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'asim', 82000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'Erhan', 83000);


-- Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz. Eğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/
SELECT * FROM musteriler WHERE isim ILIKE 'A%'
SELECT * FROM musteriler WHERE isim ~~* 'A%'

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler where isim ~~ '%e'

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler where isim ~~* '%er%'

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim ~~'_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a%'

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim ~~ '__s%'

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);


--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--QUERY yazin

select * from kelimeler where kelime ~* 'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin

select * from kelimeler where kelime ~* 'h[a-k]t'








