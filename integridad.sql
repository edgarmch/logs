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
if ( @veces > 1)
    begin
        print "El usuario ya existe""
        ROLLBACK TRANSACTION
    end
go
