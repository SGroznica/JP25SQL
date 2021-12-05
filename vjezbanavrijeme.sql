drop database if exists vjezba1;
create database vjezba1 character set utf8;
use vjezba1;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table sestra(
    sifra int not null primary key auto_increment,
    intreovertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstrovetno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

alter table cura add foreign key (punac) references punac(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

insert into sestra (sifra,haljina,hlace,narukvica) values
(null,'Crvena','Levis','Zlatna'),
(null,'Zelena','Mustang','Srebrna'),
(null,'Plava','Stradivarius','Zlatna');

insert into zena (sifra,kratkamajica,jmbag,bojaociju,sestra) values
(null,'Zuta','89645612354','Smeđa',1),
(null,'Crna','23465897612','Plava',2),
(null,'Ljubičasta','24489632154','Zelena',3);

insert into muskarac (sifra,bojaociju,maraka,zena) values
(null,'Plava','56.6',1),
(null,'Smeđa','70.3',2),
(null,'Zelena','64.4',3);

insert into svekar (sifra,bojaociju) values
(null,'Plava'),
(null,'Zelena'),
(null,'Smeđa');

insert into sestra_svekar (sifra,sestra,svekar) values
(null,1,1),
(null,2,2),
(null,3,3);

update cura set gustoca='15.77' where sifra>=1;



