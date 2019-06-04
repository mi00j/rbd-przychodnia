/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     03.06.2019 18:54:29                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LEKARZ') and o.name = 'FK_LEKARZ_RELATIONS_SPECJALI')
alter table LEKARZ
   drop constraint FK_LEKARZ_RELATIONS_SPECJALI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WIZYTA') and o.name = 'FK_WIZYTA_RELATIONS_OCENA')
alter table WIZYTA
   drop constraint FK_WIZYTA_RELATIONS_OCENA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WIZYTA') and o.name = 'FK_WIZYTA_RELATIONS_LEKARZ')
alter table WIZYTA
   drop constraint FK_WIZYTA_RELATIONS_LEKARZ
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WIZYTA') and o.name = 'FK_WIZYTA_RELATIONS_PACJENT')
alter table WIZYTA
   drop constraint FK_WIZYTA_RELATIONS_PACJENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LEKARZ')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index LEKARZ.Relationship_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LEKARZ')
            and   type = 'U')
   drop table LEKARZ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OCENA')
            and   type = 'U')
   drop table OCENA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PACJENT')
            and   type = 'U')
   drop table PACJENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SPECJALIZACJA')
            and   type = 'U')
   drop table SPECJALIZACJA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WIZYTA')
            and   name  = 'Relationship_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index WIZYTA.Relationship_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WIZYTA')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index WIZYTA.Relationship_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WIZYTA')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index WIZYTA.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WIZYTA')
            and   type = 'U')
   drop table WIZYTA
go

/*==============================================================*/
/* Table: LEKARZ                                                */
/*==============================================================*/
create table LEKARZ (
   ID_LEKARZA           int                  not null,
   ID_SPECJALIZACJI     int                  null,
   IMIE                 varchar(30)          not null,
   NAZWISKO             varchar(30)          not null,
   DATA_PODPISANIA_KONTRAKTU int                  not null,
   constraint PK_LEKARZ primary key (ID_LEKARZA)
)
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_4_FK on LEKARZ (ID_SPECJALIZACJI ASC)
go

/*==============================================================*/
/* Table: OCENA                                                 */
/*==============================================================*/
create table OCENA (
   ID_OCENY             int                  not null,
   WARTOSC              int                  not null,
   OPIS                 varchar(1024)        not null,
   constraint PK_OCENA primary key (ID_OCENY)
)
go

/*==============================================================*/
/* Table: PACJENT                                               */
/*==============================================================*/
create table PACJENT (
   ID_PACJENTA          int                  not null,
   IMIE                 varchar(30)          not null,
   NAZWISKO             varchar(30)          not null,
   WIEK                 int                  not null,
   constraint PK_PACJENT primary key (ID_PACJENTA)
)
go

/*==============================================================*/
/* Table: SPECJALIZACJA                                         */
/*==============================================================*/
create table SPECJALIZACJA (
   ID_SPECJALIZACJI     int                  not null,
   NAZWA                varchar(30)          not null,
   constraint PK_SPECJALIZACJA primary key (ID_SPECJALIZACJI)
)
go

/*==============================================================*/
/* Table: WIZYTA                                                */
/*==============================================================*/
create table WIZYTA (
   ID_WIZYTY            int                  not null,
   ID_OCENY             int                  null,
   ID_PACJENTA          int                  null,
   ID_LEKARZA           int                  null,
   DATA                 datetime             not null,
   OPLATA               int                  not null,
   CZAS_TRWANIA         int                  not null,
   NUMER_GABINETU       int                  not null,
   constraint PK_WIZYTA primary key (ID_WIZYTY)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_1_FK on WIZYTA (ID_OCENY ASC)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_2_FK on WIZYTA (ID_LEKARZA ASC)
go

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_3_FK on WIZYTA (ID_PACJENTA ASC)
go

alter table LEKARZ
   add constraint FK_LEKARZ_RELATIONS_SPECJALI foreign key (ID_SPECJALIZACJI)
      references SPECJALIZACJA (ID_SPECJALIZACJI)
go

alter table WIZYTA
   add constraint FK_WIZYTA_RELATIONS_OCENA foreign key (ID_OCENY)
      references OCENA (ID_OCENY)
go

alter table WIZYTA
   add constraint FK_WIZYTA_RELATIONS_LEKARZ foreign key (ID_LEKARZA)
      references LEKARZ (ID_LEKARZA)
go

alter table WIZYTA
   add constraint FK_WIZYTA_RELATIONS_PACJENT foreign key (ID_PACJENTA)
      references PACJENT (ID_PACJENTA)
go

