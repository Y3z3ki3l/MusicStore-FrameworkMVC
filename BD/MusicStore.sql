/* Testé sous MySQL 5.x */

drop table if exists T_ALBUM;
drop table if exists T_ARTISTE;
drop table if exists T_GENRE;

create table T_GENRE (
  GEN_ID integer primary key auto_increment,
  GEN_NOM varchar(100) not null
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_ARTISTE (
  ART_ID integer primary key auto_increment,
  ART_NOM varchar(100) not null
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_ALBUM (
  ALB_ID integer primary key auto_increment,
  ALB_NOM varchar(100) not null,
  GEN_ID integer not null,
  constraint fk_alb_gen foreign key(GEN_ID) references T_GENRE(GEN_ID),
  ART_ID integer not null,
  constraint fk_alb_art foreign key(ART_ID) references T_ARTISTE(ART_ID)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into T_GENRE(GEN_NOM) values ('Pop/Rock');
insert into T_GENRE(GEN_NOM) values ('Classique');
insert into T_GENRE(GEN_NOM) values ('Blues');
insert into T_GENRE(GEN_NOM) values ('R&B');
insert into T_GENRE(GEN_NOM) values ('Rap');
insert into T_GENRE(GEN_NOM) values ('Reggae');
insert into T_GENRE(GEN_NOM) values ('Electro');
insert into T_GENRE(GEN_NOM) values ('Country');
insert into T_GENRE(GEN_NOM) values ('Folk');

insert into T_ARTISTE(ART_NOM) values ('The White Stripes');

insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Get Behind Me Satan', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Let It Bleed', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Mellon Collie And The Infinite Sadness', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Achtung Baby', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('London Calling', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Bossanova', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Definitely Maybe', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Pacifc Ocean Blue', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('The Beatles (White Album)', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Nebraska', 1, 1);
insert into T_ALBUM(ALB_NOM, GEN_ID, ART_ID) values ('Ziggy Stardust', 1, 1);

