drop database if exists frizerski;
create database frizerski;
use frizerski;

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    placa decimal(18,2) 
);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    usluga int,
    brojmobitela varchar(50),
    datum datetime    
);

create table usluga(
    sifra int not null primary key auto_increment,
    djelatnik int not null,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);


alter table korisnik add foreign key (usluga) references usluga(sifra);

alter table usluga add foreign key (djelatnik) references djelatnik(sifra);

alter table djelatnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (osoba) references osoba(sifra);

insert into osoba(sifra,ime,prezime) values
(null,'Perica','Perković'),
(null,'Patricija','Marković'),
(null,'Nikolina','Janković'),
(null,'Mario','Jan'),
(null,'Ana','Šeri'),
(null,'Antonio','Alinić');

insert into djelatnik(sifra,osoba) values
(null,1),
(null,2);

insert into usluga(sifra,djelatnik,naziv) values
(null,1,'Šišanje i pranje kose'),
(null,2,'Feniranje');

insert into korisnik(sifra,osoba,usluga) values
(null,3,1),
(null,4,2);

update djelatnik set placa='5846.64' where sifra=1;
update djelatnik set placa='5786.43' where sifra=2;
