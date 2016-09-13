USE Proyecto
go

/*Metodo que borra administrador*/
CREATE PROC borrarAdministrador(
	@idAdministrador NUMERIC(10)
)AS
BEGIN
	DELETE FROM Administrador
	WHERE @idAdministrador = @idAdministrador
END
GO

/*Metodo que borra consultante*/

GO
CREATE PROC borrarConsultante(
	@idConsultante NUMERIC(10)
)AS
BEGIN
DELETE FROM Consultante
WHERE @idConsultante = @idConsultante
END
/*Metodo que borra asociacion de Denuncia con Juez*/
GO
CREATE PROC borrarDenunciaXJuez(
	@idJuez NUMERIC(10)
)AS
BEGIN
DELETE DJ FROM DenunciaXJuez DJ
INNER JOIN Juez J
	ON DJ.idJuez = J.idJuez
WHERE J.idJuez = @idJuez
END


/*Metodo que borra asociacion de Solucion con Juez*/
GO
CREATE PROC borrarSolucionXJuez(
	@idJuez INT
)AS
BEGIN
	DELETE SJ FROM SolucionXJuez SJ
	INNER JOIN Juez J
		ON SJ.idJuez = J.idJuez
	WHERE J.idJuez = @idJuez
END
/*Metodo que borra Juez*/
GO

CREATE PROC borrarJuez(
	@idJuez NUMERIC(10)
)AS
BEGIN
	DELETE FROM Juez
	WHERE idJuez = @idJuez
--Preguntar con respecto al punto 12 en caso de que elimina el juez
END
/*Metodo que borra Solucion*/
GO
CREATE PROC borrarSolucion(
	@idSolucion INT
)AS
BEGIN
DELETE FROM Solucion 
WHERE idSolucion = @idSolucion
END
/*Metodo que borra un Oficial*/
GO

CREATE PROC borrarOficial(
	@idOficial NUMERIC(10)
)AS
BEGIN
	DELETE FROM Oficial
	WHERE idOficial = @idOficial
END
/*Metodo que borra una Denuncia*/
GO
CREATE PROC borrarDenuncia(
	@idDenuncia INT
)AS
BEGIN
	DELETE FROM Denuncia
	WHERE idDenuncia = @idDenuncia
END
/*Metodo que borra un Guardian*/
GO
CREATE PROC borrarGuardian(
	@idGuardian NUMERIC(10)
)AS
BEGIN
	DELETE FROM Guardian
	WHERE idGuardian = @idGuardian
END
/*Metodo que borra Aporte*/
GO
CREATE PROC borrarAporte(
	@idUsuario NUMERIC(10)
)AS
BEGIN
DELETE FROM Aporte
WHERE idUsuario = @idUsuario
END
/*Metodo que borra Usuario*/
GO
CREATE PROC borrarUsuario(
	@idUsuario NUMERIC(10)
)AS
BEGIN
DELETE FROM Usuario
WHERE idUsuario = @idUsuario
END
/*Metodo que borra Direccion*/
GO
CREATE PROC borrarDireccion(
	@idDireccion INT
)AS
BEGIN
DELETE FROM Direccion
WHERE idDireccion = @idDireccion
END
/*Metodo que borra Telefono*/
GO
CREATE PROC borrarTelefono(
	@cedula NUMERIC(10)
)AS
BEGIN
DELETE FROM Telefono
WHERE cedula = @cedula
END
/*Metodo que borra Email*/
GO
CREATE PROC borrarEmail(
	@cedula NUMERIC(10)
)AS
BEGIN
DELETE FROM Email
WHERE cedula = @cedula
END
/*Metodo que borra Persona*/
GO
CREATE PROC borrarPersona(
	@cedula NUMERIC(10)
)AS
BEGIN
DELETE FROM Persona
WHERE cedula = @cedula 
END
