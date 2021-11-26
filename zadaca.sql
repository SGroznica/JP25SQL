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

update city set District='Osijek-Baranja' where ID=4081;

update city set Name='Spickovina' where ID=4081;

delete from city where ID=4081;