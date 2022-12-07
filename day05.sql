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

select * from personel;
--1)Isme gore toplam maaslari bulun;
select isim,sum(maas) from personel
group by isim 

-- personel tablosundaki isimleri gruplayınız
select isim, count(sehir) from personel group by isim

--HAVING KULLANIMI
/*
Having komutu yalnızca group by komutu ile kullanılır
Eger gruplamadan sonra bir sart varsa having komutu kullanılır
Where kullanımı ile aynı mantıkta calisir
*/
--2) Her sirketin MIN maaslarini eger 4000’den buyukse goster

select * from personel

select sirket, min(maas) as en_dusuk_maas from personel
group by sirket
having  min(maas)>4000

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

select isim,sum(maas) as toplam_maas from personel 
group by isim
having sum(maas)>10000

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

select sehir,count(isim) from personel
group by sehir
having count(isim)>1

-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz

select sehir ,max(maas) from personel 
group by sehir
having max(maas)<5000;

-- 5) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
(select isim as isim_ve_sehirler,maas from personel where maas>4000) 
union
(select sehir,maas from personel where maas>5000)

-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz
select isim as sehir_ve_personel,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
order by maas;

drop table if exists personel
CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);	
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel_bilgi;
select * from personel;

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

select sehir as sehir_ve_tel,maas from personel where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789;

/*
UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir, 
Ayni kayit birden fazla olursa, sadece bir tanesini alir. 
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
*/
				--UNION ALL--

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz


select isim,maas from personel where maas<5000
union all
select isim,maas from personel where maas <5000;

/*
SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. 
Bir sorguda bir kayıt varsa ve diğerinde yoksa, INTERSECT sonuçlarından çıkarılacaktır.
*/
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

select id from personel where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in(2,3)

select * from personel
-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin

select isim from personel where sirket='Honda'
intersect
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas'

--5000’den az maas alip Honda’da calismayanlari yazdirin
select isim,sirket from personel where maas<5000
except
select isim,sirket from personel where sirket='Honda'
select * from personel









