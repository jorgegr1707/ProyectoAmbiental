
/* hay que hacer la depuracion */

Use Proyecto
go

/* 100% */
create proc insertarTipoAporte(
	@nombre nvarchar(50)
)as
begin
	insert into TipoAporte(nombre)
	values(@nombre)
end
go

/* 100% */
create proc insertarAporte(
	@fecha datetime,
	@foto image,
	@valor int,
	@idTipoAporte int,
	@idUsuario int 
)as
begin
	insert into Aporte(fecha, foto, valor, idTipoAporte, idUsuario)
	values(@fecha, @foto, @valor, @idTipoAporte, @idUsuario)
end
go


/* 100% */
create proc insertarDenuncia(
	@categoria CHAR(1),
	@titulo NVARCHAR(30),
	@latitud FLOAT(10),
	@longitud FLOAT(10),
	@estado NVARCHAR(15),
	@descripcion NVARCHAR(15),
	@foto IMAGE,
	@idGuardian NUMERIC(10), -- se recive de la interfaz,
	-- Dirección
	@provincia NVaRCHAR(50),
	@canton NVaRCHAR(50),
	@distrito NVaRCHAR(50),
	@detalle VARCHAR(500)
)as
begin
	declare @idDistrito int
	exec buscarDistrito @provincia, @canton, @distrito, @idDistrito output
	exec insertarDireccion @detalle, @idDistrito
	declare @idDireccion int
	exec obtenerUltimoIdentityDireccion @idDireccion output
insert into Denuncia(categoria, titulo, latitud, longitud, estado, descripcion, foto, idGuardian, idDireccion)
values(@categoria, @titulo, @latitud, @longitud, @estado, @descripcion, @foto, @idGuardian,  @idDireccion)
end
go




/* incompleto, estos se llaman en el pro de update */
/* Cuando el juez verifica la denuncia que hizo el guardian, el guardian recibe una notificacion */
/* se le envia al guardian que la hizo tomando el dato del idDenuncia */
/*###########################################################################################*/
create proc insertarNotificacionguardian(
	@fecha DATE,
	@estado BIT,
	@idDenuncia INT
)as
begin
	insert into NotificacionGuardian(fecha, estado, idDenuncia)
	values(@fecha, @estado, @idDenuncia)
end
go

/*#########################################################################################*/
create proc insertarNotificacionGuardianXGuardian(
	@idNotificacionGuardian INT,
	@idGuardian NUMERIC(10)
)as
begin
	insert into NotificacionGuardianXGuardian(idNotificacionGuardian, idGuardian)
	values(@idNotificacionGuardian, @idGuardian)
end
go


/*########################################################################################*/
create proc insertarNotificacionJuez(
	@fecha DATE,
	@estado BIT,
	@idDenuncia INT
)as
begin
	insert into NotificacionJuez(fecha, estado, idDenuncia)
	values(@fecha, @estado, @idDenuncia)
end
go

/*#######################################################################################*/
create proc insertarNotificacionJuezXJuez(
	@idNotificacionJuez INT,
	@idJuez NUMERIC(10)
)as
begin
	insert into NotificacionJuezXJuez(idNotificacionJuez, idJuez)
	values(@idNotificacionJuez, @idJuez)
end
go

/*######################################################################################*/

create proc insertarSolucion(
	@titulo NVARCHAR(20),
	@foto IMAGE,
	@validacion BIT,
	@descripcion NVARCHAR(100),
	@fecha DATETIME,
	@estadoEnvio BIT,
	@idDenuncia INT,
	@idOficial NUMERIC(10)
)as
begin
	insert into Solucion(titulo,foto,validacion,descripcion,fecha,estadoEnvio,idDenuncia,idOficial)
	values(@titulo,@foto,@validacion,@descripcion,@fecha,@estadoEnvio,@idDenuncia,@idOficial)
end
go

/*########################################################################################*/

create proc insertarNotificacionSolucionJuez(
	@fecha DATE,
	@estado BIT,
	@idDenuncia INT
)as
begin
	insert into NotificacionSolucionJuez(fecha,estado,idDenuncia)
	values(@fecha,@estado,@idDenuncia)
end
go

/*#########################################################*/

create proc insertarHashtagDenuncia
(
	@idDenuncia INT,
	@nombreHashtag NVARCHAR(50)
)AS
BEGIN
	INSERT INTO HashtagDenuncia (idDenuncia, hashtag) 
	values(@idDenuncia, @nombreHashtag)
END
GO

/*#####################################################################*/
CREATE PROC insertarHashtagSolucion
(
	@idSolucion INT,
	@nombreHashtag NVARCHAR(50)

)AS
BEGIN
	INSERT INTO HashtagSolucion(idSolucion, hashtag)
	VALUES(@idSolucion, @nombreHashtag)
END
GO

CREATE PROC insertarDenunciaXJuez(
	@idDenuncia INT,
	@idJuez NUMERIC(10) 
)AS
BEGIN
INSERT INTO DenunciaXJuez(idDenuncia, idJuez)
VALUES(@idDenuncia, @idJuez)
END
GO