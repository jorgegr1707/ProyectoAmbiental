USE Proyecto
GO

/*##################################*/
CREATE PROC cambiarEstadoActivo(
	@idUsuario INT
)AS
BEGIN
UPDATE Usuario SET estadoActivo = 1
WHERE idUsuario = @idUsuario
END
GO

/*##################################*/
CREATE PROC cambiarEstadoDesactivo(
	@idUsuario INT
)AS
begin
UPDATE Usuario SET estadoActivo = 0
WHERE idUsuario = @idUsuario
end
GO

/* ############################### */
CREATE PROC cambiarDatosUsuario(
	@idUsuario NUMERIC(10),
	@cedula NUMERIC(10),
	@primerNombre VARCHAR(20),
	@segundoNombre VARCHAR(20),
	@primerApellido VARCHAR(20),
	@segundoApellido VARCHAR(20),
	@fechaNacimiento DATE
)AS
begin
UPDATE P SET P.cedula = @cedula,
				   P.primerNombre = @primerNombre,
				   P.segundoNombre = @segundoNombre,
				   P.primerApellido = @primerApellido,
				   P.segundoApellido = @segundoApellido,
				   P.fechaNacimiento = @fechaNacimiento
FROM Persona P
INNER JOIN Usuario U
	ON U.idUsuario = P.cedula
WHERE U.idUsuario = @idUsuario
end
GO

/*#################################*/
CREATE PROC cambiarDatosDenuncia(
	@idDenuncia INT,
	@categoria CHAR(1),
	@titulo VARCHAR(30),
	@latitud FLOAT(10),
	@longitud FLOAT(10),
	@estado VARCHAR(15),
	@descripcion VARCHAR(15),
	@foto IMAGE
)AS
begin
UPDATE D SET D.categoria = @categoria,
					  D.titulo = @titulo,
					  D.latitud = @latitud,
					  D.longitud = @longitud,
					  D.estado = @estado,
					  D.descripcion = @descripcion,
					  D.foto = @foto
FROM Denuncia D
INNER JOIN Guardian G
	ON G.idGuardian = D.idGuardian
WHERE idDenuncia = @idDenuncia
end
GO
