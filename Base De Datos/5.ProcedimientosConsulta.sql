USE Proyecto
GO
select * from Provincia
/*#########################################################################*/
CREATE PROC consultaProvincia 
AS
BEGIN
	SELECT nombreProvincia FROM Provincia
END
GO
/*#########################################################################*/
CREATE PROC consultaCanton(
	@idProvincia INT
)
AS
BEGIN
	SELECT idCanton, nombreCanton FROM Canton
	WHERE idProvincia = @idProvincia
END
GO
/*#########################################################################*/
CREATE PROC consultaDistrito(
	@idCanton INT
)AS
BEGIN
	SELECT idDistrito, nombreDistrito FROM Distrito
	WHERE idCanton = @idCanton
END
GO
/*#########################################################################*/
CREATE PROC obtenerCantonDenuncia
(
	@idDenuncia INT,
	@idCanton INT OUT
)AS
BEGIN 
	SELECT @idCanton = C.idCanton
	FROM Denuncia D
	INNER JOIN Direccion Dir
		ON Dir.idDireccion = D.idDireccion
	INNER JOIN Distrito Dis
		ON Dis.idDistrito = Dir.idDistrito
	INNER JOIN Canton C
		ON C.idCanton = Dis.idCanton
END
GO
/*#########################################################################*/
create proc juecesXCanton(
	@idCanton int
)as
begin
	select J.idJuez, P.primerNombre
	from Juez J
	inner join Persona P
		on P.cedula = J.idJuez
	inner join Direccion D
		on D.idDireccion = P.idDireccion
	inner join Distrito dis
		on dis.idDistrito = D.idDistrito
	where dis.idCanton = @idCanton
end
go 
/*#########################################################################*/
Create Procedure LoginPersona(
    @user nvarchar(20), 
    @Pass nvarchar(50),
    @Result nvarchar(10) Out
)As
    Declare @PassEncode nvarchar(400)
    Declare @PassDecode nvarchar(50)
Begin
    Select @PassEncode = passw, @Result = cedula From Persona Where username = @user
    Set @PassDecode = DECRYPTBYPASSPHRASE('c@r80n0-n3u7ra1', @PassEncode)
End
Begin
    If @PassDecode <> @Pass
		Set @Result = 'Incorrecto'
End
Go





/* ############################### */
create proc buscarProvinciaJuez(
	@idJuez numeric(10),
	@retorno Numeric(10) output
)as
begin
select @retorno = Prov.idProvincia 
from Juez J
inner join Persona P
	on P.cedula = @idJuez
inner join Direccion Dir
	on Dir.idDireccion = P.idDireccion
inner join Distrito Dis 
	on Dis.idDistrito = Dir.idDistrito
inner join Canton C
	on C.idCanton = Dis.idCanton
inner join Provincia Prov
	on Prov.idProvincia = C.idProvincia
end 
go
/*####################33*/
/* hacer metodo para enviale una denuncia y que me retorne la fecha de la misma*/
/* luego buscar direccion de la denuncia concatenado*/
create proc obtenerDenunciasPorProvincia(
	@idJuez numeric(10)
)as
begin
	declare @idProvinciaDeluez int 
	exec buscarProvinciaJuez @idJuez, @idProvinciaDeluez output
	select *
	from Denuncia D
	inner join Direccion Dir
		on Dir.idDireccion = D.idDireccion
	inner join Distrito Dis
		on Dis.idDistrito = Dir.idDireccion
	inner join Canton C
		on C.idCanton = Dis.idCanton
	inner join Provincia P
		on P.idProvincia = @idProvinciaDeluez
end
go


-- Punto 1
CREATE PROC consultaGeneralUsuarios
AS
BEGIN
SELECT U.idUsuario, P.primerNombre, P.segundoNombre, P.primerApellido, 
P.segundoApellido, P.username, U.puntos, U.estadoActivo
FROM Usuario U
INNER JOIN Persona P
	ON U.idUsuario = P.cedula
ORDER BY P.primerNombre, P.primerApellido ASC
END
GO


--Punto 2
CREATE PROC consultaDistritosGuardianes
AS
BEGIN
	SELECT Dis.nombreDistrito, COUNT(G.idGuardian) Guardianes 
	FROM Distrito Dis
	inner join Direccion Dir
		ON Dir.idDistrito = dis.idDistrito
	inner join Persona P
		ON P.idDireccion = Dir.idDireccion
	inner join Guardian G
		ON G.idGuardian = P.cedula
	GROUP BY dis.nombreDistrito
END
GO
/* ####################################### */
CREATE PROC consultaDistritosficiales
AS
BEGIN
	SELECT Dis.nombreDistrito, COUNT(O.idOficial) Oficiales 
	FROM Distrito Dis
	inner join Direccion Dir
		ON Dir.idDistrito = dis.idDistrito
	inner join Persona P
		ON P.idDireccion = Dir.idDireccion
	inner join Oficial O
		ON O.idOficial = P.cedula
	GROUP BY dis.nombreDistrito
END
GO
/* ####################################### */
CREATE PROC consultaDistritosJueces
AS
BEGIN
	SELECT Dis.nombreDistrito, COUNT(J.idJuez) Oficiales 
	FROM Distrito Dis
	inner join Direccion Dir
		ON Dir.idDistrito = dis.idDistrito
	inner join Persona P
		ON P.idDireccion = Dir.idDireccion
	inner join Juez J
		ON J.idJuez = P.cedula
	GROUP BY dis.nombreDistrito
END
GO

-- Punto 3
CREATE PROC consultaDenunciasFiltroFecha (
	@inicial DATE,
	@limite DATE
)AS 
BEGIN
SELECT D.titulo, D.descripcion, NJ.fecha, P.username, Prov.nombreProvincia, 
Cant.nombreCanton, Dist.nombreDistrito, D.estado FROM Denuncia D
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Guardian G ON G.idGuardian = D.idGuardian
INNER JOIN Persona P ON P.cedula = G.idGuardian
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dist ON Dist.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Dist.idCanton
INNER JOIN Provincia Prov ON Prov.idProvincia = Cant.idProvincia
WHERE NJ.fecha BETWEEN @inicial AND @limite
END
GO
/*###############################################################*/
CREATE PROC consultaDenunciasFiltroProvincia(
	@provincia NVARCHAR(50)
)AS 
BEGIN
SELECT D.titulo, D.descripcion, NJ.fecha, P.username, Prov.nombreProvincia, 
Cant.nombreCanton, Dist.nombreDistrito, D.estado FROM Denuncia D
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Guardian G ON G.idGuardian = D.idGuardian
INNER JOIN Persona P ON P.cedula = G.idGuardian
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dist ON Dist.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Dist.idCanton
INNER JOIN Provincia Prov ON Prov.idProvincia = Cant.idProvincia
WHERE Prov.nombreProvincia = @provincia
END
GO
/*#########################################################################*/
CREATE PROC consultaDenunciasFiltroCanton(
	@canton nvarchar(50)
)AS 
SELECT D.titulo, D.descripcion, NJ.fecha, P.username, Prov.nombreProvincia, 
Cant.nombreCanton, Dist.nombreDistrito, D.estado FROM Denuncia D
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Guardian G ON G.idGuardian = D.idGuardian
INNER JOIN Persona P ON P.cedula = G.idGuardian
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dist ON Dist.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Dist.idCanton
INNER JOIN Provincia Prov ON Prov.idProvincia = Cant.idProvincia
where Cant.nombreCanton = @canton
go
/*###############################################################*/
CREATE PROC consultaDenunciasFiltroDistrito(
	@distrito nvarchar(50)
)AS
SELECT D.titulo, D.descripcion, NJ.fecha, P.username, Prov.nombreProvincia, 
Cant.nombreCanton, Dist.nombreDistrito, D.estado FROM Denuncia D
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Guardian G ON G.idGuardian = D.idGuardian
INNER JOIN Persona P ON P.cedula = G.idGuardian
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dist ON Dist.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Dist.idCanton
INNER JOIN Provincia Prov ON Prov.idProvincia = Cant.idProvincia
where Dist.nombreDistrito = @distrito
GO
/*###############################################################*/
create proc consultaDenunciasFiltroHashtag(
	@hashtag NVARCHAR(50)
)AS
BEGIN
SELECT D.titulo, D.descripcion, NJ.fecha, P.username, Prov.nombreProvincia, 
       C.nombreCanton, Dis.nombreDistrito, D.estado
FROM Denuncia D 
iNNER JOIN NotificacionJuez NJ	ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Persona P ON P.cedula = D.idGuardian
INNER JOIN Direccion Dir on Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dis on Dis.idDistrito = Dir.idDistrito
INNER JOIN Canton C on C.idCanton = Dis.idCanton
INNER JOIN Provincia Prov ON Prov.idProvincia = C.idProvincia
INNER JOIN HashtagDenuncia H on H.idDenuncia = D.idDenuncia
WHERE H.hashtag = @hashtag
END 
GO

--Punto 4--
CREATE PROC consultaDenuncia AS
BEGIN
Select D.estado, COUNT(D.estado) total,
                 COUNT(case D.categoria WHEN 'L' THEN 1 ELSE NULL END) Leve,
                 COUNT(case D.categoria WHEN 'R' THEN 1 ELSE NULL END) Regular, 
				 COUNT(case D.categoria WHEN 'G' THEN 1 ELSE NULL END) Grave 
FROM Denuncia D
GROUP BY D.estado
END 
GO
/* filtro */
CREATE PROC consultaDenunciaFiltroXFechas (
	@inicial DATE,
	@final DATE,
	@idDireccion INT
)AS
BEGIN
Select D.estado, COUNT(D.estado) total,
                 COUNT(case D.categoria WHEN 'L' THEN 1 ELSE NULL END) Leve,
                 COUNT(case D.categoria WHEN 'R' THEN 1 ELSE NULL END) Regular, 
				 COUNT(case D.categoria WHEN 'G' THEN 1 ELSE NULL END) Grave 
FROM Denuncia D
INNER JOIN NotificacionJuez NJ
	ON NJ.idDenuncia = D.idDenuncia
WHERE NJ.fecha BETWEEN @inicial and @final 
	//-- ver D D.idDireccion = ISNULL(@idDireccion,D.idDireccion)
GROUP BY D.estado

END 
GO
/* filtro */
CREATE PROC consultaDenunciaFiltroXProvincia (
	@provincia NVARCHAR(50)
)AS
BEGIN
SELECT D.estado, COUNT(D.estado) total,
                 COUNT(case D.categoria WHEN 'L' THEN 1 ELSE NULL END) Leve,
                 COUNT(case D.categoria WHEN 'R' THEN 1 ELSE NULL END) Regular, 
				 COUNT(case D.categoria WHEN 'G' THEN 1 ELSE NULL END) Grave 
FROM Denuncia D
INNER JOIN Direccion Dir on Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dis on Dis.idDistrito = Dir.idDistrito
INNER JOIN Canton C on C.idCanton = Dis.idCanton
INNER JOIN Provincia P on P.idProvincia = C.idProvincia
WHERE P.nombreProvincia = @provincia GROUP BY D.estado
END 
GO
/* fintro */
CREATE PROC consultaDenunciaFiltroXCanton (
	@canton NVARCHAR(50)
)AS
BEGIN
SELECT D.estado, COUNT(D.estado) total,
                 COUNT(case D.categoria WHEN 'L' THEN 1 ELSE NULL END) Leve,
                 COUNT(case D.categoria WHEN 'R' THEN 1 ELSE NULL END) Regular, 
				 COUNT(case D.categoria WHEN 'G' THEN 1 ELSE NULL END) Grave 
FROM Denuncia D
INNER JOIN Direccion Dir on Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dis on Dis.idDistrito = Dir.idDistrito
INNER JOIN Canton C on C.idCanton = Dis.idCanton
WHERE C.nombreCanton = @canton GROUP BY D.estado
END 
GO
/* Filtro */
CREATE PROC consultaDenunciaFiltroXDistrito (
	@distrito NVARCHAR(50)
)AS
BEGIN
SELECT D.estado, COUNT(D.estado) total,
                 COUNT(case D.categoria WHEN 'L' THEN 1 ELSE NULL END) Leve,
                 COUNT(case D.categoria WHEN 'R' THEN 1 ELSE NULL END) Regular, 
				 COUNT(case D.categoria WHEN 'G' THEN 1 ELSE NULL END) Grave 
FROM Denuncia D
INNER JOIN Direccion Dir on Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dis on Dis.idDistrito = Dir.idDistrito
WHERE Dis.nombreDistrito = @distrito GROUP BY D.estado
END 
GO


--Punto 5
create proc conteoDenunciasRechazadas(
	@cantidad int
)AS
BEGIN
SELECT P.username usuario, COUNT(case D.estado when 'Rechazada' then 1 else null end) Rechazadas
FROM Denuncia D
INNER JOIN Persona P ON P.cedula = D.idGuardian GROUP BY P.username
HAVING COUNT(case D.estado when 'Rechazada' then 1 else null end) >= @cantidad
END
GO
/* Filtro */
create proc conteoDenunciasRechazadasFiltroXFecha(
	@cantidad int,
	@fecha DATE
)AS
BEGIN
SELECT P.username usuario, COUNT(case D.estado when 'Rechazada' then 1 else null end) Rechazadas
FROM Denuncia D
INNER JOIN Persona P ON P.cedula = D.idGuardian 
INNER JOIN NotificacionJuez NJ
	on NJ.idDenuncia = D.idDenuncia
GROUP BY P.username, NJ.fecha
HAVING COUNT(case D.estado when 'Rechazada' then 1 else null end) >= @cantidad and NJ.fecha = @fecha 
END
GO



-- Punto 6
CREATE PROC consultaAportePorMes(
	@fechaInicial DATE,
	@fechaFinal DATE
)AS
BEGIN
	SELECT TA.nombre, COUNT(TA.nombre) Total, YEAR(a.fecha) Año, 
					  MONTH(a.fecha) Mes, DAY(a.fecha) Día
	FROM Aporte A 
	INNER JOIN TipoAporte TA
		on TA.idTipoAporte = A.idTipoAporte
	WHERE A.fecha BETWEEN @fechaInicial and @fechaFinal
	GROUP BY TA.nombre, A.fecha
	ORDER BY A.fecha
END 
GO


--Punto 7


--Punto 8


--Punto 9
CREATE PROC consultaTopDenuncias(
	@cantidad INT,
	@top INT
)AS
BEGIN
SELECT TOP(@top) P.username, 
	   COUNT(case D.estado  when 'En Proceso' then 1 else null end) Aceptadas,
	   COUNT(case D.estado  when 'Rechazada' then 1 else null end) Rechazadas  
FROM Guardian G
INNER JOIN Persona P
	ON P.cedula	= G.idGuardian
INNER JOIN Denuncia D
	ON D.idGuardian = G.idGuardian
GROUP BY P.username
HAVING COUNT(case D.estado  when 'En Proceso' then 1 else null end) +
	   COUNT(case D.estado  when 'Rechazada' then 1 else null end) >= @cantidad
END
GO


--Punto 10
CREATE PROC consultaTopSolucion(
	@cantidad INT
)AS
BEGIN
	SELECT TOP(@cantidad) P.username, 
					COUNT(case S.validacion  when 1 then 1 else null end) Aceptadas,
				    COUNT(case S.validacion  when 0 then 1 else null end) Rechazadas,
					COUNT(S.idSolucion) Total
	FROM Oficial O
	INNER JOIN Persona P ON P.cedula = O.idOficial
	INNER JOIN Solucion S ON S.idOficial = O.idOficial
	WHERE S.validacion IS NOT NULL 
	GROUP BY P.username
	ORDER BY Total desc
END
GO

--Punto 11
CREATE PROC consultaTopJuezXDenunciaEvaluadas(
	@cantidad INT
)AS
BEGIN
	SELECT TOP(@cantidad) P.username, 
					COUNT(case S.estado  when 'En Proceso' then 1 else null end) Aceptadas,
				    COUNT(case S.estado  when 'Rechazada' then 1 else null end) Rechazadas,
					COUNT(S.estado) Total
	FROM Juez O
	INNER JOIN Persona P ON P.cedula = O.idJuez
	INNER JOIN DenunciaXJuez DJ ON DJ.idJuez = O.idJuez
	INNER JOIN Denuncia S  ON S.idDenuncia = DJ.idDenuncia
	GROUP BY P.username
	ORDER BY Total desc
END
GO


--Punto 12
CREATE PROC consultaDenunciasConSolucion 
AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ
	ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S
	ON S.idDenuncia = D.idDenuncia
END
GO

/* Filtros */
CREATE PROC consultaDenunciasConSolucionFiltroPorFecha(
	@fecha DATE
)AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ
	ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S
	ON S.idDenuncia = D.idDenuncia
WHERE S.fecha = @fecha
END
GO

/* Filtros */
CREATE PROC consultaDenunciasConSolucionFiltroPorProvincia(
	@provincia NVARCHAR(50)
)AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S ON S.idDenuncia = D.idDenuncia
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Distrit ON Distrit.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Distrit.idCanton
INNER JOIN Provincia P ON P.idProvincia = Cant.idProvincia
WHERE P.nombreProvincia = @provincia
END
GO


/* Filtros */
CREATE PROC consultaDenunciasConSolucionFiltroPorCanton(
	@canton NVARCHAR(50)
)AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S ON S.idDenuncia = D.idDenuncia
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Distrit ON Distrit.idDistrito = Dir.idDistrito
INNER JOIN Canton Cant ON Cant.idCanton = Distrit.idCanton
WHERE Cant.nombreCanton = @canton
END
GO


/* Filtros */
CREATE PROC consultaDenunciasConSolucionFiltroPorDistrito(
	@distrito NVARCHAR(50)
)AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S ON S.idDenuncia = D.idDenuncia
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Distrit ON Distrit.idDistrito = Dir.idDistrito
WHERE Distrit.nombreDistrito = @distrito
END
GO

/*filtro*/
CREATE PROC consultaDenunciasConSolucionFiltroPorHashtag(
	@hashtag NVARCHAR(50)
)AS
BEGIN
SELECT D.titulo, D.descripcion, PersonaG.username usuarioGuardian, NJ.fecha, 
       PersonaJ.username usuarioJuez, S.descripcion, S.fecha, S.validacion
FROM Denuncia D
INNER JOIN (SELECT P.username, G.idGuardian FROM Guardian G
			INNER JOIN Persona P ON P.cedula = G.idGuardian
			)PersonaG
	ON PersonaG.idGuardian = D.idGuardian
INNER JOIN DenunciaXJuez DJ
	ON DJ.idDenuncia = D.idDenuncia
INNER JOIN(SELECT P.username, J.idJuez FROM Juez J
		   INNER JOIN Persona P ON P.cedula = J.idJuez
		  )PersonaJ
	ON PersonaJ.idJuez = DJ.idJuez
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Solucion S ON S.idDenuncia = D.idDenuncia
INNER JOIN HashtagSolucion HS ON HS.idSolucion = S.idSolucion
WHERE HS.hashtag = @hashtag
END
GO

--Punto 13
CREATE PROC MostrarInformacionDenuncia(
	@idDenuncia INT
)AS
IF NOT EXISTS (select * from Solucion S where S.idDenuncia = @idDenuncia)
	BEGIN
	SELECT D.* FROM Denuncia D
	WHERE D.idDenuncia = @idDenuncia
	END
ELSE BEGIN
	SELECT D.*,S.* FROM Denuncia D
	INNER JOIN Solucion S
		ON S.idDenuncia = D.idDenuncia
	WHERE D.idDenuncia = @idDenuncia
END
GO


--Punto 14
CREATE PROC consultarBitacora(
	@fechaInicial DATE,
	@fechaFinal DATE
)AS
BEGIN
/*SELECT de los aportes*/
SELECT A.fecha,'Aporte' Tipo, P.primerNombre, TA.nombre 
FROM Aporte A
INNER JOIN TipoAporte TA ON TA.idTipoAporte = A.idTipoAporte
INNER JOIN Persona P ON P.cedula = A.idUsuario
WHERE A.fecha BETWEEN @fechaInicial AND @fechaFinal
UNION
/*SELECT de las Denuncias*/
SELECT NJ.fecha,'Denuncia' Tipo, P.primerNombre, D.descripcion
FROM Denuncia D
INNER JOIN NotificacionJuez NJ ON NJ.idDenuncia = D.idDenuncia
INNER JOIN Persona P ON P.cedula = D.idGuardian
WHERE NJ.fecha BETWEEN @fechaInicial AND @fechaFinal
UNION
/*SELECT de las Soluciones*/
SELECT S.fecha, 'Solucion' Tipo, P.primerNombre, S.descripcion
FROM Solucion S
INNER JOIN Persona P ON P.cedula = S.idOficial
WHERE S.fecha BETWEEN @fechaInicial AND @fechaFinal
END
GO 


--Punto 15
CREATE PROC consultaDenunciasXML AS
SELECT D.latitud lat, 
	   D.longitud lng, 
	   D.titulo name,
	   P.nombreProvincia +
	   ', ' + C.nombreCanton +
	   ', ' + Dis.nombreDistrito + 
	   ', ' + Dir.detalle address
FROM Denuncia D
INNER JOIN Direccion Dir ON Dir.idDireccion = D.idDireccion
INNER JOIN Distrito Dis ON Dis.idDistrito = Dir.idDistrito
INNER JOIN Canton C ON C.idCanton = Dis.idCanton
INNER JOIN Provincia P ON P.idProvincia = C.idProvincia
FOR XML PATH('marker'), ROOT('markers')
