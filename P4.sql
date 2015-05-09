create trigger alumno_cursa_cascada on ALUMNO6 for delete as 
	delete CURSA6 from CURSA6, deleted where CURSA6.no_cta = deleted.no_cuenta
go

create trigger materia_cursa_cascada on MATERIA6 for delete as 
	delete CURSA6 from CURSA6, deleted where CURSA6.claveM = deleted.claveM
go

create trigger pkalumno on ALUMNO6 for insert as
if( (select no_cuenta from inserted) in (null))
    begin
        ROLLBACK TRANSACTION 
        print "El número de cuenta no puede ser nulo"
    end
declare @num_cuenta int 
select @num_cuenta =  no_cuenta from inserted
declare @veces int
select @veces = count(*) from ALUMNO6 where ALUMNO6.no_cuenta=@num_cuenta
if ( @veces > 1)
    begin
        print "El número de cuneta ya existe"
        ROLLBACK TRANSACTION
    end
go

create trigger pkfkcursa on CURSA6 for insert as
declare @nocta int
select @nocta = no_cta from inserted
if( @nocta = null)
    begin
        ROLLBACK TRANSACTION 
        print "No se aceptan valores nulos como FK - cta"
    end
declare @clave varchar(5)
select @clave = claveM from inserted
if( @clave = null)
    begin
        ROLLBACK TRANSACTION 
        print "No se aceptan valores nulos como FK - cla"
    end
declare @veces int
select @veces = count(*) from ALUMNO6 where ALUMNO6.no_cuenta=@nocta
if( @veces = 0)
    begin
        print "No se puede evaluar a un alumno que no existe"
        ROLLBACK TRANSACTION
    end
select @veces = count(*) from MATERIA6 where MATERIA6.claveM=@clave
if( @veces = 0)
    begin
        print "No se puede evaluar una materia que no existe"
        ROLLBACK TRANSACTION
    end

select @veces = count(*) from CURSA6 where CURSA6.no_cta=@nocta AND CURSA6.claveM=@clave
if ( @veces > 1)
    begin
        print "El alumno ya fue evaluado en esa materia"
        ROLLBACK TRANSACTION
    end
go

create trigger pkmateria on MATERIA6 for insert as
if( (select claveM from inserted) in (null))
    begin
        ROLLBACK TRANSACTION 
        print "La clave no puede ser nula"
    end

declare @clave varchar(5)
select @clave =  claveM from inserted
declare @veces int
select @veces = count(*) from MATERIA6 where MATERIA6.claveM=@clave

if ( @veces > 1)
    begin
        print "La clave ya existe"
        ROLLBACK TRANSACTION
    end
go