
-- Aca están los precedimientos almacenados que ya estan probados y NO se deben editar
-- a menos que sea 100% necesario

use proyecto
go
/*##################################################################################*/
create proc insertarProvincia(
	@nombreProvincia nvarchar(50)
)as
begin 
	insert into Provincia(nombreProvincia)
	values(@nombreProvincia)
end 
go
/*##################################################################################*/
create proc insertarCanton(
	@nombreCanton nvarchar(50), 
	@idProvincia int	
)as
begin
	insert into Canton(nombreCanton, idProvincia)
	values(@nombreCanton, @idProvincia)
end
go
/*##################################################################################*/
create proc insertarDistrito(
	@nombreDistrito nvarchar(50),
	@idCanton int
)as
begin
	insert into Distrito(nombreDistrito, idCanton)
	values(@nombreDistrito, @idCanton)
end 
go
/*##################################################################################*/
create proc insertarDireccion(
	@detalle NVARCHAR (500),
	@idDistrito INT
)as
begin
	insert into Direccion(detalle, idDistrito)
	values(@detalle, @idDistrito)
end 
go
/*##################################################################################*/
create proc listadoPersonas 
as
begin
	select * from Persona
end
go
/*##################################################################################*/
create proc buscarDistrito(
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@retorno int output
)as
begin
		declare @idProv int
		SELECT @idProv = P.idProvincia FROM Provincia P where P.nombreProvincia = @provincia 
		
		declare @idCant int
		select @idCant = C.idCanton from Canton C 
		where C.nombreCanton = @canton and C.idProvincia = @idProv
		
		select @retorno =  D.idDistrito 
		from Distrito D where D.nombreDistrito = @distrito and D.idCanton = @idCant
end
go
/*##################################################################################*/
create proc insertarPersona(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	if (exists(select cedula from Persona where cedula = @cedula)) 
		set @mensaje = 'La cedula ya está registrada en el sistema'
	else
		begin
			declare @idDistrito int 
			declare @idDireccion int
			exec buscarDistrito @provincia, @canton, @distrito, @idDistrito output
			exec insertarDireccion @detalle, @idDistrito
			set @idDireccion = @@IDENTITY
			insert into Persona(cedula, primerNombre, segundoNombre, primerApellido, SegundoApellido,
			fechaNacimiento, username, passw, idDireccion, telefono, email)
			values (@cedula, @primerNombre, @segundoNombre, @primerApellido, @SegundoApellido,
			@fechaNacimiento, @username, ENCRYPTBYPASSPHRASE('c@r80n0-n3u7ra1', @passw), @idDireccion, @telefono, @email)
			set @mensaje = 'Registrado correctamente'
		end
end
go
/*##################################################################################*/
create proc insertarGuardian(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	exec insertarPersona @cedula, @primerNombre, @segundoNombre, @primerApellido, @segundoApellido,
		 @fechaNacimiento, @username, @passw, @telefono, @email, @provincia, @canton,
		 @distrito, @detalle, @mensaje out
	if @mensaje <> 'La cedula ya está registrada en el sistema'
		begin
		insert into Usuario(puntos, estadoActivo, idUsuario) values(0, 1, @cedula)
		insert into Guardian(idGuardian) values (@cedula)
		set @mensaje = 'registrado'
		end
	else
		set @mensaje = 'no registrado'
end
go
/*##################################################################################*/
create proc insertarOficial(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	exec insertarPersona @cedula, @primerNombre, @segundoNombre, @primerApellido, @segundoApellido,
		 @fechaNacimiento, @username, @passw, @telefono, @email, @provincia, @canton,
		 @distrito, @detalle, @mensaje out
	if @mensaje <> 'La cedula ya está registrada en el sistema'
		begin
		insert into Usuario(puntos, estadoActivo, idUsuario) values(0, 1, @cedula)
		insert into Oficial(idOficial) values (@cedula)
		set @mensaje = 'registrado'
		end
	else
		set @mensaje = 'no registrado'
end
go
/*##################################################################################*/
create proc insertarJuez(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	exec insertarPersona @cedula, @primerNombre, @segundoNombre, @primerApellido, @segundoApellido,
		 @fechaNacimiento, @username, @passw, @telefono, @email, @provincia, @canton,
		 @distrito, @detalle, @mensaje out
	if @mensaje <> 'La cedula ya está registrada en el sistema'
		begin
		insert into Usuario(puntos, estadoActivo, idUsuario) values(0, 1, @cedula)
		insert into Juez(idJuez) values (@cedula)
		set @mensaje = 'registrado'
		end
	else
		set @mensaje = 'no registrado'
end
go
/*##################################################################################*/
create proc insertarAdministrador(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	exec insertarPersona @cedula, @primerNombre, @segundoNombre, @primerApellido, @segundoApellido,
		 @fechaNacimiento, @username, @passw, @telefono, @email, @provincia, @canton,
		 @distrito, @detalle, @mensaje out
	if @mensaje <> 'La cedula ya está registrada en el sistema'
		begin
		insert into Administrador(cedulaAdministrador) values (@cedula)
		set @mensaje = 'registrado'
		end
	else
		set @mensaje = 'no registrado'
end
go
/*##################################################################################*/
create proc insertarConsultante(
	@cedula NUMERIC(10),
	@primerNombre NVARCHAR(20),
	@segundoNombre NVARCHAR(20),
	@primerApellido NVARCHAR(20),
	@segundoApellido NVARCHAR(20),
	@fechaNacimiento DATE,
	@username NVARCHAR(20),
	@passw NVARCHAR(15),
	@telefono NUMERIC(8),
	@email NVARCHAR(50),
	@provincia nvarchar(50),
	@canton nvarchar(50),
	@distrito nvarchar(50),
	@detalle nvarchar(500),
	@mensaje nvarchar(100) out
)as
begin
	exec insertarPersona @cedula, @primerNombre, @segundoNombre, @primerApellido, @segundoApellido,
		 @fechaNacimiento, @username, @passw, @telefono, @email, @provincia, @canton,
		 @distrito, @detalle, @mensaje out
	if @mensaje <> 'La cedula ya está registrada en el sistema'
		begin
		insert into Consultante(cedulaConsultante) values (@cedula)
		set @mensaje = 'registrado'
		end
	else
		set @mensaje = 'no registrado'
end
go
/*##################################################################################*/
create proc buscarRolAdmin(
	@cedula numeric(10),
	@retorno nvarchar(20) out
)as
begin 
	if(exists(select cedulaAdministrador from Administrador where cedulaAdministrador = @cedula))
		set @retorno = 'administrador'
	else
		begin
		if(exists(select cedulaConsultante from Consultante where cedulaConsultante = @cedula))
			set @retorno = 'consultante'
		else
			begin
				set @retorno = 'Incorrecto'
			end
		end
end
go
/*##################################################################################*/
create proc listadoGuardianes
as
begin
	select * from Persona P
	inner join Guardian G
		on G.idGuardian = P.cedula 
end


/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*
exec insertarAdministrador 4, 'q', 'q', 'q', 'q', '10/10/2010', 'Steven','1', 
88888888,'', 'San José', 'Desamparados', 'San Miguel', '', null
select * from Usuario
*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/
/*##################################################################################*/