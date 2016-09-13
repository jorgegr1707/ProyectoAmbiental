use Proyecto
go

select * from Distrito
/* Inserta Provincias */
exec insertarProvincia 'San José'--
exec insertarProvincia 'Alajuela'--
exec insertarProvincia 'Cartago'--
exec insertarProvincia 'Heredia'--
exec insertarProvincia 'Guanacaste'--
exec insertarProvincia 'Puntarenas'--
exec insertarProvincia 'Limón'--

/* Inserta Cantones San Jose*/
exec insertarCanton 'San José', 1--
exec insertarCanton 'Escazú', 1--
exec insertarCanton 'Desamparados', 1-- 
exec InsertarCanton 'Puriscal', 1--
exec InsertarCanton 'Tarrazú', 1-- 
exec InsertarCanton 'Aserrí', 1--
exec InsertarCanton 'Mora', 1--
exec InsertarCanton 'Goicoechea', 1--
exec InsertarCanton 'Santa Ana', 1--
exec InsertarCanton 'Alajuelita', 1-- 
exec InsertarCanton 'Vásquez de Coronado', 1--
exec InsertarCanton 'Acosta', 1-- 
exec InsertarCanton 'Tibás', 1--
exec InsertarCanton 'Moravia', 1-- 
exec InsertarCanton 'Montes de Oca', 1--
exec InsertarCanton 'Turrubares', 1-- 
exec InsertarCanton 'Dota', 1--
exec InsertarCanton 'Curridabat', 1--
exec InsertarCanton 'Pérez Zeledón', 1--
exec InsertarCanton 'León Cortés', 1--

/* Inserta Cantones Alajuela*/
exec InsertarCanton 'Alajuela', 2--
exec InsertarCanton 'San Ramon', 2--
exec InsertarCanton 'Grecia', 2--
exec InsertarCanton 'San Mateo', 2--
exec InsertarCanton 'Atenas', 2--
exec InsertarCanton 'Naranjo', 2--
exec InsertarCanton 'Palmares ', 2--
exec InsertarCanton 'Poás', 2--
exec InsertarCanton 'Orotina', 2--
exec InsertarCanton 'San Carlos', 2--
exec InsertarCanton 'Zarcero', 2--
exec InsertarCanton 'Valverde Vega', 2--
exec InsertarCanton 'Upala', 2--
exec InsertarCanton 'Los Chiles', 2--
exec InsertarCanton 'Guatuso', 2--

/*Inserta Cantones Cartago*/
exec InsertarCanton 'Cartago', 3--
exec InsertarCanton 'Paraíso', 3--
exec InsertarCanton 'La Unión',3--
exec InsertarCanton 'Jiménez',3--
exec InsertarCanton 'Turrialba',3--
exec InsertarCanton 'Alvarado',3--
exec InsertarCanton 'Oreamuno',3--
exec InsertarCanton 'El Guarco',3--

/* Incerta Cantones Heredia*/
exec InsertarCanton 'Heredia', 4--
exec InsertarCanton 'Barva', 4--
exec InsertarCanton 'Santo Domingo', 4--
exec InsertarCanton 'Santa Bárbara', 4--
exec InsertarCanton 'San Rafael', 4--
exec InsertarCanton 'San Isidro', 4--
exec InsertarCanton 'Belén', 4--
exec InsertarCanton 'Flores', 4--
exec InsertarCanton 'San Pablo', 4--
exec InsertarCanton 'Sarapiquí', 4--

/* Incerta Cantones Guanacaste*/
exec InsertarCanton 'Liberia', 5--
exec InsertarCanton 'Nicoya', 5--
exec InsertarCanton 'Santa Cruz', 5--
exec InsertarCanton 'Bagaces', 5--
exec InsertarCanton 'Carrillo', 5--
exec InsertarCanton 'Cañas', 5--
exec InsertarCanton 'Abangares', 5--
exec InsertarCanton 'Tilaran', 5--
exec InsertarCanton 'Nandayure', 5--
exec InsertarCanton 'La Cruz', 5--
exec InsertarCanton 'Hojancha', 5--

/* Incerta Cantones Puntarenas*/
exec InsertarCanton 'Puntarenas', 6--
exec InsertarCanton 'Esparza', 6--
exec InsertarCanton 'Buenos Aires', 6--
exec InsertarCanton 'Montes de Oro', 6--
exec InsertarCanton 'Osa', 6--
exec InsertarCanton 'Quepos', 6--
exec InsertarCanton 'Golfito', 6--
exec InsertarCanton 'Coto Brus', 6--
exec InsertarCanton 'Parrita', 6--
exec InsertarCanton 'Corredores', 6--
exec InsertarCanton 'Garabito', 6--

/* Incerta Cantones Limon*/
exec InsertarCanton 'Limón', 7--
exec InsertarCanton 'Pococí', 7--
exec InsertarCanton 'Siquirres', 7--
exec InsertarCanton 'Talamanca', 7--
exec InsertarCanton 'Matina', 7--
exec InsertarCanton 'Guácimo', 7--

/*Inserta distritos de San Jose*/
exec insertarDistrito 'Carmen', 1--
exec insertarDistrito 'Merced',1--
exec insertarDistrito 'Hospital',1--
exec insertarDistrito 'Catedral',1--
exec insertarDistrito 'Zapote',1--
exec insertarDistrito 'San Francisco de Dos Ríos',1--
exec insertarDistrito 'Uruca',1--
exec insertarDistrito 'Mata Redonda',1--
exec insertarDistrito 'Pavas',1--
exec insertarDistrito 'Hatillo',1--
exec insertarDistrito 'San Sebastian',1--

/*Inserta distritos de Escazu*/
exec insertarDistrito 'Escazú', 2--
exec insertarDistrito 'San Antonio',2--
exec insertarDistrito 'San Rafael',2--

/*Inserta distritos de Desamparados*/
exec insertarDistrito 'Desamparados', 3--
exec insertarDistrito 'San Miguel', 3--
exec insertarDistrito 'San Juan de Dios',3--
exec insertarDistrito 'San Rafael Arriba',3--
exec insertarDistrito 'San Antonio', 3--
exec insertarDistrito 'Frailes', 3--
exec insertarDistrito 'Patarrá',3--
exec insertarDistrito 'San Cristobal', 3--
exec insertarDistrito 'Rosario',3--
exec insertarDistrito 'Damas',3--
exec insertarDistrito 'San Rafael Abajo',3--
exec insertarDistrito 'Gravilias', 3--
exec insertarDistrito 'Los Guido', 3--

/*Inserta distritos de Puriscal*/
exec insertarDistrito 'Santiago', 4--
exec insertarDistrito 'Mercedes Sur', 4--
exec insertarDistrito 'Barbacoas', 4--
exec insertarDistrito 'Grifo Alto', 4--
exec insertarDistrito 'San Rafael', 4--
exec insertarDistrito 'Candelarita', 4--
exec insertarDistrito 'Desamparaditos', 4--
exec insertarDistrito 'San Antonio', 4--
exec insertarDistrito 'Chires', 4--

/*Inserta distritos de Tarrazu*/
exec insertarDistrito 'San Marcos', 5--
exec insertarDistrito 'San Lorenzo', 5--
exec insertarDistrito 'San Carlos', 5--

/*Inserta distritos de Aserri*/
exec insertarDistrito 'Aserrí', 6--
exec insertarDistrito 'Tarbaca', 6--
exec insertarDistrito 'Vuelta de Jorco', 6--
exec insertarDistrito 'San Gabriel', 6--
exec insertarDistrito 'Legua', 6--
exec insertarDistrito 'Monterrey',6--
exec insertarDistrito 'Salitrillos',6--

/*Inserta distritos de Mora*/
exec insertarDistrito 'Colón',7--
exec insertarDistrito 'Guayabo', 7--
exec insertarDistrito 'Tabarcia', 7--
exec insertarDistrito 'Piedras Negras', 7--
exec insertarDistrito 'Picagres',7--
exec insertarDistrito 'Jaris',7--
exec insertarDistrito 'Quitirrisí', 7--

/*Inserta distritos de Goicoechea*/
exec insertarDistrito 'Guadalupe', 8--
exec insertarDistrito 'San Francisco',8--
exec insertarDistrito 'Calle Blancos', 8--
exec insertarDistrito 'Mata de Plátano', 8--
exec insertarDistrito 'Ipís', 8--
exec insertarDistrito 'Rancho Redondo', 8--
exec insertarDistrito 'Purral',8--

/*Inserta distritos de Santa Ana*/
exec insertarDistrito 'Santa Ana', 9--
exec insertarDistrito 'Salitral', 9--
exec insertarDistrito 'Pozos', 9--
exec insertarDistrito 'Uruca', 9--
exec insertarDistrito 'Piedades', 9--
exec insertarDistrito 'Brasil', 9--

/*Inserta distritos de Alajuelita*/
exec insertarDistrito 'Alajuelita', 10--
exec insertarDistrito 'San Josecito', 10--
exec insertarDistrito 'San Antonio', 10--
exec insertarDistrito 'Concepción', 10--
exec insertarDistrito 'San Felipe', 10--

/*Inserta distritos de Vazquez de Coronado*/
exec insertarDistrito 'San Isidro', 11--
exec insertarDistrito 'San Rafael', 11--
exec insertarDistrito 'Dulce Nombre de Jesús',11--
exec insertarDistrito 'Patalillo',11--
exec insertarDistrito 'Cascajal',11--

/*Inserta distritos de Acosta*/
exec insertarDistrito 'San Ignacio', 12--
exec insertarDistrito 'Guaitil', 12--
exec insertarDistrito 'Palmichal', 12--
exec insertarDistrito 'Cangrejal', 12--
exec insertarDistrito 'Sabanillas', 12--

/*Inserta distritos de Tibas*/
exec insertarDistrito 'San Juan', 13--
exec insertarDistrito 'Cinco Esquinas', 13--
exec insertarDistrito 'Anselmo Llorente', 13--
exec insertarDistrito 'León XIII', 13--
exec insertarDistrito 'Colima', 13--

/*Inserta distritos de Moravia*/
exec insertarDistrito 'San Vicente', 14--
exec insertarDistrito 'San Jerónimo', 14--
exec insertarDistrito 'La Trinidad', 14--

/*Inserta distritos de Montes de Oca*/
exec insertarDistrito 'San Pedro', 15--
exec insertarDistrito 'Sabanilla', 15--
exec insertarDistrito 'Mercedes', 15--
exec insertarDistrito 'San Rafael', 15--

/*Inserta distritos de Turrubares*/
exec insertarDistrito 'San Pablo', 16--
exec insertarDistrito 'San Pedro', 16--
exec insertarDistrito 'San Juan de Mata', 16--
exec insertarDistrito 'San Luis', 16--
exec insertarDistrito 'Carara', 16--

/*Inserta distritos de Dota*/
exec insertarDistrito 'Santa María', 17--
exec insertarDistrito 'El Jardín', 17--
exec insertarDistrito 'Copey', 17--

/*Inserta distritos de Curridabat*/
exec insertarDistrito 'Curridabat', 18--
exec insertarDistrito 'Granadilla', 18--
exec insertarDistrito 'Sánchez', 18--
exec insertarDistrito 'Tirrases', 18--

/*Inserta distritos de Perez Zeledon*/
exec insertarDistrito 'San Isidro de El General', 19--
exec insertarDistrito 'El General', 19--
exec insertarDistrito 'Daniel Flores',19--
exec insertarDistrito 'Rivas', 19--
exec insertarDistrito 'San Pedro', 19--
exec insertarDistrito 'Platanares', 19--
exec insertarDistrito 'Pejibaye', 19--
exec insertarDistrito 'Cajón', 19--
exec insertarDistrito 'Barú', 19--
exec insertarDistrito 'Río Nuevo', 19--
exec insertarDistrito 'Páramo', 19--
exec insertarDistrito 'La Amistad', 19--

/*Inserta distritos de Leon Cortes*/
exec insertarDistrito 'San Pablo', 20--
exec insertarDistrito 'San Andrés', 20--
exec insertarDistrito 'Llano Bonito', 20--
exec insertarDistrito 'San Isidro', 20--
exec insertarDistrito 'Santa Cruz', 20--
exec insertarDistrito 'San Antonio', 20--

/*Insertar distritos de Alajuela*/
exec insertarDistrito 'Alajuela', 21--
exec insertarDistrito 'San José', 21--
exec insertarDistrito 'Carrizal', 21--
exec insertarDistrito 'San Antonio', 21--
exec insertarDistrito 'Guácima',21--
exec insertarDistrito 'San Isidro', 21--
exec insertarDistrito 'Sabanilla', 21--
exec insertarDistrito 'San Rafael', 21--
exec insertarDistrito 'Río Segundo', 21--
exec insertarDistrito 'Desamparados', 21--
exec insertarDistrito 'Turrúcares', 21--
exec insertarDistrito 'Tambor', 21--
exec insertarDistrito 'Garita', 21--
exec insertarDistrito 'Sarapiquí', 21--

/*Insertar distritos de San Ramon*/
exec insertarDistrito 'San Ramón', 22--
exec insertarDistrito 'Santiago', 22--
exec insertarDistrito 'San Juan', 22--
exec insertarDistrito 'Piedades Norte', 22--
exec insertarDistrito 'Piedades Sur', 22--
exec insertarDistrito 'San Rafael', 22--
exec insertarDistrito 'San Isidro', 22--
exec insertarDistrito 'Ángeles', 22--
exec insertarDistrito 'Alfaro', 22--
exec insertarDistrito 'Volio', 22--
exec insertarDistrito 'Concepción',22--
exec insertarDistrito 'Zapotal', 22--
exec insertarDistrito 'Peñas Blancas',22--

/*Insertar distritos de Grecia*/
exec insertarDistrito 'Grecia', 23--
exec insertarDistrito 'San Isidro', 23--
exec insertarDistrito 'San José',23--
exec insertarDistrito 'San Roque',23--
exec insertarDistrito 'Tacares',23--
exec insertarDistrito 'Río Cuarto', 23--
exec insertarDistrito 'Puente de Piedra', 23--
exec insertarDistrito 'Bolívar',23--

/*Insertar distritos de San Mateo*/
exec insertarDistrito 'San Mateo', 24--
exec insertarDistrito 'Desmonte', 24--
exec insertarDistrito 'Jesús María', 24--
exec insertarDistrito 'Labrador', 24--

/*Insertar distritos de Atenas*/
exec insertarDistrito 'Atenas', 25--
exec insertarDistrito 'Jesús', 25--
exec insertarDistrito 'Mercedes', 25--
exec insertarDistrito 'San Isidro', 25--
exec insertarDistrito 'Concepción', 25--
exec insertarDistrito 'San José', 25--
exec insertarDistrito 'Santa Eulalia', 25--
exec insertarDistrito 'Escobal',25--

/*Insertar distritos de Naranjo*/
exec insertarDistrito 'Naranjo', 26--
exec insertarDistrito 'San Miguel', 26--
exec insertarDistrito 'San José', 26--
exec insertarDistrito 'Cirrí Sur', 26--
exec insertarDistrito 'San Jerónimo', 26--
exec insertarDistrito 'San Juan', 26--
exec insertarDistrito 'El Rosario', 26--
exec insertarDistrito 'Palmitos', 26--

/*Insertar distritos de Palmares*/
exec insertarDistrito 'Palmares', 27--
exec insertarDistrito 'Zaragoza', 27--
exec insertarDistrito 'Buenos Aires', 27--
exec insertarDistrito 'Santiago', 27--
exec insertarDistrito 'Candelaria', 27--
exec insertarDistrito 'Esquipulas', 27--
exec insertarDistrito 'La Granja', 27--

/*Insertar distritos de Poas*/
exec insertarDistrito 'San Pedro', 28--
exec insertarDistrito 'San Juan', 28--
exec insertarDistrito 'San Rafael', 28--
exec insertarDistrito 'Carrillos', 28--
exec insertarDistrito 'Sabana Redonda', 28--

/*Insertar distritos de Orotina*/
exec insertarDistrito 'Orotina', 29--
exec insertarDistrito 'El Mastate', 29--
exec insertarDistrito 'Hacienda Vieja', 29--
exec insertarDistrito 'Coyolar', 29--
exec insertarDistrito 'La Ceiba', 29--

/*Insertar distrito de San Carlos*/
exec insertarDistrito 'Quesada', 30--
exec insertarDistrito 'Florencia', 30--
exec insertarDistrito 'Buenavista', 30--
exec insertarDistrito 'Aguas Zarcas', 30--
exec insertarDistrito 'Venecia', 30--
exec insertarDistrito 'Pital', 30--
exec insertarDistrito 'La Fortuna', 30--
exec insertarDistrito 'La Tigra', 30--
exec insertarDistrito 'La Palmera', 30--
exec insertarDistrito 'Venado', 30--
exec insertarDistrito 'Cutris', 30--
exec insertarDistrito 'Monterrey', 30--
exec insertarDistrito 'Pocosol', 30--

/*Insertar distrito de Zarcero*/
exec insertarDistrito 'Zarcero', 31--
exec insertarDistrito 'Laguna', 31--
exec insertarDistrito 'Tapesco',31--
exec insertarDistrito 'Guadalupe',31--
exec insertarDistrito 'Palmira', 31--
exec insertarDistrito 'Zapote', 31--
exec insertarDistrito 'Brisas', 31--

/*Insertar distrito de Valverde Vega*/
exec insertarDistrito 'Sarchí Norte', 32--
exec insertarDistrito 'Sarchí Sur', 32--
exec insertarDistrito 'Toro Amarillo', 32--
exec insertarDistrito 'San Pedro', 32--
exec insertarDistrito 'Rodríguez', 32--

/*Insertar distrito de Upala*/
exec insertarDistrito 'Upala', 33--
exec insertarDistrito 'Aguas Claras', 33--
exec insertarDistrito 'San José', 33--
exec insertarDistrito 'Bijagua', 33--
exec insertarDistrito 'Delicias', 33--
exec insertarDistrito 'Dos Ríos', 33--
exec insertarDistrito 'Yolillal', 33--
exec insertarDistrito 'Canalete', 33--

/*Insertar distrito de Los Chiles*/
exec insertarDistrito 'Los Chiles', 34--
exec insertarDistrito 'Caño Negro', 34--
exec insertarDistrito 'El Amparo', 34--
exec insertarDistrito 'San Jorge', 34--

/*Insertar distrito de Guatuso*/
exec insertarDistrito 'San Rafael', 35--
exec insertarDistrito 'Buenavista', 35--
exec insertarDistrito 'Cote', 35--
exec insertarDistrito 'Katira', 35--

/*Insertar distrito de Cartago*/
exec insertarDistrito 'Oriental', 36--
exec insertarDistrito 'Occidental', 36--
exec insertarDistrito 'Carmen', 36--
exec insertarDistrito 'San Nicolás', 36--
exec insertarDistrito 'Agua Caliente', 36--
exec insertarDistrito 'Guadalupe', 36--
exec insertarDistrito 'Corralillo', 36--
exec insertarDistrito 'Tierra Blanca', 36--
exec insertarDistrito 'Dulce Nombre', 36--
exec insertarDistrito 'Llano Grande', 36--
exec insertarDistrito 'Quebradilla', 36--

/*Insertar distrito de Paraíso*/
exec insertarDistrito 'Paraíso', 37--
exec insertarDistrito 'Santiago', 37--
exec insertarDistrito 'Orosi', 37--
exec insertarDistrito 'Cachí', 37--
exec insertarDistrito 'Llanos de Santa Lucía', 37--

/*Insertar distritos de La Union*/
exec insertarDistrito 'Tres Ríos', 38--
exec insertarDistrito 'San Diego', 38--
exec insertarDistrito 'San Juan', 38--
exec insertarDistrito 'San Rafael', 38--
exec insertarDistrito 'Concepción', 38--
exec insertarDistrito 'Dulce Nombre', 38--
exec insertarDistrito 'San Ramón', 38--
exec insertarDistrito 'Río Azul', 38--

/*Insertar distritos de Jimenez*/
exec insertarDistrito 'Juan Viñas', 39--
exec insertarDistrito 'Tucurrique', 39--
exec insertarDistrito 'Pejibaye', 39--

/*Insertar distritos de Turrialba*/
exec insertarDistrito 'Turrialba', 40--
exec insertarDistrito 'La Suiza', 40--
exec insertarDistrito 'Peralta', 40--
exec insertarDistrito 'Santa Cruz', 40--
exec insertarDistrito 'Santa Teresita', 40--
exec insertarDistrito 'Pavones', 40--
exec insertarDistrito 'Tuis', 40--
exec insertarDistrito 'Tayutic', 40--
exec insertarDistrito 'Santa Rosa', 40--
exec insertarDistrito 'Tres Equis', 40--
exec insertarDistrito 'La Isabel', 40--
exec insertarDistrito 'Chirripó', 40--

/*Insertar distritos de Alvarado*/
exec insertarDistrito 'Pacayas', 41--
exec insertarDistrito 'Cervantes', 41--
exec insertarDistrito 'Capellades', 41--

/*Insertar distritos de Oreamuno*/
exec insertarDistrito 'San Rafael', 42--
exec insertarDistrito 'Cot', 42--
exec insertarDistrito 'Potrero Cerrado', 42--
exec insertarDistrito 'Cipreses', 42--
exec insertarDistrito 'Santa Rosa', 42--

/*Insertar distritos de El Guarco*/
exec insertarDistrito 'El Tejar', 43--
exec insertarDistrito 'San Isidro', 43--
exec insertarDistrito 'Tobosi', 43--
exec insertarDistrito 'Patio de Agua', 43--

/*Insertar distritos de Heredia*/
exec insertarDistrito 'Heredia', 44--
exec insertarDistrito 'Mercedes', 44--
exec insertarDistrito 'San Francisco', 44--
exec insertarDistrito 'Ulloa', 44--
exec insertarDistrito 'Varablanca', 44--

/*Insertar distritos de Barva*/
exec insertarDistrito 'Barva', 45--
exec insertarDistrito 'San Pedro', 45--
exec insertarDistrito 'San Pablo', 45--
exec insertarDistrito 'San Roque', 45--
exec insertarDistrito 'Santa Lucía', 45--
exec insertarDistrito 'San José de la Montaña', 45--

/*Insertar distritos de Santo Domingo*/
exec insertarDistrito 'Santo Domingo', 46--
exec insertarDistrito 'San Vicente', 46--
exec insertarDistrito 'San Miguel', 46--
exec insertarDistrito 'Paracito', 46--
exec insertarDistrito 'Santo Tomás', 46--
exec insertarDistrito 'Santo Rosa', 46--
exec insertarDistrito 'Tures', 46--
exec insertarDistrito 'Pará', 46--

/*Insertar distritos de Santa Barbara*/
exec insertarDistrito 'Santa Bárbara', 47--
exec insertarDistrito 'San Pedro', 47--
exec insertarDistrito 'San Juan', 47--
exec insertarDistrito 'Jesús', 47--
exec insertarDistrito 'Santo Domingo', 47--
exec insertarDistrito 'Purabá', 47--

/*Insertar distritos de San Rafael*/
exec insertarDistrito 'San Rafael', 48--
exec insertarDistrito 'San Josesito', 48--
exec insertarDistrito 'Santiago', 48--
exec insertarDistrito 'Ángeles', 48--
exec insertarDistrito 'Concepción', 48--

/*Insertar distritos de San Isidro*/
exec insertarDistrito 'San Isidro', 49--
exec insertarDistrito 'San José', 49--
exec insertarDistrito 'Concepción', 49--
exec insertarDistrito 'San Francisco', 49--

/*Insertar distritos de Belen*/
exec insertarDistrito 'San Antonio', 50--
exec insertarDistrito 'La Ribera', 50--
exec insertarDistrito 'La Asunción', 50--

/*Insertar distritos de Flores*/
exec insertarDistrito 'San Joaquín', 51--
exec insertarDistrito 'Barrantes', 51--
exec insertarDistrito 'Llorente', 51--

/*Insertar distritos de San Pablo*/
exec insertarDistrito 'San Pablo', 52--
exec insertarDistrito 'Rincón de Sabanilla', 52--

/*Insertar distritos de Sarapiqui*/
exec insertarDistrito 'Puerto Viejo', 53--
exec insertarDistrito 'La Virgen', 53--
exec insertarDistrito 'Las Horquetas', 53--
exec insertarDistrito 'Llanuras de Gaspar', 53--
exec insertarDistrito 'Cureña', 53--

/*Insertar distritos de Liberia*/
exec insertarDistrito 'Liberia', 54--
exec insertarDistrito 'Cañas Dulces', 54--
exec insertarDistrito 'Mayorga', 54--
exec insertarDistrito 'Nacascolo', 54--
exec insertarDistrito 'Curubandé',54--

/*Insertar distritos de Nicoya*/
exec insertarDistrito 'Nicoya', 55--
exec insertarDistrito 'Mansión', 55--
exec insertarDistrito 'San Antonio', 55--
exec insertarDistrito 'Quebrada Honda', 55--
exec insertarDistrito 'Sámara', 55--
exec insertarDistrito 'Nosara', 55--
exec insertarDistrito 'Belén de Nosarita', 55--

/*Insertar distritos de Santa Cruz*/
exec insertarDistrito 'Santa Cruz', 56--
exec insertarDistrito 'Bolsón', 56--
exec insertarDistrito 'Veintisiete de Abril', 56--
exec insertarDistrito 'Tempate', 56--
exec insertarDistrito 'Cartagena', 56--
exec insertarDistrito 'Cuajiniquil', 56--
exec insertarDistrito 'Diriá', 56--
exec insertarDistrito 'Cabo Velas', 56--
exec insertarDistrito 'Tamarindo', 56--

/*Insertar distritos de Bagaces*/
exec insertarDistrito 'Bagaces', 57--
exec insertarDistrito 'La Fortuna', 57--
exec insertarDistrito 'Mogote', 57--
exec insertarDistrito 'Río Naranjo', 57--

/*Insertar distritos de Carrillo*/
exec insertarDistrito 'Filadelfia', 58--
exec insertarDistrito 'Palmira', 58--
exec insertarDistrito 'Sardinal', 58--
exec insertarDistrito 'Belén', 58--

/*Insertar distritos de Cañas*/
exec insertarDistrito 'Cañas', 59--
exec insertarDistrito 'Palmira', 59--
exec insertarDistrito 'San Miguel', 59--
exec insertarDistrito 'Bebedero', 59--
exec insertarDistrito 'Porozal', 59--

/*Insertar distritos de Abangares*/
exec insertarDistrito 'Las Juntas', 60--
exec insertarDistrito 'Sierra', 60--
exec insertarDistrito 'San Juan', 60--
exec insertarDistrito 'Colorado', 60--

/*Insertar distritos de Tilaran*/
exec insertarDistrito 'Tilarán', 61--
exec insertarDistrito 'Quebrada Grande', 61--
exec insertarDistrito 'Tronadora', 61--
exec insertarDistrito 'Santa Rosa', 61--
exec insertarDistrito 'Líbano', 61--
exec insertarDistrito 'Tierras Morenas', 61--
exec insertarDistrito 'Arenal', 61--

/*Insertar distritos de Nandayure*/
exec insertarDistrito 'Carmona', 62--
exec insertarDistrito 'Santa Rita', 62--
exec insertarDistrito 'Zapotal', 62--
exec insertarDistrito 'San Pablo', 62--
exec insertarDistrito 'Porvenir', 62--
exec insertarDistrito 'Bejuco', 62--

/*Insertar distritos de La Cruz*/
exec insertarDistrito 'La Cruz', 63--
exec insertarDistrito 'Santa Cecilia', 63--
exec insertarDistrito 'La Garita', 63--
exec insertarDistrito 'Santa Elena', 63--

/*Insertar distritos de Hojancha*/
exec insertarDistrito 'Hojancha', 64--
exec insertarDistrito 'Monte Romo', 64--
exec insertarDistrito 'Puerto Carrillo', 64--
exec insertarDistrito 'Huacas', 64--

/*Insertar distritos de Puntarenas*/
exec insertarDistrito 'Puntarenas', 65--
exec insertarDistrito 'Pitahaya', 65--
exec insertarDistrito 'Chomes', 65--
exec insertarDistrito 'Lepanto', 65--
exec insertarDistrito 'Paquera', 65--
exec insertarDistrito 'Manzanillo', 65--
exec insertarDistrito 'Guacimal', 65--
exec insertarDistrito 'Barranca', 65--
exec insertarDistrito 'Montverde', 65--
exec insertarDistrito 'Isla del Coco', 65--
exec insertarDistrito 'Cóbano', 65--
exec insertarDistrito 'Chacarita', 65--
exec insertarDistrito 'Chira', 65--
exec insertarDistrito 'Acapulco', 65--
exec insertarDistrito 'El Roble', 65--
exec insertarDistrito 'Arancibia', 65--

/*Insertar distritos de Esparza*/
exec insertarDistrito 'Espíritu Santo', 66--
exec insertarDistrito 'San Juan Grande', 66--
exec insertarDistrito 'Macacona', 66--
exec insertarDistrito 'San Rafael', 66--
exec insertarDistrito 'San Jerónimo', 66--
exec insertarDistrito 'Caldera', 66--

/*Insertar distritos de Buenos Aires*/
exec insertarDistrito 'Buenos Aires', 67--
exec insertarDistrito 'Volcán', 67--
exec insertarDistrito 'Potrero Grande', 67--
exec insertarDistrito 'Boruca', 67--
exec insertarDistrito 'Pilas', 67--
exec insertarDistrito 'Colinas', 67--
exec insertarDistrito 'Chánguena', 67--
exec insertarDistrito 'Biolley', 67--
exec insertarDistrito 'Brunka', 67--

/*Insertar distritos de Montes de Oro*/
exec insertarDistrito 'Miramar', 68--
exec insertarDistrito 'La Unión', 68--
exec insertarDistrito 'San Isidro', 68--

/*Insertar distritos de Osa*/
exec insertarDistrito 'Puerto Cortés', 69--
exec insertarDistrito 'Palmar', 69--
exec insertarDistrito 'Sierpe', 69--
exec insertarDistrito 'Bahía Ballena', 69--
exec insertarDistrito 'Piedras Blancas', 69--
exec insertarDistrito 'Bahía Drake', 69--

/*Insertar distritos de Quepos*/
exec insertarDistrito 'Quepos', 70--
exec insertarDistrito 'Savegre', 70--
exec insertarDistrito 'Naranjito', 70--

/*Insertar distritos de Golfito*/
exec insertarDistrito 'Golfito', 71--
exec insertarDistrito 'Puerto Jiménez', 71--
exec insertarDistrito 'Guaycará', 71--
exec insertarDistrito 'Pavón', 71--

/*Insertar distritos de Coto Brus*/
exec insertarDistrito 'San Vito', 72--
exec insertarDistrito 'Sabalito', 72--
exec insertarDistrito 'Agua Buena', 72--
exec insertarDistrito 'Limoncito', 72--
exec insertarDistrito 'Pittier', 72--
exec insertarDistrito 'Gutiérrez Brown', 72--

/*Insertar distritos de Parrita*/
exec insertarDistrito 'Parrita', 73--

/*Insertar distritos de Corredores*/
exec insertarDistrito 'Corredor', 74--
exec insertarDistrito 'La Cuesta', 74--
exec insertarDistrito 'Canoas', 74--
exec insertarDistrito 'Laurel', 74--

/*Insertar distritos de Garabito*/
exec insertarDistrito 'Jacó', 75--
exec insertarDistrito 'Tárcoles', 75--

/*Insertar distritos de Limón*/
exec insertarDistrito 'Limón', 76--
exec insertarDistrito 'Valle La Estrella', 76--
exec insertarDistrito 'Río Blanco', 76--
exec insertarDistrito 'Matama', 76--

/*Insertar distritos de Pococí*/
exec insertarDistrito 'Guápiles', 77--
exec insertarDistrito 'Jiménez', 77--
exec insertarDistrito 'Rita', 77--
exec insertarDistrito 'Roxana', 77--
exec insertarDistrito 'Cariari', 77--
exec insertarDistrito 'Colorado', 77--
exec insertarDistrito 'La Colonia', 77--

/*Insertar distritos de Siquirres*/
exec insertarDistrito 'Siquirres', 78--
exec insertarDistrito 'Pacuarito', 78--
exec insertarDistrito 'Florida', 78--
exec insertarDistrito 'Germania', 78--
exec insertarDistrito 'El Cairo', 78--
exec insertarDistrito 'Alegría', 78--

/*Insertar distritos de Talamanca*/
exec insertarDistrito 'Bratsi', 79--
exec insertarDistrito 'Sixaola', 79--
exec insertarDistrito 'Cahuita', 79--
exec insertarDistrito 'Telire', 79--

/*Insertar distritos de Matina*/
exec insertarDistrito 'Matina', 80--
exec insertarDistrito 'Batán', 80--
exec insertarDistrito 'Carrandí', 80--

/*Insertar distritos de Guacimo*/
exec insertarDistrito 'Guácimo', 81--
exec insertarDistrito 'Mercedes', 81--
exec insertarDistrito 'Pocora', 81--
exec insertarDistrito 'Río Jiménez', 81--
exec insertarDistrito 'Duacarí', 81--
