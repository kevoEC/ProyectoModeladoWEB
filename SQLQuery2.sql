


select * from USUARIO

insert into USUARIO(Nombres,Apellidos,Correo,Clave) values ('test nombre', 'test apellido', 'test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

select * from USUARIO

insert into USUARIO(Nombres,Apellidos,Correo,Clave) values ('test nombre2', 'test apellido2', 'test2@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

select * from CATEGORIA

insert into CATEGORIA(Descripcion) values 
('Laptops'),
('Consolas'),
('Partes para Armados de PC'),
('PC Escritorio completo'),
('Escritorios Gamers'),
('Juegos')

select * from MARCA

insert into MARCA(Descripcion) values 
('AMD'),
('NVIDIA'),
('ACER'),
('HP'),
('ASUS'),
('DELL'),
('MAC'),
('INTEL'),
('SONY'),
('NINTENDO'),
('MICROSOFT'),
('TOSHIBA'),
('GYGABYTE'),
('MSI'),
('KINGSTON')

select * from PROVINCIA

insert into PROVINCIA(IdProvincia,Descripcion) values
('01','Imbabura'),
('02','Pichincha'),
('03','Guayas')

select * from CIUDAD

insert into CIUDAD (IdCiudad,Descripcion,IdProvincia) values
--IMBABURA - CIUDAD
('0101', 'Ibarra','01'),
('0102', 'Otavalo','01'),
('0103', 'Atuntaqui','01'),
('0104', 'Cotacachi','01'),

--PICHINCHA - CIUDAD
('0201', 'Aloag','02'),
('0202', 'Cayambe','02'),
('0203', 'Machachi','02'),
('0204', 'Quito','02'),
('0205', 'Tabacundo','02'),
('0206', 'San Miguel De los Bancos','02'),
('0207', 'Sangolquí','02'),

--GUAYAS - CIUDAD
('0301', 'Balao','03'),
('0302', 'Balzar','03'),
('0303', 'Colimes','03'),
('0304', 'Daule','03'),
('0305', 'Durán','03'),
('0306', 'El Empalme','03'),
('0307', 'El Triunfo','03'),
('0308', 'Guayaquil','03'),
('0309', 'Milagro','03'),
('0310', 'Naranjal','03'),
('0311', 'Naranjito','03'),
('0312', 'Palestina','03'),
('0313', 'Pedro Carbo','03'),
('0314', 'Playas','03'),
('0315', 'Samborondón','03'),
('0316', 'San Jacinto De Yaguachi','03'),
('0317', 'Santa Lucía','03')

select * from PARROQUIA

insert into PARROQUIA(IdParroquia, Descripcion, IdCiudad, IdProvincia) values
--IMBABURA - PARROQUIAS - IBARRA
('010101','El sagrario','0101','01'),
('010102','San Francisco','0101','01'),
('010103','Caranqui','0101','01'),
('010104','Alpachaca','0101','01'),
('010105','Priorato','0101','01'),
('010106','Ambuqui','0101','01'),
('010107','Angochagua','0101','01'),
('010108','Carolina','0101','01'),
('010109','La esperanza','0101','01'),
('010110','Lita','0101','01'),
('010111','Salinas','0101','01'),
('010112','San Antonio','0101','01'),

--IMBABURA - PARROQUIAS - OTAVALO
('010201','Eugenio Espejo','0102','01'),
('010202','San Pablo del Lago','0102','01'),
('010203','González Suárez','0102','01'),
('010204','San Rafael','0102','01'),
('010205','San Juan de Ilumán','0102','01'),
('010206','Dr. Miguel Egas Cabezas','0102','01'),
('010207','San José de Quichinche','0102','01'),
('010208','San Pedro de Pataquí','0102','01'),
('010209','Selva Alegre.','0102','01'),
('010210','Jordán','0102','01'),
('010211','San Luis','0102','01'),

--IMBABURA - PARROQUIAS - ATUNTAQUI
('010301','Atuntaqui','0103','01'),
('010302','San Roque','0103','01'),
('010303','Chaltura','0103','01'),
('010304','Natabuela','0103','01'),
('010305','Imbaya','0103','01'),

--IMBABURA - PARROQUIAS - COTACACHI
('010401','Apuela','0104','01'),
('010402','García Moreno','0104','01'),
('010403','Peñaherrrera','0104','01'),
('010404','6 de Julio de Cuellaje','0104','01'),
('010405','Vacas Galindo','0104','01'),
('010406','Plaza Gutiérrez','0104','01'),

--PICHINCHA - PARROQUIAS - QUITO
('020101','Aloag','0201','02'),
('020201','Cayambe','0202','02'),
('020301','Machachi','0203','01'),
('020401','Quito','0204','02'),
('020501','Tabacundo','0205','02'),
('020601','San Miguel De los Bancos','0206','02'),
('020701','Sangolquí','0207','02'),
--GUAYAS - PARROQUIAS - QUITO
('030101', 'Balao','0301','03'),
('030201', 'Balzar','0302','03'),
('030301', 'Colimes','0303','03'),
('030401', 'Daule','0304','03'),
('030501', 'Durán','0305','03'),
('030601', 'El Empalme','0306','03'),
('030701', 'El Triunfo','0307','03'),
('030801', 'Guayaquil','0308','03'),
('030901', 'Milagro','0309','03'),
('031001', 'Naranjal','0310','03'),
('031101', 'Naranjito','0311','03'),
('031201', 'Palestina','0312','03'),
('031301', 'Pedro Carbo','0313','03'),
('031401', 'Playas','0314','03'),
('031501', 'Samborondón','0315','03'),
('031601', 'San Jacinto De Yaguachi','0316','03'),
('031701', 'Santa Lucía','0317','03')

update USUARIO set Activo = 0 where IdUsuario = 2