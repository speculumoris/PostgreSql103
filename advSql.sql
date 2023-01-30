
-- açıklama 

-- **************  DEĞİŞKEN TANIMLAMA *****************************

do $$ -- anonymous blok , dolar işaretini özel karakterler öncesinde tırnak işaretlerini kullanmamak için
declare
	counter integer := 1 ; -- counter isminde değişken oluşturuldu ve default değeri verildi
	first_name varchar(50) := 'Ahmet' ;
	last_name varchar(50) := 'Gok'; 
	payment numeric(4,2) := 20.5 ; -- numeric(precision , scale)-> precision : 1 den 38 e kadar değer girebiliyorum
begin
	raise notice '% % % has been paid % USD',
		counter,
		first_name,
		last_name,
		payment;
end $$ ;

-- Task 1 : değişkenler oluşturarak ekrana  Ahmet ve Mehmet beyler 120 tl ye bilet aldılar.  
	--cümlesini ekrana basınız
do $$
declare
	first_person varchar(50) := 'Ahmet';
	second_person varchar(50) := 'Mehmet';
	payment numeric(3) := 120;
begin
	raise notice '% ve % Beyler % TL ye bilet aldılar',
		first_person,
		second_person,
		payment;
end $$;

-- ********  BEKLETME KOMUDU **************
do $$
declare
	create_at time := now(); -- atama yapıldı
begin	
	raise notice '%' , create_at;
	perform pg_sleep(5); -- 5 saniye bekle
	raise notice '%' , create_at;
end $$;
	

-- ******** TABLODAN DATA TİPİNİ KOPYALAMA ********
do $$ 
declare
	film_title film.title%type;   -- film_title text ;
	--featured_title film.title%type;
begin
	-- 1 id li filmin ismini getirelim
	select title -- text
	from film
	into film_title  -- film_title := 'Kuzuların Sessizliği'
	where id=1;
	
	raise notice 'Film title with id 1 : %', film_title;
end $$ ;


-- ***************** ROW TYPE ********************
do $$
declare
	selected_actor actor%rowtype; 
begin
	-- id si 1 olan actoru getir
	select *
	from actor
	into selected_actor
	where id =1;
	
	raise notice 'The actor name is : % %',
		selected_actor.first_name,
		selected_actor.last_name;
end $$ ;

-- ***************** Record TYPE ********************

do $$
declare 
	rec record ;
begin
	select id,title,type
	into rec
	from film
	where id=2;
	
	raise notice '% % %',rec.id,rec.title,rec.type;
end $$ ;

-- ******** İç İÇE BLOK ********************

do $$
<<outer_blok>>
declare  -- outher blok
	counter integer := 0;
begin
	counter := counter +1;
	raise notice 'counter değerim : %', counter;
	
	declare -- inner blok
		counter integer :=0;
		
	begin -- inner blok
		counter := counter +10 ;
		raise notice 'iç blokdaki counter değerim : % ', counter;
		raise notice 'dış blokdaki counter değerim : % ', outer_blok.counter;
	
	end; -- inner blok sonu
	
	raise notice 'dış blokdaki counter değerim : %', counter;

end $$ ;


-- ***************** Constant ********************************
-- selling_price := net_price * 0.1 ;   => bu tur hard kodlardan uzak durmak lazim
-- selling_price := net_price + net_price * vat;
do $$
declare
    vat constant numeric := 0.1;
    net_price numeric := 20.5;
begin
    raise notice 'SATIS FIYATI : %', net_price*(1+vat);
    -- vat := 0.05;  constant bir ifadeyi degistirmeye calisirsak hata aliriz
end $$;
-- constant bir ifadeye RT de deger verebilirmiyim.
do $$
declare
    start_at constant time := now();
begin
    raise notice 'blogun calisma zamani : %', start_at;
end $$;







	

























	