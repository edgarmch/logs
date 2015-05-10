/*==============================================================*/
/* DBMS name:      Sybase AS Enterprise 15.5                    */
/* Created on:     08/05/2015 08:42:13 p. m.                    */
/*==============================================================*/


if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('CONTESTAN'))
            where name = 'FK_CONTESTA_CONTESTAN_PREGUNTA' and type = 'RI')
   alter table CONTESTAN
      drop constraint FK_CONTESTA_CONTESTAN_PREGUNTA
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('CONTESTAN'))
            where name = 'FK_CONTESTA_CONTESTAN_USUARIOS' and type = 'RI')
   alter table CONTESTAN
      drop constraint FK_CONTESTA_CONTESTAN_USUARIOS
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('CURSOS'))
            where name = 'FK_CURSOS_EVALUAN_EVALUADO' and type = 'RI')
   alter table CURSOS
      drop constraint FK_CURSOS_EVALUAN_EVALUADO
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('CURSOS'))
            where name = 'FK_CURSOS_PERTENECE_CATEGORI' and type = 'RI')
   alter table CURSOS
      drop constraint FK_CURSOS_PERTENECE_CATEGORI
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('PREGUNTAS'))
            where name = 'FK_PREGUNTA_TIENEN_CURSOS' and type = 'RI')
   alter table PREGUNTAS
      drop constraint FK_PREGUNTA_TIENEN_CURSOS
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('TEMAS'))
            where name = 'FK_TEMAS_PERTENECE_CURSOS' and type = 'RI')
   alter table TEMAS
      drop constraint FK_TEMAS_PERTENECE_CURSOS
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('TOMAN'))
            where name = 'FK_TOMAN_TOMAN_CURSOS' and type = 'RI')
   alter table TOMAN
      drop constraint FK_TOMAN_TOMAN_CURSOS
go

if exists (select 1 
            from  sysobjects c 
            join  sysconstraints s on (s.constrid = c.id and s.tableid = object_id('TOMAN'))
            where name = 'FK_TOMAN_TOMAN2_USUARIOS' and type = 'RI')
   alter table TOMAN
      drop constraint FK_TOMAN_TOMAN2_USUARIOS
go

if exists (select 1
            from  sysobjects
            where id = object_id('CATEGORIAS')
            and   type = 'U')
   drop table CATEGORIAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONTESTAN')
            and   name  = 'CONTESTAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONTESTAN.CONTESTAN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONTESTAN')
            and   name  = 'CONTESTAN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONTESTAN.CONTESTAN2_FK
go

if exists (select 1
            from  sysobjects
            where id = object_id('CONTESTAN')
            and   type = 'U')
   drop table CONTESTAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CURSOS')
            and   name  = 'EVALUAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CURSOS.EVALUAN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CURSOS')
            and   name  = 'PERTENECEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CURSOS.PERTENECEN_FK
go

if exists (select 1
            from  sysobjects
            where id = object_id('CURSOS')
            and   type = 'U')
   drop table CURSOS
go

if exists (select 1
            from  sysobjects
            where id = object_id('EVALUADORES')
            and   type = 'U')
   drop table EVALUADORES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PREGUNTAS')
            and   name  = 'TIENEN_FK'
            and   indid > 0
            and   indid < 255)
   drop index PREGUNTAS.TIENEN_FK
go

if exists (select 1
            from  sysobjects
            where id = object_id('PREGUNTAS')
            and   type = 'U')
   drop table PREGUNTAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TEMAS')
            and   name  = 'PERTENECE_FK'
            and   indid > 0
            and   indid < 255)
   drop index TEMAS.PERTENECE_FK
go

if exists (select 1
            from  sysobjects
            where id = object_id('TEMAS')
            and   type = 'U')
   drop table TEMAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TOMAN')
            and   name  = 'TOMAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index TOMAN.TOMAN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TOMAN')
            and   name  = 'TOMAN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TOMAN.TOMAN2_FK
go

if exists (select 1
            from  sysobjects
            where id = object_id('TOMAN')
            and   type = 'U')
   drop table TOMAN
go

if exists (select 1
            from  sysobjects
            where id = object_id('USUARIOS')
            and   type = 'U')
   drop table USUARIOS
go

/*==============================================================*/
/* Table: CATEGORIAS                                            */
/*==============================================================*/
create table CATEGORIAS (
   ID_CATEGORIA         varchar(5)                     not null,
   NOMBRE_CATEGORIA     varchar(20)                    not null,
   constraint PK_CATEGORIAS primary key nonclustered (ID_CATEGORIA)
)
go

/*==============================================================*/
/* Table: CONTESTAN                                             */
/*==============================================================*/
create table CONTESTAN (
   ID_PREGUNTA          varchar(7)                     not null,
   ID_USUARIO           varchar(6)                     not null,
   RESPUESTA            char(1)                        not null,
   constraint PK_CONTESTAN primary key nonclustered (ID_PREGUNTA, ID_USUARIO)
)
go

/*==============================================================*/
/* Index: CONTESTAN2_FK                                         */
/*==============================================================*/
create index CONTESTAN2_FK on CONTESTAN (
ID_USUARIO ASC
)
go

/*==============================================================*/
/* Index: CONTESTAN_FK                                          */
/*==============================================================*/
create index CONTESTAN_FK on CONTESTAN (
ID_PREGUNTA ASC
)
go

/*==============================================================*/
/* Table: CURSOS                                                */
/*==============================================================*/
create table CURSOS (
   ID_CURSO             varchar(5)                     not null,
   ID_CATEGORIA         varchar(5)                     not null,
   ID_EVALUADOR         varchar(5)                     not null,
   NOMBRE_CURSO         varchar(20)                    not null,
   DESCRIPCION_CURSO    varchar(100)                   null,
   constraint PK_CURSOS primary key nonclustered (ID_CURSO)
)
go

/*==============================================================*/
/* Index: PERTENECEN_FK                                         */
/*==============================================================*/
create index PERTENECEN_FK on CURSOS (
ID_CATEGORIA ASC
)
go

/*==============================================================*/
/* Index: EVALUAN_FK                                            */
/*==============================================================*/
create index EVALUAN_FK on CURSOS (
ID_EVALUADOR ASC
)
go

/*==============================================================*/
/* Table: EVALUADORES                                           */
/*==============================================================*/
create table EVALUADORES (
   ID_EVALUADOR         varchar(5)                     not null,
   NOMBRE_EVALUADOR     varchar(30)                    not null,
   constraint PK_EVALUADORES primary key nonclustered (ID_EVALUADOR)
)
go

/*==============================================================*/
/* Table: PREGUNTAS                                             */
/*==============================================================*/
create table PREGUNTAS (
   ID_PREGUNTA          varchar(7)                     not null,
   ID_CURSO             varchar(5)                     not null,
   PREGUNTAYRESPUESTAS  varchar(300)                   not null,
   CORRECTA             char(1)                        not null,
   constraint PK_PREGUNTAS primary key nonclustered (ID_PREGUNTA)
)
go

/*==============================================================*/
/* Index: TIENEN_FK                                             */
/*==============================================================*/
create index TIENEN_FK on PREGUNTAS (
ID_CURSO ASC
)
go

/*==============================================================*/
/* Table: TEMAS                                                 */
/*==============================================================*/
create table TEMAS (
   ID_CURSO             varchar(5)                     not null,
   ID_TEMA              varchar(7)                     null,
   DESCRIPCION_TEMA     varchar(100)                   null
)
go

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on TEMAS (
ID_CURSO ASC
)
go

/*==============================================================*/
/* Table: TOMAN                                                 */
/*==============================================================*/
create table TOMAN (
   ID_CURSO             varchar(5)                     not null,
   ID_USUARIO           varchar(6)                     not null,
   CALIF                int                            not null,
   constraint PK_TOMAN primary key nonclustered (ID_CURSO, ID_USUARIO)
)
go

/*==============================================================*/
/* Index: TOMAN2_FK                                             */
/*==============================================================*/
create index TOMAN2_FK on TOMAN (
ID_USUARIO ASC
)
go

/*==============================================================*/
/* Index: TOMAN_FK                                              */
/*==============================================================*/
create index TOMAN_FK on TOMAN (
ID_CURSO ASC
)
go

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS (
   ID_USUARIO           varchar(6)                     not null,
   NOMBRE_COMPLETO      varchar(30)                    not null,
   constraint PK_USUARIOS primary key nonclustered (ID_USUARIO)
)
go

alter table CONTESTAN
   add constraint FK_CONTESTA_CONTESTAN_PREGUNTA foreign key (ID_PREGUNTA)
      references PREGUNTAS (ID_PREGUNTA)
go

alter table CONTESTAN
   add constraint FK_CONTESTA_CONTESTAN_USUARIOS foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO)
go

alter table CURSOS
   add constraint FK_CURSOS_EVALUAN_EVALUADO foreign key (ID_EVALUADOR)
      references EVALUADORES (ID_EVALUADOR)
go

alter table CURSOS
   add constraint FK_CURSOS_PERTENECE_CATEGORI foreign key (ID_CATEGORIA)
      references CATEGORIAS (ID_CATEGORIA)
go

alter table PREGUNTAS
   add constraint FK_PREGUNTA_TIENEN_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
go

alter table TEMAS
   add constraint FK_TEMAS_PERTENECE_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
go

alter table TOMAN
   add constraint FK_TOMAN_TOMAN_CURSOS foreign key (ID_CURSO)
      references CURSOS (ID_CURSO)
go

alter table TOMAN
   add constraint FK_TOMAN_TOMAN2_USUARIOS foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO)
go

