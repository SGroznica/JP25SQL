drop database if exists muzej;
create database muzej character set utf8;
use muzej;

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    oib char(11)
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    autor varchar (50) not null,
    cijena decimal (18,2),
    izlozba int 
);

create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kustos int,
    sponzor int,
    datumpocetka datetime
);

alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

insert into kustos (sifra,ime,prezime,email) values
(null,'Pero','Perić','peroperic@gmail.com'),
(null, 'Josip', 'Josipović','josipjosipovic@gmail.com'),
(null, 'Stipe','Stipić','stipestipic@gmail.com');

update kustos set oib='25678945623' where sifra=1;
update kustos set oib='65789453965' where sifra=2;
update kustos set oib='86245368122' where sifra=3;

insert into djelo (sifra,naziv,autor) values
(null, 'Mona Lisa','Leonardo da Vinci');

insert into sponzor (sifra,naziv) values
(null,'Vindija'),
(null, 'Milka'),
(null, 'Dukat'),
(null, 'ZABA'); 

insert into izlozba (sifra,naziv,kustos,sponzor) values
(null,'Proljeće',1,1),
(null,'Ljeto',2,2),
(null,'Jesen',3,3);

update izlozba set sponzor=4 where sifra=3;

delete from sponzor where sifra=3;