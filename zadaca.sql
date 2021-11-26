#knjiznica

select * from autor where datumrodenja is null;

select * from autor;
insert into autor(sifra,ime,prezime,datumrodenja) values
(4,'Stjepan','Groznica','1995-03-25');

select * from autor where datumrodenja='1995-03-25';

select * from autor where ime='Stjepan';

select * from izdavac;

select * from izdavac where naziv like '%d.o.o.%';

#world

select * from country where Continent like '%Europe%';

select * from country where Name like '%Croatia%';

insert into city(ID,Name,CountryCode,District,Population)
values (null,'Donji Miholjac','HRV','Beli Manastir','500.00');

select * from city where CountryCode='HRV';

update city set District='Osijek-Baranja' where ID=4080;

update city set Name='Spickovina' where ID=4080;

delete from city where ID=4080;

#knjiznica nova DZ

select a.naslov, b.aktivan
from katalog a inner join izdavac b on a.izdavac = b.sifra
where b.aktivan='0';

select b.ime, b.prezime, a.naslov
from katalog a inner join autor b on a.autor = b.sifra
where a.naslov not like '%b%';

select * from izdavac;

select b.naziv, b.aktivan
from katalog a inner join izdavac b on a.izdavac = b.sifra
left join mjesto c on a.mjesto = c.sifra
where c.postanskiBroj='10000';

#sakila

select b.country, a.city, c.address, c.address2 
from city a inner join country b on a.country_id = b.country_id
left join address c on c.city_id = a.city_id
where address2 is null;