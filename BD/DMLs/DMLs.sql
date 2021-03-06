﻿/* DMLs
	Table Genero
	Table Departamento
	Table Municipio
	Table Persona
	Table Laboratorio
	Table Prueba
	Table ListaPruebas
	Table CronologiaContagios
	Table Usuarios
Table Patologia
Table NoPatologia
Table EstadoPaciente
Table Encuesta
Table Cronologia
Table TipoSintoma
Table Sintoma
Table listaSintomas
Table Tratamiento
Table LugarAsistencia
Table AsistenciaMedica
Table AntecedentesNP
Table AntecedentesP
Table ListaAntecedentesP
Table ListaAntecedentesNP
*/






-- Table Genero
insert into genero (idGenero, descripcion) values
(1, 'Masculino'),
(2, 'Femenino');


-- Table Departamentos
insert into departamento (idDepartamento, descripcion) values
(1, 'Atlántida'),
(2, 'Colón'),
(3, 'Comayagua'),
(4, 'Copán'),
(5, 'Cortés'),
(6, 'Choluteca'),
(7, 'El Paraíso'),
(8, 'Francisco Morazán'),
(9, 'Gracias a Dios'),
(10, 'Intibucá'),
(11, 'Islas de la Bahía'),
(12, 'La Paz'),
(13, 'Lempira'),
(14, 'Ocotepeque'),
(15, 'Olancho'),
(16, 'Santa Bárbara'),
(17, 'Valle'),
(18, 'Yoro');



-- Table Municipio
insert into municipio (idMunicipio, descripcion, Departamento_idDepartamento) values
(1, 'La Ceiba', 1),
(2, 'Tela', 1),
(3, 'Jutiapa', 1),
(4, 'La Masica', 1),
(5, 'San Francisco', 1),
(6, 'Arizona', 1),
(7, 'Esparta', 1),
(8, 'El Porvenir', 1),
(9, 'Trujillo', 2),
(10, 'Balfate', 2),
(11, 'Iriona', 2),
(12, 'Limón', 2),
(13, 'Sabá', 2),
(14, 'Santa Fe', 2),
(15, 'Santa Rosa de Aguán', 2),
(16, 'Sonaguera', 2),
(17, 'Tocoa', 2),
(18, 'Bonito Oriental', 2),

(19, 'Comayagua', 3),
(20, 'Ajuterique', 3),
(21, 'El Rosario', 3),
(22, 'Esquías', 3),
(23, 'Humuya', 3),
(24, 'La libertad', 3),
(25, 'Lamaní', 3),
(26, 'La Trinidad', 3),
(27, 'Lejamani', 3),
(28, 'Meambar', 3),
(29, 'Minas de Oro', 3),
(30, 'Ojos de Agua', 3),
(31, 'San Jerónimo (Honduras)', 3),
(32, 'San José de Comayagua', 3),
(33, 'San José del Potrero', 3),
(34, 'San Luis', 3),
(35, 'San Sebastián', 3),
(36, 'Siguatepeque', 3),
(37, 'Villa de San Antonio', 3),
(38, 'Las Lajas', 3),
(39, 'Taulabé', 3),

(40, 'Santa Rosa de Copán', 4),
(41, 'Cabañas', 4),
(42, 'Concepción', 4),
(43, 'Copán Ruinas', 4),
(44, 'Corquín', 4),
(45, 'Cucuyagua', 4),
(46, 'Dolores', 4),
(47, 'Dulce Nombre', 4),
(48, 'El Paraíso', 4),
(49, 'Florida', 4),
(50, 'La Jigua', 4),
(51, 'La Unión', 4),
(52, 'Nueva Arcadia', 4),
(53, 'San Agustín', 4),
(54, 'San Antonio', 4),
(55, 'San Jerónimo', 4),
(56, 'San José', 4),
(57, 'San Juan de Opoa', 4),
(58, 'San Nicolás', 4),
(59, 'San Pedro', 4),
(60, 'Santa Rita', 4),
(61, 'Trinidad de Copán', 4),
(62, 'Veracruz', 4),

(63, 'San Pedro Sula', 5),
(64, 'Choloma', 5),
(65, 'Omoa', 5),
(66, 'Pimienta', 5),
(67, 'Potrerillos', 5),
(68, 'Puerto Cortés', 5),
(69, 'San Antonio de Cortés', 5),

(70, 'San Francisco de Yojoa', 5),
(71, 'San Manuel', 5),
(72, 'Santa Cruz de Yojoa', 5),
(73, 'Villanueva', 5),
(74, 'La Lima', 5),

(75, 'Choluteca', 6),
(76, 'Apacilagua', 6),
(77, 'Concepción de María', 6),
(78, 'Duyure', 6),
(79, 'El Corpus', 6),
(80, 'El Triunfo', 6),
(81, 'Marcovia', 6),
(82, 'Morolica', 6),
(83, 'Namasigue', 6),
(84, 'Orocuina', 6),
(85, 'Pespire', 6),
(86, 'San Antonio de Flores', 6),
(87, 'San Isidro', 6),
(88, 'San José', 6),
(89, 'San Marcos de Colón', 6),
(90, 'Santa Ana de Yusguare', 6),

(91, 'Yuscarán', 7),
(92, 'Alauca', 7),
(93, 'Danlí', 7),
(94, 'El Paraíso', 7),
(95, 'Güinope', 7),
(96, 'Jacaleapa', 7),
(97, 'Liure', 7),
(98, 'Morocelí', 7),
(99, 'Oropolí', 7),
(100, 'Potrerillos', 7),
(101, 'San Antonio de Flores', 7),
(102, 'San Lucas', 7),
(103, 'San Matías', 7),
(104, 'Soledad', 7),
(105, 'Teupasenti', 7),
(106, 'Texiguat', 7),
(107, 'Vado Ancho', 7),
(108, 'Yauyupe', 7),
(109, 'Trojes', 7),

(110, 'San Juan de Flores', 8),
(111, 'San Miguelito', 8),
(112, 'Santa Ana', 8),
(113, 'Santa Lucía', 8),
(114, 'Talanga', 8),
(115, 'Tatumbla', 8),
(116, 'Valle de Ángeles', 8),
(117, 'Villa de San Francisco', 8),
(118, 'Vallecillo', 8),

(119, 'Puerto Lempira', 9),
(120, 'Brus Laguna', 9),
(121, 'Ahuas', 9),
(122, 'Juan Francisco Bulnes', 9),
(123, 'Ramón Villeda Morales', 9),
(124, 'Wampusirpe', 9),

(125, 'La Esperanza', 10),
(126, 'Camasca', 10),
(127, 'Colomoncagua', 10),
(128, 'Concepción', 10),
(129, 'Dolores', 10),
(130, 'Intibucá', 10),
(131, 'Jesús de Otoro', 10),
(132, 'Magdalena', 10),
(133, 'Masaguara', 10),
(134, 'San Antonio', 10),
(135, 'San Isidro', 10),
(136, 'San Juan', 10),
(137, 'San Marcos de la Sierra', 10),
(138, 'San Miguel Guancapla', 10),
(139, 'Santa Lucía', 10),
(140, 'Yamaranguila', 10),
(141, 'San Francisco de Opalaca', 10),

(142, 'Roatán', 11),
(143, 'Guanaja', 11),
(144, 'José Santos Guardiola', 11),
(145, 'Utila', 11),

(146, 'La Paz', 12),
(147, 'Aguanqueterique', 12),
(148, 'Cabañas', 12),
(149, 'Cane', 12),
(150, 'Chinacla', 12),
(151, 'Guajiquiro', 12),
(152, 'Lauterique', 12),
(153, 'Marcala', 12),
(154, 'Mercedes de Oriente', 12),
(155, 'Opatoro', 12),
(156, 'San Antonio del Norte', 12),
(157, 'San José', 12),
(158, 'San Juan', 12),
(159, 'San Pedro de Tutule', 12),
(160, 'Santa Ana', 12),
(161, 'Santa Elena', 12),
(162, 'Santa María', 12),
(163, 'Santiago de Puringla', 12),
(164, 'Yarula', 12),

(165, 'Gracias', 13),
(166, 'Belén', 13),
(167, 'Candelaria', 13),
(168, 'Cololaca', 13),
(169, 'Erandique', 13),
(170, 'Gualcince', 13),
(171, 'Guarita', 13),
(172, 'La Campa', 13),
(173, 'La Iguala', 13),
(174, 'Las Flores', 13),
(175, 'La Unión', 13),
(176, 'La Virtud', 13),
(177, 'Lepaera', 13),
(178, 'Mapulaca', 13),
(179, 'Piraera', 13),
(180, 'San Andrés', 13),
(181, 'San Francisco', 13),
(182, 'San Juan Guarita', 13),
(183, 'San Manuel Colohete', 13),
(184, 'San Rafael', 13),
(185, 'San Sebastián', 13),
(186, 'Santa Cruz', 13),
(187, 'Talgua', 13),
(188, 'Tambla', 13),
(189, 'Tomalá', 13),
(190, 'Valladolid', 13),
(191, 'Virginia', 13),
(192, 'San Marcos de Caiquín', 13),

(193, 'Ocotepeque', 14),
(194, 'Belén Gualcho', 14),
(195, 'Concepción', 14),
(196, 'Dolores Merendón', 14),
(197, 'Fraternidad', 14),
(198, 'La Encarnación', 14),
(199, 'La Labor', 14),
(200, 'Lucerna', 14),
(201, 'Mercedes', 14),
(202, 'San Fernando', 14),
(203, 'San Francisco del Valle', 14),
(204, 'San Jorge', 14),
(205, 'San Marcos', 14),
(206, 'Santa Fe', 14),
(207, 'Sensenti', 14),
(208, 'Sinuapa', 14),

(209, 'Juticalpa', 15),
(210, 'Campamento', 15),
(211, 'Catacamas', 15),
(212, 'Concordia', 15),
(213, 'Dulce Nombre de Culmí', 15),
(214, 'El Rosario', 15),
(215, 'Esquipulas del Norte', 15),
(216, 'Gualaco', 15),
(217, 'Guarizama', 15),
(218, 'Guata', 15),
(219, 'Guayape', 15),
(220, 'Jano', 15),
(221, 'La Unión', 15),
(222, 'Mangulile', 15),
(223, 'Manto', 15),
(224, 'Salamá', 15),
(225, 'San Esteban', 15),
(226, 'San Francisco de Becerra', 15),
(227, 'San Francisco de la Paz', 15),
(228, 'Santa María del Real', 15),
(229, 'Silca', 15),
(230, 'Yocón', 15),
(231, 'Patuca', 15),

(232, 'Santa Bárbara', 16),
(233, 'Arada', 16),
(234, 'Atima', 16),
(235, 'Azacualpa', 16),
(236, 'Ceguaca', 16),
(237, 'Concepción del Norte', 16),
(238, 'Concepción del Sur', 16),
(239, 'Chinda', 16),
(240, 'El Níspero', 16),
(241, 'Gualala', 16),
(242, 'Ilama', 16),
(243, 'Las Vegas', 16),
(244, 'Macuelizo', 16),
(245, 'Naranjito', 16),
(246, 'Nuevo Celilac', 16),
(247, 'Nueva Frontera', 16),
(248, 'Petoa', 16),
(249, 'Protección', 16),
(250, 'Quimistán', 16),
(251, 'San Francisco de Ojuera', 16),
(252, 'San José de las Colinas', 16),
(253, 'San Luis', 16),
(254, 'San Marcos', 16),
(255, 'San Nicolás', 16),
(256, 'San Pedro Zacapa', 16),
(257, 'San Vicente Centenario', 16),
(258, 'Santa Rita', 16),
(259, 'Trinidad', 16),

(260, 'Nacaome', 17),
(261, 'Alianza', 17),
(262, 'Amapala', 17),
(263, 'Aramecina', 17),
(264, 'Caridad', 17),
(265, 'Goascorán', 17),
(266, 'Langue', 17),
(267, 'San Francisco de Coray', 17),
(268, 'San Lorenzo', 17),

(269, 'Yoro', 18),
(270, 'Arenal', 18),
(271, 'El Negrito', 18),
(272, 'El Progreso', 18),
(273, 'Jocón', 18),
(274, 'Morazán', 18),
(275, 'Olanchito', 18),
(276, 'Santa Rita', 18),
(277, 'Sulaco', 18),
(278, 'Victoria', 18),
(279, 'Yorito', 18),

(280, 'Distrito Central', 8),
(281, 'Alubarén', 8),
(282, 'Cantarranas', 8),
(283, 'Cedros', 8),
(284, 'Curarén', 8),
(285, 'El Porvenir', 8),
(286, 'Guaimaca', 8),
(287, 'La Libertad', 8),
(288, 'La Venta', 8),
(289, 'Lepaterique', 8),
(290, 'Maraita', 8),
(291, 'Marale', 8),
(292, 'Nueva Armenia', 8),
(293, 'Ojojona', 8),
(294, 'Orica', 8),
(295, 'Reitoca', 8),
(296, 'Sabanagrande', 8),
(297, 'San Antonio de Oriente', 8),
(298, 'San Buenaventura', 8);


-- Table Persona
insert into Persona (idPersona, numeroIdentidad, primerNombre, segundoNombre, primerApellido, segundoApellido, numeroTelefono, edad, Genero_idGenero, Municipio_idMunicipio) values
(1, '0801-1996-76875', 'Orsa', 'Barrie', 'Pidgeon', 'Hampshire', '803-723-6028', 87, 1, 221),
(2, '0801-1996-44285', 'Corri', 'Clementine', 'McCory', 'Marco', '270-822-8251', 12, 2, 90),
(3, '0801-1996-48638', 'Terence', 'Sly', 'Maynell', 'Adlard', '541-732-9293', 49, 1, 185),
(4, '0801-1996-73372', 'Kerby', 'Jabez', 'Dytham', 'Cuer', '987-440-3799', 78, 2, 2),
(5, '0801-1996-12009', 'Neely', 'Claudelle', 'Kluger', 'Buttrey', '960-724-8144', 51, 1, 42),
(6, '0801-1996-11446', 'Annadiane', 'Regan', 'Leyband', 'Stobo', '638-587-6334', 39, 1, 18),
(7, '0801-1978-70942', 'Dominica', 'Bethina', 'Elldred', 'Mordey', '425-794-6873', 73, 1, 91),
(8, '0801-1978-47099', 'Adriano', 'Harmony', 'Greenin', 'Tilt', '491-255-7684', 44, 2, 25),
(9, '0801-1978-56510', 'Cyrus', 'Julita', 'Forber', 'Dargan', '725-933-4028', 30, 2, 40),
(10, '0801-1978-32881', 'Kimberly', 'Darya', 'Wickes', 'Schrinel', '395-235-7177', 25, 2, 232),
(11, '0801-1978-76763', 'Graeme', 'Daffie', 'Wooffitt', 'Dudley', '269-304-3069', 58, 2, 134),
(12, '0801-1978-92562', 'Gregory', 'Wylma', 'Behne', 'Sterley', '177-718-7032', 29, 1, 46),
(13, '0801-1978-50402', 'Chaddie', 'Deina', 'Sumsion', 'Oake', '656-818-8108', 15, 2, 61),
(14, '0801-1978-41818', 'Darill', 'Nevil', 'Darker', 'Coger', '101-370-0870', 73, 1, 173),
(15, '0801-1972-77386', 'Bernadina', 'Davita', 'Lafayette', 'Fenech', '754-564-0983', 8, 1, 275),
(16, '0801-1972-57695', 'Maureene', 'Terri', 'Keenlyside', 'Jebb', '179-968-2770', 17, 2, 193),
(17, '0801-1972-83687', 'Dorey', 'Hakeem', 'Barnard', 'Pearsall', '964-580-4844', 5, 2, 235),
(18, '0801-1972-89746', 'Rusty', 'Elly', 'Rowlatt', 'Beyn', '618-509-8120', 51, 2, 134),
(19, '0801-1972-36577', 'Ladonna', 'Germain', 'Cluff', 'Filipowicz', '532-480-5187', 29, 1, 121),
(20, '0801-1972-66489', 'Marty', 'Ingemar', 'Rockliffe', 'Rupert', '228-189-5159', 98, 2, 34),
(21, '0801-1972-15915', 'Homerus', 'Wallis', 'Wyley', 'Donnellan', '171-824-0838', 83, 1, 55),
(22, '0801-1972-88696', 'Eddie', 'Gradey', 'Spendley', 'Summerlee', '681-749-4991', 68, 2, 54),
(23, '0801-1972-78495', 'Aaren', 'Bobbye', 'Waddy', 'Kippax', '566-635-2166', 77, 1, 276),
(24, '0801-1972-51180', 'Beniamino', 'Steven', 'Verni', 'Armytage', '516-737-0471', 91, 2, 253),
(25, '0801-1972-91426', 'Kevin', 'Emma', 'Herrema', 'Godding', '973-529-4763', 69, 1, 28),
(26, '0601-1986-12398', 'Maximilien', 'Ardelis', 'Kenton', 'Garlette', '274-219-8433', 38, 2, 92),
(27, '0601-1986-63582', 'Myrwyn', 'Crichton', 'Adamsen', 'Lomis', '739-378-6210', 8, 2, 118),
(28, '0601-1986-67432', 'Elena', 'Neila', 'Shoreson', 'Sich', '155-190-3938', 50, 1, 258),
(29, '0601-1986-37819', 'Cymbre', 'Maribeth', 'Blewett', 'Pimley', '382-971-0668', 16, 1, 122),
(30, '0601-1986-47719', 'Nester', 'Petunia', 'Helleckas', 'Adnet', '402-115-5321', 99, 2, 258),
(31, '0601-1986-66732', 'Anatollo', 'Kassi', 'Finder', 'Gove', '812-716-0147', 56, 1, 201),
(32, '0601-1990-99973', 'Ody', 'Dixie', 'Figure', 'Brimicombe', '542-655-9521', 90, 2, 29),
(33, '0601-1990-18508', 'Abel', 'Wyn', 'Gauge', 'Sowter', '333-680-4483', 76, 2, 29),
(34, '0601-1990-86839', 'Demetris', 'Car', 'Quarton', 'Kestian', '968-393-4755', 54, 2, 239),
(35, '0601-1990-41000', 'Konstance', 'Wallis', 'Roseblade', 'Jepensen', '105-465-2196', 70, 1, 139),
(36, '0601-1990-76696', 'Toddy', 'Wilburt', 'Orpen', 'Ruberry', '935-150-7484', 48, 2, 102),
(37, '0601-1990-65603', 'Welsh', 'Matthaeus', 'Fetherstonhaugh', 'Killough', '549-801-4995', 92, 2, 169),
(38, '0601-1981-52391', 'Rebecca', 'Janenna', 'Broseke', 'Veljes', '338-667-9205', 7, 2, 241),
(39, '0601-1981-90516', 'Brynn', 'Vannie', 'Ducker', 'Gonnel', '687-573-7563', 32, 2, 91),
(40, '0601-1981-63073', 'Candie', 'Randall', 'Liver', 'Hardesty', '674-934-8247', 39, 1, 209),
(41, '0601-1981-74526', 'Davide', 'Audie', 'Moretto', 'Swinfen', '281-556-9338', 41, 1, 242),
(42, '0601-1981-22755', 'Giffer', 'Gusta', 'Roggerone', 'Sea', '697-349-7334', 80, 1, 125),
(43, '0601-1981-55144', 'Sofie', 'Crin', 'Spaduzza', 'Filchakov', '502-567-9014', 26, 1, 233),
(44, '0601-1999-23692', 'Mariya', 'Lew', 'Plaice', 'Beare', '487-323-4310', 54, 2, 212),
(45, '0701-1993-98621', 'Buckie', 'Galvin', 'Shiril', 'Gurling', '874-949-5747', 74, 1, 56),
(46, '0701-1993-34720', 'Foss', 'Nicoli', 'Febvre', 'Riddoch', '258-664-1280', 6, 1, 103),
(47, '0701-1993-38718', 'Chanda', 'Dalston', 'Attew', 'Phythean', '342-639-2372', 87, 1, 222),
(48, '0701-1993-88396', 'Juana', 'Gaby', 'Turton', 'Crutchfield', '248-925-1959', 68, 1, 247),
(49, '0701-1993-97158', 'Roderich', 'Toma', 'Truce', 'Chastey', '623-367-4070', 55, 1, 20),
(50, '0701-1993-39514', 'Sullivan', 'Ernaline', 'Greguoli', 'Richardin', '671-151-6410', 93, 1, 152);


-- Table Laboratorio
insert into Laboratorio (idLaboratorio, codigoLaboratio, nombreLaboratorio, direccion, Municipio_idMunicipio) values
(1, 1, 'Braun LLC', '4147 Prentice Road', 177),
(2, 2, 'Cormier, Ruecker and Rempel', '52 Vernon Pass', 177),
(3, 3, 'Gaylord, Gutkowski and Smitham', '3 Pond Center', 196),
(4, 4, 'Bauch Group', '73 Transport Park', 265),
(5, 5, 'Huels-Buckridge', '31014 1st Crossing', 137),
(6, 6, 'Miller, Abshire and Jacobson', '3562 Sutteridge Point', 243),
(7, 7, 'Hartmann Group', '13 Harper Hill', 262),
(8, 8, 'O''Kon-Langosh', '5867 Hagan Court', 159),
(9, 9, 'Ziemann Inc', '7 Carey Hill', 199),
(10, 10, 'Powlowski Group', '5497 Sunnyside Court', 157),
(11, 11, 'Nienow-Kub', '0769 Paget Junction', 238),
(12, 12, 'King, Casper and Kreiger', '3 Parkside Crossing', 100),
(13, 13, 'Lang, Cremin and Little', '41 Cordelia Junction', 107),
(14, 14, 'Batz LLC', '47951 Sugar Way', 37),
(15, 15, 'Schumm LLC', '038 Shelley Road', 36),
(16, 16, 'Tremblay-Conn', '5012 Golf Course Lane', 234),
(17, 17, 'Lind-Graham', '5867 Stone Corner Street', 69),
(18, 18, 'Kessler LLC', '992 Harbort Plaza', 274),
(19, 19, 'McCullough, Shanahan and Aufderhar', '52440 Linden Terrace', 187),
(20, 20, 'Kemmer, Terry and Bartoletti', '256 Muir Way', 256),
(21, 21, 'Donnelly, Littel and Tremblay', '00 Redwing Parkway', 49),
(22, 22, 'Kunze and Sons', '52756 Eagle Crest Road', 270),
(23, 23, 'Stokes, Greenfelder and Daugherty', '31 Gulseth Terrace', 265),
(24, 24, 'Mraz LLC', '06 Sachtjen Junction', 171),
(25, 25, 'Howe, Hilpert and Corkery', '81157 Golden Leaf Alley', 229),
(26, 26, 'Abbott, Aufderhar and Sawayn', '6560 Claremont Way', 84),
(27, 27, 'Von, Ondricka and Marvin', '60 Springview Junction', 256),
(28, 28, 'Franecki, Conroy and Hegmann', '97824 Myrtle Court', 220),
(29, 29, 'Upton-Kling', '8 Scoville Road', 133),
(30, 30, 'Fadel, Abshire and McClure', '06 Del Sol Circle', 212),
(31, 31, 'Parker Inc', '9901 Briar Crest Circle', 166),
(32, 32, 'Schinner, Weber and Emmerich', '3 Moland Lane', 144),
(33, 33, 'Kling-Osinski', '88 Haas Pass', 42),
(34, 34, 'Schaden, Franecki and Kassulke', '8217 Hayes Crossing', 69),
(35, 35, 'King, Blanda and Kovacek', '537 Mockingbird Center', 42),
(36, 36, 'Crist-Bergstrom', '4198 Del Mar Park', 220),
(37, 37, 'Jacobi Group', '94 Cascade Court', 195),
(38, 38, 'Beatty Group', '5202 Union Court', 201),
(39, 39, 'Wisozk, Dare and Botsford', '570 Scoville Point', 263),
(40, 40, 'Schmitt, Rolfson and Legros', '31 Ronald Regan Lane', 83),
(41, 41, 'Jakubowski-Welch', '17 Lotheville Parkway', 225),
(42, 42, 'Pollich and Sons', '4480 Messerschmidt Center', 49),
(43, 43, 'Kirlin, Grimes and Dietrich', '0 Rowland Court', 194),
(44, 44, 'Hegmann-Powlowski', '19 Cody Junction', 53),
(45, 45, 'Yundt and Sons', '83213 Steensland Plaza', 187),
(46, 46, 'Kunze Group', '98 Marquette Pass', 232),
(47, 47, 'Gulgowski-Langworth', '9 Pepper Wood Parkway', 199),
(48, 48, 'Schmitt LLC', '7834 Bluejay Point', 103),
(49, 49, 'Cummerata LLC', '0 Northfield Center', 161),
(50, 50, 'Nolan Group', '8834 Old Gate Lane', 264);


-- Table Prueba
insert into Prueba (idPrueba, codigoPrueba, fecha, infectado, Persona_idPersona) values
(1, '0001', '2020-01-03', 0, 1),
(2, '0002', '2020-02-11', 1, 2),
(3, '0003', '2019-11-11', 0, 3),
(4, '0004', '2020-01-19', 0, 4),
(5, '0005', '2020-02-05', 0, 5),
(6, '0006', '2020-04-15', 0, 6),
(7, '0007', '2020-04-29', 0, 7),
(8, '0008', '2020-07-16', 1, 8),
(9, '0009', '2019-12-19', 0, 9),
(10, '00010', '2020-05-31', 1, 10),
(11, '00011', '2020-02-03', 0, 11),
(12, '00012', '2020-06-07', 1, 12),
(13, '00013', '2020-03-04', 1, 13),
(14, '00014', '2020-05-19', 1, 14),
(15, '00015', '2019-11-24', 1, 15),
(16, '00016', '2020-05-24', 0, 16),
(17, '00017', '2020-05-05', 1, 17),
(18, '00018', '2019-10-19', 1, 18),
(19, '00019', '2020-08-08', 1, 19),
(20, '00020', '2020-08-14', 0, 20),
(21, '00021', '2020-01-19', 1, 21),
(22, '00022', '2019-10-26', 1, 22),
(23, '00023', '2019-11-02', 1, 23),
(24, '00024', '2019-08-27', 1, 24),
(25, '00025', '2019-11-14', 0, 25),
(26, '00026', '2019-08-21', 0, 26),
(27, '00027', '2020-06-30', 0, 27),
(28, '00028', '2020-03-21', 0, 28),
(29, '00029', '2020-05-17', 0, 29),
(30, '00030', '2020-01-29', 1, 30),
(31, '00031', '2020-03-11', 0, 31),
(32, '00032', '2020-05-18', 0, 32),
(33, '00033', '2020-07-19', 0, 33),
(34, '00034', '2019-08-17', 1, 34),
(35, '00035', '2020-02-03', 1, 35),
(36, '00036', '2020-03-01', 1, 36),
(37, '00037', '2019-11-07', 1, 37),
(38, '00038', '2020-07-09', 0, 38),
(39, '00039', '2020-07-04', 0, 39),
(40, '00040', '2019-11-03', 1, 40),
(41, '00041', '2020-04-19', 0, 41),
(42, '00042', '2020-08-01', 0, 42),
(43, '00043', '2019-10-21', 1, 43),
(44, '00044', '2020-03-12', 0, 44),
(45, '00045', '2019-09-29', 1, 45),
(46, '00046', '2019-10-11', 1, 46),
(47, '00047', '2020-01-27', 1, 47),
(48, '00048', '2020-04-29', 1, 48),
(49, '00049', '2019-11-13', 0, 49),
(50, '00050', '2019-12-30', 1, 50);


-- Table ListaPruebas
insert into ListaPruebas (Prueba_idPrueba, Laboratorio_idLaboratorio) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50);


-- Table CronologiaContagios
insert into CronologiaContagios (idCronologiaContagios, fecha, cantidadContagios, cantidadMuertes, cantidadRecuperados, cantidadActivos, Municipio_idMunicipio) values
(1, '2020-02-27', 37, 20, 31, 11, 5),
(2, '2020-07-30', 14, 29, 28, 20, 6),
(3, '2019-12-24', 19, 14, 24, 37, 12),
(4, '2020-02-25', 6, 5, 37, 44, 14),
(5, '2020-02-05', 47, 37, 21, 20, 15),
(6, '2020-07-13', 23, 50, 46, 33, 14),
(7, '2020-01-09', 43, 25, 26, 14, 1),
(8, '2020-05-13', 26, 12, 49, 28, 14),
(9, '2020-06-07', 45, 28, 13, 21, 4),
(10, '2020-01-05', 26, 15, 47, 48, 3),
(11, '2020-03-22', 25, 6, 27, 30, 14),
(12, '2019-11-15', 40, 12, 22, 45, 8),
(13, '2020-02-07', 39, 8, 31, 48, 5),
(14, '2020-05-30', 42, 34, 43, 38, 2),
(15, '2019-09-07', 13, 5, 36, 1, 18),
(16, '2020-05-08', 46, 30, 22, 17, 6),
(17, '2020-07-17', 36, 11, 45, 25, 10),
(18, '2019-10-17', 42, 46, 25, 33, 3),
(19, '2020-06-21', 15, 43, 30, 4, 4),
(20, '2020-07-13', 41, 9, 34, 5, 11),
(21, '2020-01-25', 25, 40, 38, 33, 14),
(22, '2019-11-11', 15, 45, 32, 18, 15),
(23, '2020-05-31', 20, 29, 32, 1, 8),
(24, '2020-07-18', 6, 31, 25, 26, 11),
(25, '2020-01-11', 28, 22, 35, 22, 8),
(26, '2019-11-30', 6, 7, 32, 5, 15),
(27, '2020-02-08', 31, 8, 50, 34, 15),
(28, '2019-09-06', 19, 43, 47, 3, 7),
(29, '2019-10-01', 35, 29, 31, 4, 11),
(30, '2020-05-22', 46, 39, 25, 27, 8),
(31, '2020-03-18', 11, 44, 14, 2, 11),
(32, '2019-09-05', 38, 22, 38, 20, 10),
(33, '2020-02-07', 32, 39, 36, 42, 11),
(34, '2020-08-06', 18, 46, 48, 14, 14),
(35, '2019-12-06', 37, 26, 39, 1, 10),
(36, '2020-05-26', 38, 7, 13, 49, 14),
(37, '2020-07-06', 10, 34, 33, 30, 9),
(38, '2019-12-28', 27, 11, 12, 12, 11),
(39, '2019-09-23', 48, 47, 36, 50, 4),
(40, '2020-03-22', 48, 38, 27, 44, 9),
(41, '2019-10-06', 26, 34, 34, 3, 12),
(42, '2020-07-10', 48, 5, 41, 14, 18),
(43, '2020-02-08', 31, 17, 26, 28, 15),
(44, '2020-05-05', 10, 23, 43, 43, 10),
(45, '2020-05-04', 45, 39, 43, 16, 12),
(46, '2020-05-28', 44, 18, 39, 19, 5),
(47, '2020-02-20', 23, 31, 18, 7, 6),
(48, '2019-10-30', 47, 17, 15, 47, 1),
(49, '2019-10-30', 28, 15, 44, 1, 13),
(50, '2019-09-30', 23, 29, 18, 27, 16);



-- Table Usuarios
insert into Usuarios (idUsuarios, correoElectronico, contraseña, Persona_idPersona) values
(1, 'hthulborn0@people.com.cn', 'ThGbf7tyHB4', 1),
(2, 'cvasilic1@sciencedaily.com', 'DD3gwk', 2),
(3, 'jrevening2@godaddy.com', 'doR7XnflMh', 3),
(4, 'chayter3@nbcnews.com', 'W53P2xxssAt7', 4),
(5, 'ajeavon4@ft.com', 'BVxUW8XVG', 5),
(6, 'tcoldtart5@netvibes.com', 'nFmvQZ', 6),
(7, 'pentreis6@etsy.com', 'ftIGmNWI9Fg', 7),
(8, 'istickells7@myspace.com', '4nnKu0DCkQT1', 8),
(9, 'lkellock8@redcross.org', 'Axpq0T', 9),
(10, 'mdavenhill9@google.it', 'rTbt4EV', 10),
(11, 'kstrattana@chicagotribune.com', 'lQeK6xU', 11),
(12, 'sbrasenerb@diigo.com', 'ffoKjkgVsr', 12),
(13, 'oheapc@quantcast.com', 'sdpQaeJgH9zZ', 13),
(14, 'lherrerand@mac.com', 'Zi0HeKs78x', 14),
(15, 'bnicklene@cafepress.com', '2OhOtLkUB', 15),
(16, 'hmartinettof@live.com', 'rfPxgHh', 16),
(17, 'kofieldg@github.io', 'o8KTHb', 17),
(18, 'mbransdonh@sciencedirect.com', 'F1oCVZPNq', 18),
(19, 'lvellai@yale.edu', 'njNmLjIAMsD', 19),
(20, 'acorthesj@msn.com', 'FgjXm1VLky0', 20),
(21, 'cstallybrassk@squarespace.com', '574dj1v', 21),
(22, 'jkobpall@purevolume.com', 'ST5syo', 22),
(23, 'acontim@hugedomains.com', 'jJ3dbIXR', 23),
(24, 'dkarrann@uiuc.edu', '67Dz15vIU4', 24),
(25, 'ldysharto@myspace.com', 'E1wFcy', 25),
(26, 'lnaisbetp@europa.eu', 'aWk4wWW', 26),
(27, 'ncannonq@netlog.com', 'BaEG5e2PYu', 27),
(28, 'pgilhoolier@disqus.com', 'OPPjfga5phHD', 28),
(29, 'lhedinghams@bing.com', 'KKJ1IiwHkWKH', 29),
(30, 'graynhamt@github.io', 'xij4GT', 30),
(31, 'gdeathu@cocolog-nifty.com', 'fcvQHb2jYO', 31),
(32, 'bbansteadv@auda.org.au', 'mQ5bdj8M', 32),
(33, 'cstapfordw@privacy.gov.au', 'mtWNESYpj1', 33),
(34, 'bpigeramx@friendfeed.com', 'wQDCunb', 34),
(35, 'mrexworthyy@google.com.au', 'qNG5DnsuGdW', 35),
(36, 'planferez@ftc.gov', 'fMcz6zHQVKpv', 36),
(37, 'wfriedlos10@trellian.com', 'fHUbh9x', 37),
(38, 'stieraney11@eepurl.com', 'JiP2rllUuKg', 38),
(39, 'cbarbera12@irs.gov', '1ddv0yIk5FL', 39),
(40, 'svasey13@squarespace.com', 'z28uYsj9Jbu', 40),
(41, 'bglide14@bloglines.com', 'g2vMNxRHEl', 41),
(42, 'fdorton15@zimbio.com', 'nAnGNOdKL5', 42),
(43, 'gaizikov16@boston.com', 'lOHk5T', 43),
(44, 'dgerdes17@usatoday.com', 'AkjzH3QM', 44),
(45, 'ghardington18@eepurl.com', 'Zt8OTf', 45),
(46, 'asussex19@addtoany.com', 'CrhWGM', 46),
(47, 'emattiuzzi1a@mac.com', 'qwofJx', 47),
(48, 'lmattys1b@unesco.org', 'icP69Kbw', 48),
(49, 'cbeals1c@reverbnation.com', 's4a3RAqD0', 49),
(50, 'mlinke1d@webnode.com', 'HcreCc', 50);


-- Table Patologia
insert into Patologia(idPatologia, descripcion) values
(1, 'Diabetes'),
(2, 'Hipertensión'),
(3, 'Insuficiencia renal'),
(4, 'Asma');

-- Table NoPatologia
insert into NoPatologia(idNoPatologia, descripcion) values
(1, 'Estuvo en el extranjero los últimos 14 días'),
(2, 'Ha estado cerca de alguien con Covid-19'),
(3, 'Vive con personas mayores de edad');

-- Table EstadoPaciente
insert into EstadoPaciente(idEstadoPaciente, descripcion) values
(1, 'Recuperado'),
(2, 'Caso activo');

-- Table Encuesta
insert into encuesta (idEncuesta, codigoEncuesta, fechaEncuesta, EstadoPaciente_idEstadoPaciente, Persona_idPersona) values
(1, 1, '2020-08-30', 1, 1),
(2, 2, '2020-09-20', 2, 2),
(3, 3, '2020-09-12', 2, 3),
(4, 4, '2020-10-02', 2, 4),
(5, 5, '2020-10-04', 1, 5),
(6, 6, '2020-10-16', 2, 6),
(7, 7, '2020-09-13', 2, 7),
(8, 8, '2020-10-24', 2, 8),
(9, 9, '2020-08-27', 1, 9),
(10, 10, '2020-10-11', 2, 10),
(11, 11, '2020-08-27', 2, 11),
(12, 12, '2020-09-11', 2, 12),
(13, 13, '2020-11-04', 1, 13),
(14, 14, '2020-09-10', 2, 14),
(15, 15, '2020-09-10', 1, 15),
(16, 16, '2020-10-28', 1, 16),
(17, 17, '2020-09-04', 1, 17),
(18, 18, '2020-09-22', 1, 18),
(19, 19, '2020-09-10', 1, 19),
(20, 20, '2020-08-23', 1, 20),
(21, 21, '2020-10-17', 1, 21),
(22, 22, '2020-10-16', 1, 22),
(23, 23, '2020-09-23', 1, 23),
(24, 24, '2020-10-28', 2, 24),
(25, 25, '2020-09-21', 2, 25),
(26, 26, '2020-10-02', 1, 26),
(27, 27, '2020-09-13', 1, 27),
(28, 28, '2020-10-03', 1, 28),
(29, 29, '2020-10-08', 1, 29),
(30, 30, '2020-10-08', 1, 30),
(31, 31, '2020-09-20', 1, 31),
(32, 32, '2020-09-10', 2, 32),
(33, 33, '2020-09-12', 2, 33),
(34, 34, '2020-08-28', 2, 34),
(35, 35, '2020-09-10', 1, 35),
(36, 36, '2020-08-28', 1, 36),
(37, 37, '2020-09-13', 1, 37),
(38, 38, '2020-10-29', 1, 38),
(39, 39, '2020-11-07', 1, 39),
(40, 40, '2020-09-23', 1, 40),
(41, 41, '2020-11-01', 1, 41),
(42, 42, '2020-08-30', 2, 42),
(43, 43, '2020-10-06', 1, 43),
(44, 44, '2020-10-21', 2, 44),
(45, 45, '2020-11-03', 2, 45),
(46, 46, '2020-09-19', 2, 46),
(47, 47, '2020-10-05', 2, 47),
(48, 48, '2020-10-02', 2, 48),
(49, 49, '2020-09-17', 1, 49),
(50, 50, '2020-10-19', 1, 50);

-- Table Cronologia
insert into Cronologia (idCronologia, fechaPrueba, diasSintomas, diasCuarentena, fechaRecuperacion, Encuesta_idEncuesta) values
(1, '2020-08-21', 5, 8, '2020-08-30', 1),
(2, '2020-08-20', 13, 3, '2020-08-29', 2),
(3, '2020-08-24', 12, 10, '2020-08-30', 3),
(4, '2020-08-23', 10, 1, '2020-08-29', 4),
(5, '2020-08-21', 2, 10, '2020-08-27', 5),
(6, '2020-08-25', 1, 1, '2020-08-27', 6),
(7, '2020-08-25', 6, 4, '2020-08-28', 7),
(8, '2020-08-25', 13, 15, '2020-08-27', 8),
(9, '2020-08-23', 3, 3, '2020-08-29', 9),
(10, '2020-08-21', 11, 14, '2020-08-30', 10),
(11, '2020-08-25', 9, 10, '2020-08-30', 11),
(12, '2020-08-20', 11, 14, '2020-08-28', 12),
(13, '2020-08-20', 3, 7, '2020-08-30', 13),
(14, '2020-08-25', 14, 9, '2020-08-28', 14),
(15, '2020-08-23', 3, 11, '2020-08-28', 15),
(16, '2020-08-22', 15, 2, '2020-08-30', 16),
(17, '2020-08-21', 3, 14, '2020-08-29', 17),
(18, '2020-08-23', 7, 9, '2020-08-30', 18),
(19, '2020-08-21', 5, 4, '2020-08-27', 19),
(20, '2020-08-23', 14, 10, '2020-08-27', 20),
(21, '2020-08-21', 15, 11, '2020-08-27', 21),
(22, '2020-08-20', 3, 7, '2020-08-30', 22),
(23, '2020-08-21', 12, 15, '2020-08-28', 23),
(24, '2020-08-24', 10, 2, '2020-08-29', 24),
(25, '2020-08-20', 14, 2, '2020-08-30', 25),
(26, '2020-08-22', 9, 15, '2020-08-30', 26),
(27, '2020-08-24', 11, 14, '2020-08-27', 27),
(28, '2020-08-23', 7, 1, '2020-08-28', 28),
(29, '2020-08-21', 7, 6, '2020-08-27', 29),
(30, '2020-08-20', 7, 12, '2020-08-29', 30),
(31, '2020-08-25', 9, 2, '2020-08-29', 31),
(32, '2020-08-24', 6, 12, '2020-08-29', 32),
(33, '2020-08-25', 14, 15, '2020-08-29', 33),
(34, '2020-08-23', 13, 13, '2020-08-27', 34),
(35, '2020-08-20', 2, 12, '2020-08-29', 35),
(36, '2020-08-20', 14, 3, '2020-08-29', 36),
(37, '2020-08-21', 14, 1, '2020-08-27', 37),
(38, '2020-08-21', 14, 14, '2020-08-27', 38),
(39, '2020-08-25', 7, 12, '2020-08-29', 39),
(40, '2020-08-23', 9, 15, '2020-08-28', 40),
(41, '2020-08-25', 1, 11, '2020-08-30', 41),
(42, '2020-08-22', 10, 3, '2020-08-29', 42),
(43, '2020-08-21', 13, 12, '2020-08-29', 43),
(44, '2020-08-24', 10, 4, '2020-08-29', 44),
(45, '2020-08-21', 6, 13, '2020-08-30', 45),
(46, '2020-08-24', 6, 13, '2020-08-28', 46),
(47, '2020-08-24', 15, 10, '2020-08-29', 47),
(48, '2020-08-20', 1, 7, '2020-08-30', 48),
(49, '2020-08-22', 5, 13, '2020-08-27', 49),
(50, '2020-08-24', 5, 5, '2020-08-28', 50);

-- Table TipoSintoma
insert into TipoSintoma(idtiposintoma, descripcion) values
(1, 'Común'),
(2, 'Grave'),
(3, 'No común');

-- Table Sintoma
insert into Sintoma(idsintoma, descripcion, tiposintomas_idtiposintomas) values
(1, 'Tos seca', 1),
(2, 'Fiebre', 1),
(3, 'Cansancio', 1),
(4, 'Dificultad para respirar', 2),
(5, 'Incapacidad para hablar o moverse', 2),
(6, 'Dolor de cabeza y cuerpo', 2),
(7, 'Diarrea', 3),
(8, 'Dolor de garganta', 3),
(9, 'Secreción nasal', 3);

-- Table listaSintomas
insert into listaSintomas (Encuesta_idEncuesta, Sintoma_idSintoma) values
(1, 6),
(2, 2),
(3, 8),
(4, 2),
(5, 4),
(6, 4),
(7, 8),
(8, 6),
(9, 3),
(10, 5),
(11, 4),
(12, 3),
(13, 4),
(14, 5),
(15, 5),
(16, 6),
(17, 9),
(18, 9),
(19, 4),
(20, 1),
(21, 7),
(22, 6),
(23, 7),
(24, 5),
(25, 5),
(26, 9),
(27, 3),
(28, 6),
(29, 2),
(30, 4),
(31, 7),
(32, 7),
(33, 2),
(34, 1),
(35, 8),
(36, 1),
(37, 4),
(38, 3),
(39, 5),
(40, 6),
(41, 2),
(42, 1),
(43, 1),
(44, 3),
(45, 5),
(46, 5),
(47, 1),
(48, 9),
(49, 1),
(50, 7);


-- Table Tratamiento
insert into Tratamiento(idTratamiento, descripcion) values
(1, 'Tratamiento MAIZ'),
(2, 'Antivirales'),
(3, 'Dexametasona'),
(4, 'Descanso y cuidado personal'),
(5, 'Cuidados intensivos');

-- Table LugarAsistencia
insert into LugarAsistencia(idLugarAsistencia, descripcion) values
(1, 'Hospital público'),
(2, 'Hospital o clínica privada'),
(3, 'Consulta en línea'),
(4, 'Centro de asistencia temporal'),
(5, 'Centro de triaje'),
(6, 'Brigada médica'),
(7, 'Monitoreo remoto');

-- Table AsistenciaMedica
insert into AsistenciaMedica (idAsistenciaMedica, fecha, Encuesta_idEncuesta, Tratamiento_idTratamiento, LugarAsistencia_idLugarAsistencia) values
(1, '2020-08-26', 1, 3, 1),
(2, '2020-08-26', 2, 3, 1),
(3, '2020-08-26', 3, 4, 7),
(4, '2020-08-25', 4, 1, 4),
(5, '2020-08-25', 5, 4, 3),
(6, '2020-08-25', 6, 4, 5),
(7, '2020-08-25', 7, 4, 2),
(8, '2020-08-25', 8, 4, 3),
(9, '2020-08-25', 9, 3, 5),
(10, '2020-08-25', 10, 5, 5),
(11, '2020-08-25', 11, 5, 3),
(12, '2020-08-25', 12, 3, 3),
(13, '2020-08-25', 13, 4, 6),
(14, '2020-08-25', 14, 1, 7),
(15, '2020-08-25', 15, 2, 5),
(16, '2020-08-26', 16, 1, 4),
(17, '2020-08-26', 17, 2, 4),
(18, '2020-08-26', 18, 3, 7),
(19, '2020-08-26', 19, 1, 3),
(20, '2020-08-26', 20, 2, 2),
(21, '2020-08-25', 21, 2, 3),
(22, '2020-08-25', 22, 3, 3),
(23, '2020-08-26', 23, 5, 5),
(24, '2020-08-26', 24, 4, 5),
(25, '2020-08-25', 25, 2, 3),
(26, '2020-08-25', 26, 2, 1),
(27, '2020-08-25', 27, 5, 3),
(28, '2020-08-25', 28, 3, 5),
(29, '2020-08-26', 29, 1, 1),
(30, '2020-08-26', 30, 2, 3),
(31, '2020-08-26', 31, 4, 2),
(32, '2020-08-25', 32, 4, 6),
(33, '2020-08-25', 33, 2, 5),
(34, '2020-08-25', 34, 2, 2),
(35, '2020-08-26', 35, 1, 1),
(36, '2020-08-25', 36, 4, 4),
(37, '2020-08-26', 37, 5, 7),
(38, '2020-08-26', 38, 4, 4),
(39, '2020-08-26', 39, 3, 6),
(40, '2020-08-25', 40, 5, 7),
(41, '2020-08-25', 41, 3, 6),
(42, '2020-08-26', 42, 2, 5),
(43, '2020-08-25', 43, 1, 5),
(44, '2020-08-25', 44, 2, 2),
(45, '2020-08-25', 45, 5, 1),
(46, '2020-08-26', 46, 4, 2),
(47, '2020-08-25', 47, 1, 7),
(48, '2020-08-25', 48, 4, 4),
(49, '2020-08-25', 49, 3, 6),
(50, '2020-08-25', 50, 3, 2);

-- Table AntecedentesNP
insert into AntecedentesNP (idAntecedentesNP, cPersonaVivienda, Encuesta_idEncuesta) values
(1, 1, 1),
(2, 1, 2),
(3, 6, 3),
(4, 4, 4),
(5, 1, 5),
(6, 2, 6),
(7, 3, 7),
(8, 6, 8),
(9, 2, 9),
(10, 6, 10),
(11, 6, 11),
(12, 2, 12),
(13, 4, 13),
(14, 2, 14),
(15, 2, 15),
(16, 5, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 3, 20),
(21, 3, 21),
(22, 4, 22),
(23, 2, 23),
(24, 4, 24),
(25, 1, 25),
(26, 3, 26),
(27, 4, 27),
(28, 6, 28),
(29, 4, 29),
(30, 5, 30),
(31, 4, 31),
(32, 2, 32),
(33, 1, 33),
(34, 3, 34),
(35, 5, 35),
(36, 2, 36),
(37, 2, 37),
(38, 5, 38),
(39, 6, 39),
(40, 4, 40),
(41, 2, 41),
(42, 2, 42),
(43, 2, 43),
(44, 4, 44),
(45, 3, 45),
(46, 2, 46),
(47, 5, 47),
(48, 3, 48),
(49, 5, 49),
(50, 2, 50);

-- Table AntecedentesP
insert into AntecedentesP (idAntecedentesP, infectadoAnteriormente, Encuesta_idEncuesta) values
(1, 0, 1),
(2, 0, 2),
(3, 0, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 0, 8),
(9, 1, 9),
(10, 1, 10),
(11, 0, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 0, 15),
(16, 1, 16),
(17, 1, 17),
(18, 0, 18),
(19, 0, 19),
(20, 0, 20),
(21, 0, 21),
(22, 1, 22),
(23, 1, 23),
(24, 0, 24),
(25, 1, 25),
(26, 1, 26),
(27, 0, 27),
(28, 0, 28),
(29, 1, 29),
(30, 1, 30),
(31, 0, 31),
(32, 0, 32),
(33, 0, 33),
(34, 1, 34),
(35, 0, 35),
(36, 1, 36),
(37, 1, 37),
(38, 0, 38),
(39, 1, 39),
(40, 0, 40),
(41, 1, 41),
(42, 0, 42),
(43, 1, 43),
(44, 1, 44),
(45, 0, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50);

-- Table ListaAntecedentesP
insert into ListaAntecedentesP (Patologia_idPatologia, AntecedentesP_idAntecedentesP) values
(3, 1),
(3, 2),
(4, 3),
(3, 4),
(2, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(4, 13),
(3, 14),
(1, 15),
(3, 16),
(1, 17),
(2, 18),
(2, 19),
(3, 20),
(3, 21),
(4, 22),
(2, 23),
(4, 24),
(2, 25),
(3, 26),
(3, 27),
(3, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(2, 33),
(1, 34),
(3, 35),
(4, 36),
(3, 37),
(2, 38),
(2, 39),
(3, 40),
(2, 41),
(2, 42),
(4, 43),
(2, 44),
(3, 45),
(3, 46),
(2, 47),
(1, 48),
(4, 49),
(4, 50);


-- Table ListaAntecedentesNP
insert into ListaAntecedentesNP (NoPatologia_idNoPatologia, AntecedentesNP_idAntecedentesNP) values
(3, 1),
(3, 2),
(3, 3),
(2, 4),
(2, 5),
(2, 6),
(1, 7),
(1, 8),
(3, 9),
(3, 10),
(2, 11),
(2, 12),
(1, 13),
(3, 14),
(3, 15),
(2, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(3, 21),
(2, 22),
(3, 23),
(1, 24),
(2, 25),
(2, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(1, 36),
(3, 37),
(1, 38),
(3, 39),
(2, 40),
(2, 41),
(1, 42),
(1, 43),
(3, 44),
(1, 45),
(3, 46),
(2, 47),
(2, 48),
(1, 49),
(3, 50);