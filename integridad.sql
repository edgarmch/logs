create trigger pkusuario on Usuarios for insert as
if( (select id_usuario from inserted) in (null))
    begin
        ROLLBACK TRANSACTION
        print "Debe agregar un identificador válido"
    end
declare @usuario int
select @usuario =  id_usuario from inserted
declare @veces int
select @veces = count(*) from Usuarios where Usuarios.id_usuario=@usuario
if(@usuario not like "USU[0-9][0-9]")
	    begin
		print "Identificador incorrecto"
		ROLLBACK TRANSACTION
	end	
if ( @veces > 1)
    begin
        print "El usuario ya existe""
        ROLLBACK TRANSACTION
    end
go


------2do trigger

create trigger pkcursos on Cursos for insert as
if( (select id_curso from inserted) in (null))
    begin
        ROLLBACK TRANSACTION
        print "La clave no puede ser nula"
    end
 
declare @clave varchar(5)
declare @curso
select @clave =  id_curso from inserted
declare @veces int
select @veces = count(*) from Cursos where Cursos.id_curso=@clave
if(@curso not like "CUR[0-9][0-9]")
	    begin
		print "Identificador incorrecto"
		ROLLBACK TRANSACTION
	end
if ( @veces > 1)
    begin
        print "La clave ya existe"
        ROLLBACK TRANSACTION
    end
go
