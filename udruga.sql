drop database if exists udruga;
create database udruga;
use udruga;

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null
);

create table sticenik(
    sifra int not null primary key auto_increment,
    djelatnik int,
    ime varchar(50) not null,
    pasmina varchar(50) not null,
    starost varchar(50) not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    velicina decimal(18,2),
    tip boolean,
    sticenik int
);

alter table sticenik add foreign key (djelatnik) references djelatnik(sifra);

alter table prostor add foreign key (sticenik) references sticenik(sifra);

insert into djelatnik(sifra,ime,prezime,email) values
(null,'Perica','Perković','perica.perkovic@gmail.com'),
(null,'Patricija','Marković','patricija.markovic@gmail.com'),
(null,'Nikolina','Janković','nikolinajankovic@gmail.com'),
(null,'Mario','Jan','mjan@gmail.com'),
(null,'Ana','Šeri','anaseri@gmail.com'),
(null,'Antonio','Alinić','antonioali@gmail.com');

insert into sticenik(sifra,djelatnik,ime,pasmina,starost) values
(null,1,'Kevin','Zlatni retriver','5'),
(null,2,'Jacky','Njemački ovčar','11'),
(null,3,'Bigi','Mješanac','14');

insert into prostor(sifra,velicina,tip,sticenik) values
(null,'10.11',true,1),
(null,'8.58',false,2),
(null,'5.56',true,3);

update djelatnik set oib=58789654612 where sifra=1;
update djelatnik set oib=47831254687 where sifra=5;
update djelatnik set oib=97835468785 where sifra=6;