
CREATE DATABASE Proyecto
USE Proyecto
go

CREATE TABLE Provincia(
	idProvincia INT PRIMARY KEY IDENTITY (1,1),
	nombreProvincia NVARCHAR(50) NOT NULL
);

CREATE TABLE Canton(
	idCanton INT PRIMARY KEY IDENTITY (1,1),
	nombreCanton NVARCHAR (50) NOT NULL,
	idProvincia INT FOREIGN KEY REFERENCES Provincia(idProvincia)
);

CREATE TABLE Distrito(
	idDistrito INT PRIMARY KEY IDENTITY (1,1),
	nombreDistrito NVARCHAR(50) NOT NULL,
	idCanton INT FOREIGN KEY REFERENCES Canton(idCanton) 
);

CREATE TABLE Direccion(
	idDireccion INT PRIMARY KEY IDENTITY (1,1),
	detalle NVARCHAR (500),
	idDistrito INT FOREIGN KEY REFERENCES Distrito(idDistrito)
);

CREATE TABLE Persona(
	cedula NUMERIC(10) PRIMARY KEY NOT NULL,
	primerNombre NVARCHAR(20) NOT NULL,
	segundoNombre NVARCHAR(20),
	primerApellido NVARCHAR(20) NOT NULL,
	segundoApellido NVARCHAR(20),
	fechaNacimiento DATE NOT NULL,
	username NVARCHAR(20) UNIQUE NOT NULL,
	passw NVARCHAR(400) NOT NULL,
	idDireccion INT FOREIGN KEY REFERENCES Direccion(idDireccion) NOT NULL,
	telefono NUMERIC(8) NOT NULL,
	email NVARCHAR(50) NOT NULL
);

CREATE TABLE Consultante(
	cedulaConsultante NUMERIC(10) NOT NULL
	CONSTRAINT Pk_cedulaConsultante PRIMARY KEY (cedulaConsultante)
	CONSTRAINT fK_cedulaConsultante FOREIGN KEY (cedulaConsultante) REFERENCES Persona(cedula)
);

CREATE TABLE Administrador(
	cedulaAdministrador NUMERIC(10) NOT NULL
	CONSTRAINT Pk_cedulaAdministrador PRIMARY KEY (cedulaAdministrador)
	CONSTRAINT Fk_cedulaAdministrador FOREIGN KEY (cedulaAdministrador) REFERENCES Persona(cedula)
);

CREATE TABLE Usuario(
	idUsuario NUMERIC(10) NOT NULL,
	puntos INT DEFAULT 0,
	estadoActivo BIT
	CONSTRAINT Pk_cedulaUsuario PRIMARY KEY (idUsuario)
	CONSTRAINT Fk_cedulaUsuario FOREIGN KEY (idUsuario) REFERENCES Persona(cedula)
);

CREATE TABLE Guardian(
	idGuardian NUMERIC(10) NOT NULL
	CONSTRAINT Pk_idGuardian PRIMARY KEY (idGuardian)
	CONSTRAINT Fk_idGuardian FOREIGN KEY (idGuardian) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Oficial(
	idOficial NUMERIC(10) NOT NULL
	CONSTRAINT Pk_idOficial PRIMARY KEY (idOficial)
	CONSTRAINT Fk_idOficial FOREIGN KEY (idOficial) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Juez(
	idJuez NUMERIC(10) NOT NULL
	CONSTRAINT Pk_idJuez PRIMARY KEY (idJuez)
	CONSTRAINT Fk_idJuez FOREIGN KEY (idJuez) REFERENCES Usuario(idUsuario)
);

CREATE TABLE TipoAporte(
	idTipoAporte INT PRIMARY KEY IDENTITY (1,1),
	nombre NVARCHAR(50)
);

CREATE TABLE Aporte(
	idAporte INT PRIMARY KEY IDENTITY (1,1),
	fecha DATE,
	foto IMAGE,
	valor INT,
	idTipoAporte INT FOREIGN KEY REFERENCES TipoAporte(idTipoAporte),
	idUsuario NUMERIC(10) FOREIGN KEY REFERENCES Usuario(idUsuario)
);

CREATE TABLE Denuncia(
	idDenuncia INT PRIMARY KEY IDENTITY (1,1),
	categoria CHAR(1) CHECK (categoria = 'L' OR categoria = 'R' OR categoria = 'G'),
	titulo NVARCHAR(30),
	latitud FLOAT(10),
	longitud FLOAT(10),
	estado NVARCHAR(15),
	descripcion VARCHAR(500),
	foto IMAGE,
	idGuardian NUMERIC(10) FOREIGN KEY REFERENCES Guardian(idGuardian),
	idDireccion INT FOREIGN KEY REFERENCES Direccion(idDireccion)
);

CREATE TABLE HashtagDenuncia(
	idDenuncia INT FOREIGN KEY REFERENCES Denuncia(idDenuncia),
	hashtag NVARCHAR(50)
);

CREATE TABLE NotificacionJuez(
	idNotificacionJuez INT PRIMARY KEY IDENTITY (1,1),
	fecha DATE,
	estado BIT,
	idDenuncia INT FOREIGN KEY REFERENCES Denuncia(idDenuncia)
);

CREATE TABLE NotificacionJuezXJuez(
	idNotificacionJuez INT NOT NULL,
	idJuez NUMERIC(10) NOT NULL
);

ALTER TABLE NotificacionJuezXJuez
ADD PRIMARY KEY (idNotificacionJuez, idJuez)

ALTER TABLE NotificacionJuezXJuez
ADD CONSTRAINT Fk_NotificacionJuezXJuez_NotificacionJuez
FOREIGN KEY(idNotificacionJuez)
REFERENCES NotificacionJuez(idNotificacionJuez);

ALTER TABLE NotificacionJuezXJuez
ADD CONSTRAINT Fk_NotificacionJuezXJuez_Juez
FOREIGN KEY (idJuez)
REFERENCES Juez(idJuez);

CREATE TABLE DenunciaXJuez(
	idDenuncia INT NOT NULL,
	idJuez NUMERIC(10) NOT NULL
);

ALTER TABLE DenunciaXJuez
ADD PRIMARY KEY (idDenuncia, idJuez)

ALTER TABLE DenunciaXJuez
ADD CONSTRAINT Fk_DenunciaXJuez_Denuncia
FOREIGN KEY(idDenuncia)
REFERENCES Denuncia(idDenuncia);

ALTER TABLE DenunciaXJuez
ADD CONSTRAINT Fk_DenunciaXJuez_Juez
FOREIGN KEY(idJuez)
REFERENCES Juez(idJuez);


CREATE TABLE NotificacionGuardian(
	idNotificacionGuardian INT PRIMARY KEY IDENTITY (1,1),
	fecha DATE,
	estado BIT,
	idDenuncia INT FOREIGN KEY REFERENCES Denuncia(idDenuncia)
);

CREATE TABLE NotificacionGuardianXGuardian(
	idNotificacionGuardian INT NOT NULL,
	idGuardian NUMERIC(10) NOT NULL
);
ALTER TABLE NotificacionGuardianXGuardian
ADD PRIMARY KEY(idNotificacionGuardian, idGuardian)

ALTER TABLE NotificacionGuardianXGuardian
ADD CONSTRAINT Fk_NotificacionGuardianXGuardian_NotificacionGuardian
FOREIGN KEY (idNotificacionGuardian)
REFERENCES NotificacionGuardian(idNotificacionGuardian);

ALTER TABLE NotificacionGuardianXGuardian
ADD CONSTRAINT Fk_NotificacionGuardianXGuardian_Guardian
FOREIGN KEY(idGuardian)
REFERENCES Guardian(idGuardian);


CREATE TABLE Solucion(
	idSolucion INT PRIMARY KEY IDENTITY (1,1),
	titulo NVARCHAR(20),
	foto IMAGE,
	validacion BIT,
	descripcion NVARCHAR(500),
	fecha DATE,
	estadoEnvio BIT,
	idDenuncia INT FOREIGN KEY REFERENCES Denuncia(idDenuncia),
	idOficial NUMERIC(10) FOREIGN KEY REFERENCES Oficial(idOficial)
);

CREATE TABLE HashtagSolucion(
	idSolucion INT FOREIGN KEY REFERENCES Solucion(idSolucion),
	hashtag NVARCHAR(50)
);
CREATE TABLE NotificacionSolucionJuez(
	idNotificacionSolucionJuez INT PRIMARY KEY IDENTITY (1,1),
	fecha DATE,
	estado BIT,
	idDenuncia INT FOREIGN KEY REFERENCES Denuncia(idDenuncia)
);

CREATE TABLE SolucionXJuez(
	idSolucion INT NOT NULL,
	idJuez NUMERIC(10) NOT NULL
);

ALTER TABLE SolucionXJuez
ADD PRIMARY KEY(idSolucion, idJuez)

ALTER TABLE SolucionXJuez
ADD CONSTRAINT Fk_SolucionXJuez_Solucion
FOREIGN KEY(idSolucion)
REFERENCES Solucion(idSolucion);

ALTER TABLE SolucionXJuez
ADD CONSTRAINT Fk_SolucionXJuez_Juez
FOREIGN KEY(idJuez)
REFERENCES Juez(idJuez);

/*API Google maps javascript*/
