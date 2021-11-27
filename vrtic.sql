drop database if exists vrtic;
create database vrtic;
use vrtic;

create table vrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    oib char(11)
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    osoba int,
    placa decimal(18,2),
    strucnasprema varchar(50),
    vrtic int
);

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    odgajateljica int
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int,
    odgojnaskupina int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11),
    adresa varchar(50)
);

alter table odgajateljica add foreign key (vrtic) references vrtic(sifra);

alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica(sifra);

alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina(sifra);

alter table odgajateljica add foreign key (osoba) references osoba(sifra);
alter table dijete add foreign key (osoba) references osoba(sifra);

