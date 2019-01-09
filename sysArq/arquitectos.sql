/*
 Navicat Premium Data Transfer

 Source Server         : Servidor local
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : arquitectos

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 08/01/2019 22:11:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administradores
-- ----------------------------
DROP TABLE IF EXISTS `administradores`;
CREATE TABLE `administradores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cargo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rol` int(11) NULL DEFAULT NULL,
  `flag_activo` tinyint(4) NULL DEFAULT NULL,
  `tb_sec_users_login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usuario_modifica` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administradores
-- ----------------------------
INSERT INTO `administradores` VALUES (1, 'Administrador', 'Administrador de contratos', '1234', '434', 'origen@admin.com', 1, 1, 'admin', 'admin', '2018-10-10');
INSERT INTO `administradores` VALUES (2, 'AdministradorRayas', 'Rayas ', '787', '787', 'rayass@origen.com', 4, 1, 'adminRayas', 'admin', '2018-10-10');

-- ----------------------------
-- Table structure for anexos
-- ----------------------------
DROP TABLE IF EXISTS `anexos`;
CREATE TABLE `anexos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of anexos
-- ----------------------------
INSERT INTO `anexos` VALUES (1, 1, NULL, NULL);
INSERT INTO `anexos` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for archivos_contrato
-- ----------------------------
DROP TABLE IF EXISTS `archivos_contrato`;
CREATE TABLE `archivos_contrato`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anexo` int(11) NULL DEFAULT NULL,
  `binaryvalue` longblob NULL,
  `filename` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `filetype` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for areas_generador
-- ----------------------------
DROP TABLE IF EXISTS `areas_generador`;
CREATE TABLE `areas_generador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_zona` int(11) NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of areas_generador
-- ----------------------------
INSERT INTO `areas_generador` VALUES (1, 'ÁREA SOCIAL DE Planta BAJA', 2, '2018-10-10', 'admin');
INSERT INTO `areas_generador` VALUES (2, 'RECÁMARA 1', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (3, 'RECÁMARA 2', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (4, 'RECÁMARA 3 ', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (5, 'ÁREA FAMILIAR DE P. ALTA', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (6, 'ÁREA EXTERIOR Y DE SERVICIO', 2, NULL, NULL);
INSERT INTO `areas_generador` VALUES (7, 'ÁREA SOCIAL INTERIOR DE SÓTANO', 3, NULL, NULL);
INSERT INTO `areas_generador` VALUES (8, 'ÁREA SOCIAL EXTERIOR DE SÓTANO', 3, NULL, NULL);
INSERT INTO `areas_generador` VALUES (9, 'RECÁMARA PRINCIPAL ', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (10, 'RECÁMARA 1', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (11, 'RECÁMARA 2 ', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (12, 'RECÁMARA 3 ', 1, NULL, NULL);
INSERT INTO `areas_generador` VALUES (13, 'ESTUDIO Y/O REC. VISITAS', 2, NULL, NULL);
INSERT INTO `areas_generador` VALUES (14, 'LAVANDERÍA ', 2, NULL, NULL);
INSERT INTO `areas_generador` VALUES (15, 'CUARTO DE SERVICIO ', 2, NULL, NULL);
INSERT INTO `areas_generador` VALUES (17, 'Prueba 2', 1, '2018-10-10', 'admin');

-- ----------------------------
-- Table structure for categorias_modulos
-- ----------------------------
DROP TABLE IF EXISTS `categorias_modulos`;
CREATE TABLE `categorias_modulos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categorias_modulos
-- ----------------------------
INSERT INTO `categorias_modulos` VALUES (1, 'Estimaciones', 'Agrupa todo lo relacionado a estimaciones', '2018-09-13', '00:00:08', 1, 1);
INSERT INTO `categorias_modulos` VALUES (2, 'Contratos', 'Agrupa todo lo relacionado a contratos', '2018-09-13', '00:00:10', 1, 1);
INSERT INTO `categorias_modulos` VALUES (3, 'Administración y Seguridad', 'Agrupa los módulos que intervienen en la administración del sistema y permiten garantizar la seguridad de acceso a la información.', '2018-09-14', '00:00:14', 1, 1);
INSERT INTO `categorias_modulos` VALUES (4, 'Catalogos', 'Agrupa todos los CRUD referentes a catalogos', '2018-12-19', '01:01:02', 1, 1);

-- ----------------------------
-- Table structure for comentarios_contrato
-- ----------------------------
DROP TABLE IF EXISTS `comentarios_contrato`;
CREATE TABLE `comentarios_contrato`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time(4) NULL DEFAULT NULL,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for complementos_contrato
-- ----------------------------
DROP TABLE IF EXISTS `complementos_contrato`;
CREATE TABLE `complementos_contrato`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `anticipo` float NULL DEFAULT NULL,
  `fondo_garantia` float NULL DEFAULT NULL,
  `pendiente_estimar` float NULL DEFAULT NULL,
  `iva` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conceptos
-- ----------------------------
DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE `conceptos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion_larga` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unidad` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cantidad_original` float NOT NULL,
  `costo_maximo_subcontrato` float NOT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `costo_maximo_destajo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_clave` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Enlace con familias(cadena armada)',
  `id_proyecto` int(11) NULL DEFAULT NULL,
  `generador` int(11) NULL DEFAULT 0 COMMENT '0=no necesita generador\n1=necesita generador',
  `largo` float NULL DEFAULT NULL,
  `ancho` float NULL DEFAULT NULL,
  `alto` float NULL DEFAULT NULL,
  `total` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conceptos
-- ----------------------------
INSERT INTO `conceptos` VALUES (1, '301-PRE-00-01', 'CUOTAS AL FRACCIONAMIENTO', 'MES', 10000, 2200, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (2, '301-PRE-00-02', 'ECOLOGIA', 'LOTE', 0, 20000, NULL, NULL, NULL, '2000', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (3, '301-PRE-00-03', 'PERMISO FRACCIONAMIENTO', 'LOTE', 0, 8000, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (4, '301-PRE-00-04', 'DESARROLLO URBANO', 'LOTE', 0, 30000, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (5, '301-PRE-00-05', 'MECANICA DE SUELO', 'LOTE', 0, 9000, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (6, '301-PRE-00-06', 'CALCULO ESTRUCTURAL', 'LOTE', 0, 35000, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (7, '301-PRE-00-07', 'DESARROLLO DE PROYECTO', 'LOTE', 1, 3000, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (8, '301-PRE-05-002', 'Limpieza de terreno c/medios mecánicos , incluye: la extracción de todas las raíces, tocones fino, apile del material, mano de obra, equipo y herramienta', 'M2', 353.57, 17.43, NULL, NULL, NULL, '1.36', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (9, '301-PRE-05-004', 'Retiro de material producto de desmonte y desenraicé en camión de 14 M3 , volumen medido suelto, incluye: tiempo de espera de la carga mecánica, mano de obra, equipo y herramienta.  ( no incluye carga )', 'VIAJE', 1, 1400, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (10, '301-PRE-01-001', 'Trazo y nivelación manual para establecer ejes, banco de nivel y referencias, incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 553.57, 32.62, NULL, NULL, NULL, '4.23', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (11, '301-PRE-01-014', 'Renta mensual de sanitario portátil, con tres servicios semanales.', 'MES', 4, 1580, NULL, NULL, NULL, '0', '301-PRE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (12, '326-LIM-00-001', 'Acarreo de material y escombro fuera de la obra en camiones de 14 m3 durante la obra', 'VIAJE', 40, 1760, NULL, NULL, NULL, '0', '001-TYP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (13, '301-01.5-002', 'RETROEXCAVADORA CON MARTILLO', 'HR', 0, 430, NULL, NULL, NULL, '0', '001-TYP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (14, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 0, 140, NULL, NULL, NULL, '0', '001-TYP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (15, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 0, 1925, NULL, NULL, NULL, '0', '001-TYP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (16, '301-01.5-001', 'RETROEXCAVADOR', 'HR', 112, 350, NULL, NULL, NULL, '0', '001-TYP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (17, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 77.31, 140, NULL, NULL, NULL, '0', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (18, '302-EXC-002', 'Excavación en zapatas  a cielo abierto en material tipo III-A,  de  0.00 a -2.00 m. con martillo hidráulico, incluye: mano de obra, equipo y herramienta.', 'M3', 0, 323.92, NULL, NULL, NULL, '0', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (19, '302-EXC-02-01', 'Relleno con producto de la excavacion_x000D_\n, (con retroexcavadora )compactado con bailarina al 95% proctor, adicionando agua, incluye: suministro de materiales, acarreos, mano de obra, maquinaria, equipo, herramienta y todo lo necesario para su rcorrecta ejecución.', 'M3', 50.46, 240.73, NULL, NULL, NULL, '27.21', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (20, '302-EXC-02-02', 'Relleno con material de banco, ( CON RETROEXCAVADORA ) compactado con bailarina al 95% proctor, adicionando agua, incluye: suministro de materiales, acarreos, mano de obra, maquinaria, equipo, herramienta y todo lo necesario para su rcorrecta ejecución.', 'M3', 0, 396.73, NULL, NULL, NULL, '27.21', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (21, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 5, 1925, NULL, NULL, NULL, '0', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (22, '302-EXC-04-001', 'FUMIGACION ANTITERMITA EN ZAPATAS Y FIRME, INCLUYE ; MATERIAL Y MANO DE OBRA', 'M2', 553.57, 17.17, NULL, NULL, NULL, '2.81', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (23, '302-CIM-03-302', 'Flete ida y vuelta de perforadora Watson 5000, incluye: montaje, desmontaje, equipo, mano de obra y herramienta.', 'FLETE', 1, 15500.8, NULL, NULL, NULL, '313.8', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (24, '302-CIM-03-181', 'Campana o ampliación de base de pilas, en material compacto, incluye: equipo, mano de obra y herramienta.', 'M3', 16.2449, 1954.81, NULL, NULL, NULL, '50.13', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (25, 'PILA 1', 'PILOTE DE CONCRETO DE 60 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/10 VA. DEL No. 4 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 268.5, 1803.07, NULL, NULL, NULL, '74.53', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (26, 'PILA 2', 'PILOTE DE CONCRETO DE 60 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/12 VA. DEL No. 5 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 110.5, 2154.64, NULL, NULL, NULL, '100.45', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (27, 'PILA 3', 'PILOTE DE CONCRETO DE 80 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/10 VA. DEL No. 4 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 66, 2481.77, NULL, NULL, NULL, '100.46', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (28, 'PILA 4', 'PILOTE DE CONCRETO DE 80 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/12 VA. DEL No. 5 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 44, 2781.91, NULL, NULL, NULL, '126.33', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (29, '302-PED-022', 'Columna de 0.4 x 0.4 m. de concreto premezclado F.c=250 kg/cm2, armado con 8 varillas # 5 , y 2 estribos # 3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado aparente, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'ML', 7.42, 3315.34, NULL, NULL, NULL, '260.01', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (30, '302-PED-024', 'Columna de 0.45 x 0.45 m. de concreto premezclado F.c=250 kg/cm2, armado con 8 varillas # 6 , y 2 estribos # 3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado aparente, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'ML', 3.71, 4023.16, NULL, NULL, NULL, '312.39', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (31, '302-TRA-001', 'Trabe de 20 x 40 6 vs 1/2 est #3 @20', 'ML', 150.97, 1326.79, NULL, NULL, NULL, '113.4', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (32, '302-TRA-003', 'Trabe de 20 x 55, 8 vs 1/2 est #3 @20', 'ML', 36.56, 1828.86, NULL, NULL, NULL, '155.55', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (33, '302-TRA-004', 'Trabe de 25 x 50, 6 vs 5/8 est #3 @20', 'ML', 12.25, 1867.43, NULL, NULL, NULL, '154.3', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (34, '302-TRA-005', 'Trabe de 25 x 55, 8 vs 5/8 est #3 @20', 'ML', 8.1, 2097.71, NULL, NULL, NULL, '173.91', '001-CIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (35, '304-ALBA-01', 'ALBAÑILERÍA GRAL.', 'LOTE', 1, 1, NULL, NULL, NULL, '1', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (36, '304-ALB-FIR-009', 'Firme de 12 cm acabado común, armado 3/8 @40 ambos lados, de concreto PREMEZCLADO F.c= 200  kg/cm2, incluye: suministro de materiales, acarreos, nivelación, cimbrado de fronteras, mano de obra, equipo y herramienta.', 'M2', 356.45, 638.59, NULL, NULL, NULL, '77.92', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (37, '304-ALB-02-201', 'Muro de 10 cm. de block de concreto de 10x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 7.31, 761.22, NULL, NULL, NULL, '69.25', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (38, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 735.73, 770.55, NULL, NULL, NULL, '70.59', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (39, '304-ALB-02-203', 'Muro de 20 cm. de block de concreto de 20x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 1, 902.08, NULL, NULL, NULL, '73.98', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (40, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 194.79, 1042.33, NULL, NULL, NULL, '117.13', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (41, '304-ALB-04-033-A', 'Castillo de 0.2 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 4 varillas del No. 4 , con estribos del No.2 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 41.75, 991.43, NULL, NULL, NULL, '128.1', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (42, '304-ALB-04-043-A', 'Castillo de 20x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 1/2\" y estribos del No.3 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 59.36, 358.53, NULL, NULL, NULL, '139.26', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (43, '304-ALB-04-054-B', 'Castillo de 0.3 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 4 , con estribos del No.3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 11.13, 1550.15, NULL, NULL, NULL, '192.08', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (45, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 1, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (46, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 8.1, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (47, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 8.3, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (48, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 26.62, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (49, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 309.33, 900, NULL, NULL, NULL, '120', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (50, '304-LOSA-02-001', 'ESCALERA de 1.2 de ancho', 'LOTE', 1, 17391.7, NULL, NULL, NULL, '1392.82', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (51, 'MC-A-02', 'Muro de contención de 4.8 m. de altura y 0.25 m. de espesor promedio, de concreto premezclado F.c=250 kg/cm2, armado con dos parrillas, una con varillas #5@10 cm. en sentido vertical y #4@20 cm. en sentido horizontal, la otra parilla #3@20 cm. en ambos sentidos, con zapata corrida de 2 x 0.35 m. de peralte promedio, armada en el sentido longitudinal con 0#4 en el lechos superior y 10#4 en el lecho inferior y en sentido transversal con varillas #6@20 cm. en lechos superior y #5@12 cm. en lecho inferior, Incluye: suministro de materiales, acarreos, cortes, traslapes, desperdicios, habilitado, plantilla, cimbrado acabado común, colado, vibrado, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'ML', 0, 18512.9, NULL, NULL, NULL, '1888.67', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (52, '304-ALB-02-201', 'Muro de 10 cm. de block de concreto de 10x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 28.8, 761.22, NULL, NULL, NULL, '69.25', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (53, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 434.24, 770.55, NULL, NULL, NULL, '70.59', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (54, '304-ALB-02-203', 'Muro de 20 cm. de block de concreto de 20x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 1, 902.08, NULL, NULL, NULL, '73.98', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (55, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 154.36, 1042.33, NULL, NULL, NULL, '117.13', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (56, '304-ALB-04-033-A', 'Castillo de 0.2 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 4 varillas del No. 4 , con estribos del No.2 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 13.6, 991.43, NULL, NULL, NULL, '128.1', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (57, '304-ALB-04-043-A', 'Castillo de 20x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 1/2\" y estribos del No.3 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 57.8, 358.53, NULL, NULL, NULL, '139.26', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (58, '304-ALB-04-054-B', 'Castillo de 0.3 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 4 , con estribos del No.3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 3.4, 1550.15, NULL, NULL, NULL, '192.08', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (60, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 1, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (61, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 2.54, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (62, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 14.28, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (63, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 27.27, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (64, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 293.2, 900, NULL, NULL, NULL, '120', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (65, '304-ALB-03-058-B', 'Cadena de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 500.01, 302.63, NULL, NULL, NULL, '105.63', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (66, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 0, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (67, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 2.54, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (68, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 14.28, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (69, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 27.27, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (70, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 293.2, 900, NULL, NULL, NULL, '120', '001-ALB', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (71, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 80, 140, NULL, NULL, NULL, '0', '001-ALBE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (72, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 7, 1925, NULL, NULL, NULL, '0', '001-ALBE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (73, '305-ALBERC-01-A', 'ALBERCA TIPO DE 10.0X4.0X1.6 M.', 'LOTE', 1, 267000, NULL, NULL, NULL, '0', '001-ALBE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (74, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 90.12, 770.55, NULL, NULL, NULL, '70.59', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (75, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 31, 1042.33, NULL, NULL, NULL, '117.13', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (76, '304-ALB-03-046', 'Cadena de 15x15 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con armex 15x15-4, incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 20, 672.19, NULL, NULL, NULL, '48.44', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (77, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 112.01, 946.69, NULL, NULL, NULL, '73.98', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (78, '304-ALB-10-141', 'Chaflan de 7 cm. de mezcla cemento-arena 1:5, incluye: materiales, acarreos, mano de obra, equipo y herramienta', 'M', 142.58, 183.52, NULL, NULL, NULL, '22.16', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (79, '304-ALB-10-202', 'EMPASTADO DE LOSA DE AZOTEA PARA DAR PENDIENTE   a base DE LIGHTSTONE FC=100 , incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 279.9, 463.03, NULL, NULL, NULL, '35.98', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (80, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 51.88, 383.06, NULL, NULL, NULL, '37.04', '001-TDE', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (81, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 19.15, 782.83, NULL, NULL, NULL, '60.53', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (82, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 214.4, 946.69, NULL, NULL, NULL, '73.98', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (83, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 0, 383.06, NULL, NULL, NULL, '37.04', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (84, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 0, 8633.6, NULL, NULL, NULL, '998.82', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (85, '304-APL-02-001', 'Yeso en muros  y cielos muestriado, con yeso-cemento,  incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 1424.47, 770.66, NULL, NULL, NULL, '60.06', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (86, '304-APL-02-002', 'Aplanado de yeso en plafond, con yeso-cemento,  incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 1, 943.69, NULL, NULL, NULL, '74.33', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (87, '304-APL-02-003', 'Cajillo de yeso de 2 cms x 1.5 cms,  incluye: materiales, mano de obra, equipo y herramienta.', 'M', 0, 912.29, NULL, NULL, NULL, '60.06', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (88, '304-APL-02-004', 'Media caña de yeso en zoclo, incluye; material, mano de obra y limpieza', 'M', 253.81, 224.05, NULL, NULL, NULL, '23.65', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (89, '304-APL-02-005', 'Nicho de yeso en tomas de gas, refrigerador , incluye: material mano de obra y limpieza', 'PZA', 5, 1273.81, NULL, NULL, NULL, '156.18', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (90, '304-APL-02-006', 'Detalle de yeso en basucas incluye colocacion de malla', 'PZA', 7, 830.07, NULL, NULL, NULL, '156.18', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (91, '304-APL-03-001', 'Falso plafon de metal desplegado con canaleta 1 1/2 y 3/4 , incluye: material, mano de obra y herramienta', 'M2', 1, 1191.39, NULL, NULL, NULL, '90', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (92, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 270.61, 782.83, NULL, NULL, NULL, '60.53', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (93, '304-APL-01-002', 'ACABADO CARACOLEADO DELGADO sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 1, 366.18, NULL, NULL, NULL, '27.78', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (94, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 891.14, 946.69, NULL, NULL, NULL, '73.98', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (95, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 66.65, 383.06, NULL, NULL, NULL, '37.04', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (96, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 0, 8633.6, NULL, NULL, NULL, '998.82', '001-APL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (97, '304-IMPER-001', 'Impermeabilizante a base de membrana termofusionada de 3.5 mm con gravilla color gris', 'M2', 331.78, 125, NULL, NULL, NULL, '0', '001-AMP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (98, '304-IMPER-002', 'Goteron metalico', 'ML', 36.78, 60, NULL, NULL, NULL, '0', '001-AMP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (99, '304-IMPER-010', 'Mmbrana delta; suministro e instalacion', 'M2', 0, 176.03, NULL, NULL, NULL, '13.32', '001-AMP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (100, '304-IMPER-003', 'Impermeabilizante a base de vitume 100', 'M2', 0, 133.87, NULL, NULL, NULL, '13.32', '001-AMP', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (101, '306-PIS-A1-001', 'PISO ( TOPE 330 )  formato mediano  asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 375.94, 969.1, NULL, NULL, NULL, '104.08', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (102, '306-PIS-A1-002', 'PISO ( TOPE 250 ) formato mediano asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 133.11, 916.1, NULL, NULL, NULL, '104.08', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (103, '306-PIS-A1-004', 'AZULEJO  ( TOPE 300 )  formato mediano  asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 135.64, 969.1, NULL, NULL, NULL, '104.08', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (104, '306-PIS-A1-003', 'Piso y/o Azulejo ( tope 250 ) en servico y lavanderia asentado con adesivo crest o similar incluye: material,mano de obra, desperdicio, corte y herramienta', 'LOTE', 1, 916.1, NULL, NULL, NULL, '104.08', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (105, '306-PIS-A1-005', 'Lote de escalera con PISO ( TOPE 330 ) formato mediano asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'ML', 1, 18112.2, NULL, NULL, NULL, '2231.03', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (106, '306-PIS-A1-006', 'Zoclo de 8 cm. PISO ( TOPE 330 )  según muestra aprobada en obra,asentada con cemento crest, incluye: suministro de materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta', 'ML', 268.22, 198.9, NULL, NULL, NULL, '30.05', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (107, '306-PIS-A1-007', 'Zoclo de 8 cm. PISO ( TOPE 250 )  según muestra aprobada en obra,asentada con cemento crest, incluye: suministro de materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta', 'PZA', 61.73, 193.9, NULL, NULL, NULL, '30.05', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (108, '306-PIS-A1-008', 'Nicho en regadera y/o  lavanderia ( tope 330 ) incluye;material, demoler para nicho, mano de obra y herramienta', 'ML', 4, 2038.81, NULL, NULL, NULL, '354.93', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (109, '306-PIS-A1-009', 'Pollo en regadera ( tope 330 )  incluye ; material, vaciado de pollo, mano de obra y herramienta', 'PZA', 6, 1559.13, NULL, NULL, NULL, '261.87', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (110, '306-PIS-A1-010', 'Pileta en general  ( tope 330 ) incluye; zarpeo, material, , mano de obra y herramienta', 'ML', 3, 2810.62, NULL, NULL, NULL, '390.44', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (111, '306-PIS-A1-011', 'Pollo en cocina  ( tope 330 )  mas vaciado de concreto incluye ; material, vaciado de pollo, mano de obra y herramienta', 'M2', 9.5, 1374.58, NULL, NULL, NULL, '233.33', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (112, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 135.64, 782.83, NULL, NULL, NULL, '60.53', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (113, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 509.05, 383.06, NULL, NULL, NULL, '37.04', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (114, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'ML', 1, 8633.6, NULL, NULL, NULL, '998.82', '001-PYA', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (115, '306-MYG-B1-001', 'Labavos marmol o granito TIPO    ( morita,ubatuva,santo tomas ,crema marfil )', 'M2', 9.05, 3500, NULL, NULL, NULL, '0', '001-MYG', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (116, '306-MYG-03-001', 'Mármol ( TIPO 1  l clásico de 2 cm de espesor, acabado pulido y brillado según despiece de proyecto en pisos, asentado con mortero cemento arena 1:4, incluye: materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta.', 'ML', 0, 3595.58, NULL, NULL, NULL, '350', '001-MYG', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (117, '306-MYG-03-001-1', 'ZOCLO DE MARMOL', 'M2', 0, 1589.8, NULL, NULL, NULL, '185', '001-MYG', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (118, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'ML', 16.81, 580, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (119, '306-CPT-A1-002B', 'Suministro e instalacion de TAPAS de cantera  ( blanca huichapan,cafe, negra ) INTERIOR', 'M2', 6.97, 380, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (120, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 102.66, 580, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (121, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 20.21, 580, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (122, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 0, 580, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (123, '306-CPT-B1-001', 'Suministro e instalacion de rajuela', 'M2', 1, 950, NULL, NULL, NULL, '0', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (124, '306-CPT-B2-001', 'PIedra de la huasteca, incluye; material, mano de obra y herramienta', 'ML', 66.65, 1016.23, NULL, NULL, NULL, '115', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (125, '306-CPT-B2-002', 'Zoclo de piedra de la huasteca', 'PZA', 18.69, 810.69, NULL, NULL, NULL, '100', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (126, '306-CPT-B2-003', 'Escalon de piedra dela huasteca', 'M2', 0, 1254.82, NULL, NULL, NULL, '150', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (127, '306-CPT-C1-001', 'Teja mextail pizzarra, incluye: trazo, materiales, acareos, cortes, desperdicios, mano de obra, equipo y herramienta.', 'M2', 0, 598.72, NULL, NULL, NULL, '65', '001-CPT', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (128, '306-PIN-01-001', 'Pintura vinilica en muros interiores marca Berel-berelinte  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'M2', 1424.47, 245.91, NULL, NULL, NULL, '18.77', '001-PIN', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (129, '306-PIN-01-002', 'Pintura vinilica en muros exteriores marca Berel-berelinte  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'M2', 891.14, 246.7, NULL, NULL, NULL, '18.77', '001-PIN', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (130, '306-PIN-01-003', 'Pintura satinada en muros exteriores rustico marca Berel-berelex o similar  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'PZA', 0, 250.51, NULL, NULL, NULL, '18.77', '001-PIN', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (131, '306-PIN-01-010', 'Pintura acrilica suma en marco metalico', 'PZA', 6, 1406.92, NULL, NULL, NULL, '112.47', '001-PIN', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (132, '307-HER-A1-001', 'PUERTA PRINCIPAL (TOPE 30,000) DE FIERO', 'PZA', 1, 25000, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (133, '307-HER-A1-002', 'PUERTA SECUNDARIA DE FIERRO           ( TOPE 8000 )', 'PZA', 0, 8000, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (134, '307-HER-A2-001', 'Puerta pasillo luber ( tope 6000 )', 'PZA', 1, 6000, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (135, '307-HER-A3-001', 'REJIULLA PLUBVIAL MARCO Y CONTRA DE .20 X 1.00', 'PZA', 2, 950, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (136, '307-HER-A4-001', 'TAPA MARCO Y CONTRAMARCO 60 X 60', 'PZA', 1, 750, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (137, '307-HER-A6-001', 'GARGOLA TIPO 4 X 4', 'PZA', 1, 200, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (138, '307-HER-A7-001', 'BASE PARA CAMPANA DE COCINA', 'PZA', 0, 900, NULL, NULL, NULL, '0', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (139, '307-HER-A9-001', 'MARCO METALICO  PARA PUERTA', 'LOTE', 6, 1233.55, NULL, NULL, NULL, '166.48', '001-HER', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (140, '308-ALU-A1-001', 'Lote de ventanas ( casa tipo 700 m2 ) en colorhueso o bca, linia eurovent en serie 70 y 100 segun claro con cristal tintex 6mm duovent solo recamaras', 'PZA', 1, 212750, NULL, NULL, NULL, '0', '001-ALU', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (141, '310-CAR-A1-001', 'Puedrta de encino enchapada sobre MDF en 6mm con cama de mdf de 3mm con 5 ranuras de 1/8,sin relleno, marco de encino,chambrana de encino 2 caras , pintada e instalada incluye; visagras', 'PZA', 13, 6600, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (142, '310-CAR-A1-002', 'Puedrta corrediza de encino enchapada sobre MDF en 6mm con cama de mdf de 3mm con 5 ranuras de 1/8,sin relleno, marco de encino,chambrana de encino 2 caras , pintada e instalada incluye; visagras y riel cooredizo', 'PZA', 0, 8530, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (143, '310-CAR-A1-003', 'Puerta multipanel lisa', 'M2', 6, 1950, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (144, '310-CAR-A3-002', 'DUELA DE INGENIERÍA Mca. GOOD MASTER o similar; suministro e instalación directa al firme; incluye pegamento.', 'ML', 0, 922.2, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (145, '310-CAR-A3-003', 'ZOCLO DE ENCINO DE 8 CMS', 'LOTE', 0, 220.04, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (146, '310-CAR-A4-001', 'Escalera de encino ( escalera tipo )solo huellas', 'PZA', 1, 16500, NULL, NULL, NULL, '0', '001-CAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (147, '311-ACB-A1-001C', 'Llave mezcladora y regaderta,modelo ............... ( tope 2500 )', '', 6, 3169.89, NULL, NULL, NULL, '187.25', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (148, '311-ACB-A1-002', 'Llave mezcladora y regaderta economica ,modelo ............... ', 'PZA', 1, 1769.89, NULL, NULL, NULL, '187.25', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (149, '311-ACB-A1-003', 'Llave mezcladora para lavabo modelo .............. ( tope 2500 )', 'PZA', 4, 3169.89, NULL, NULL, NULL, '187.25', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (150, '311-ACB-A1-004', 'Llave mezcladora economica para lavabo modelo .............. ( tope 800 )', 'PZA', 1, 1769.89, NULL, NULL, NULL, '187.25', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (151, '311-ACB-A1-005', 'resumidero marca elvex modelo.....', 'PZA', 9, 862.95, NULL, NULL, NULL, '93.63', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (152, '311-ACB-A1-006', 'Resumidero economico rugo', 'PZA', 7, 616.03, NULL, NULL, NULL, '93.63', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (153, '311-MB-01-001', 'Sanitario  TOPE 3000 , incluye: suministro de materiales, instalación, mano de obra, equipo y herramienta.', 'PZA', 1, 4017.48, NULL, NULL, NULL, '249.63', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (154, '311-MB-01-002', 'Sanitario y lavabo economico  modelo........... , incluye: suministro de materiales, instalación, mano de obra, equipo y herramienta.', 'PZA', 1, 3661.8, NULL, NULL, NULL, '374.51', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (155, '311-MB-01-003', 'Ovalin studio para placas de marmol', 'LOTE', 6, 1427, NULL, NULL, NULL, '0', '001-MDB', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (156, '314-PLO-001', 'CASA TIPO A_x000D_\nINSTALACIONES HIDROSANITARIAS_x000D_\nINCLUYE; DRENAJE SANITARIO, DRENAJE PLUVIAL, DRENAJE MINIESPLIT,RED DE AGUA FRIA Y CALIENTE TUBO PLUS, RED DE GAS EN COBRE,TUBO LAGRIMERO  ( SUMINISTRO E INSTALACION)', 'LOTE', 67800, 396283, NULL, NULL, NULL, '67800', '001-IHS', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (157, '315-ELE-001', 'CASA TIPO A_x000D_\nLOTE DE MANGUERAS Y CAJAS_x000D_\nLOTE DE CABLEADO_x000D_\nLOTE DE TAPAS Y CONTACTOS_x000D_\nLOTE DE LAMPARAS_x000D_\nLOTE GABINETES METALICOS_x000D_\nLOTE CABLEADO PRINCIPAL_x000D_\nLOTE DE INTER Y CENTROS DE CARGA', 'LOTE', 82500, 548935, NULL, NULL, NULL, '82500', '001-IEL', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (158, '319-DUC-01-001', 'Lote de ductode inyecion y retorno a pleno ( SALA COMEDOR ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'LOTE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (159, '319-DUC-01-002', 'Lote de ductode inyecion y retorno a pleno ( COCINA Y FAMILI  ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'LOTE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (160, '319-DUC-01-003', 'Lote de ductode inyecion y retorno a pleno ( RECAMARA PRINCIPAL  ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'VIAJE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (161, '326-LIM-00-001', 'Acarreo de material y escombro fuera de la obra en camiones de 14 m3 durante la obra', 'M2', 18, 1760, NULL, NULL, NULL, '0', '001-LIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (162, '326-LIM-01-001', 'Limpieza gruesa durante la obra, incluye: mano de obra, equipo y herramienta.', 'M2', 605.73, 56.77, NULL, NULL, NULL, '6.81', '001-LIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (163, '326-LIM-01-002', 'Limpieza fina de la obra para entrega, incluye: materiales, mano de obra, equipo y herramienta.', 'M3', 605.73, 93.66, NULL, NULL, NULL, '11.72', '001-LIM', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (164, '327-JAR-01-000', 'Tierra NEGRA  para jardinería, incluye: suministro, acarreo, colocación, mano de obra, equipo y herramienta.', 'M3', 0, 608.43, NULL, NULL, NULL, '54.43', '001-JAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (165, '327-JAR-01-001', 'Tierra vegetal preparada para jardinería, incluye: suministro, acarreo, colocación, mano de obra, equipo y herramienta.', 'LOTE', 7, 557.35, NULL, NULL, NULL, '77.76', '001-JAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (166, '327-JAR-01-011', 'LOTE DE PLANTAS Y PALMAS CASA A', 'M2', 1, 11543.7, NULL, NULL, NULL, '780.88', '001-JAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (167, '327-JAR-01-017', 'Pasto , incluye: acarreos, plantación, mano de obra, equipo y herramienta.', 'LOTE', 38.14, 157.35, NULL, NULL, NULL, '22.65', '001-JAR', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (168, '301-ADM-001', 'GASTOS ADMINISTRATIVOS POR EL DESARROLLO DE LA OBRA', 'M2', 300000, 30, NULL, NULL, NULL, '24', '001-AYC', 1, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (169, '301-ADM-005', 'PAGO POR VENTA DE PROYECTO _x000D_\nCOMISION DE VENTA', 'LOTE', 0, 345, NULL, NULL, NULL, '130', '001-AYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (170, '301-ADM-006', 'CUOTAS AL IMSS DURANTE LA CONSTRUCCION', 'LOTE', 397.6, 464.78, NULL, NULL, NULL, '343.3', '001-AYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (171, '301-ADM-007', 'BONIFICACION ARQ RESPONSABLE', 'LOTE', 0.4, 50000, NULL, NULL, NULL, '434.23', '001-AYC', 1, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (172, 'concepto', 'prueba de importador', 'M', 100, 200, NULL, NULL, NULL, '250', '001-PRU', 10, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (173, '', '', '', 0, 0, '', NULL, 0, '', '', 0, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (174, '301-PRE-00-01', 'CUOTAS AL FRACCIONAMIENTO', 'MES', 0, 2200, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (175, '301-PRE-00-02', 'ECOLOGIA', 'LOTE', 1, 20000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (176, '301-PRE-00-03', 'PERMISO FRACCIONAMIENTO', 'LOTE', 0, 8000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (177, '301-PRE-00-04', 'DESARROLLO URBANO', 'LOTE', 1, 30000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (178, '301-PRE-00-05', 'MECANICA DE SUELO', 'LOTE', 1, 9000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (179, '301-PRE-00-06', 'CALCULO ESTRUCTURAL', 'LOTE', 1, 35000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (180, '301-PRE-00-07', 'DESARROLLO DE PROYECTO', 'LOTE', 1, 3000, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (181, '301-PRE-05-002', 'Limpieza de terreno c/medios mecánicos , incluye: la extracción de todas las raíces, tocones fino, apile del material, mano de obra, equipo y herramienta', 'M2', 553.57, 17.43, NULL, NULL, NULL, '1.36', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (182, '301-PRE-05-004', 'Retiro de material producto de desmonte y desenraicé en camión de 14 M3 , volumen medido suelto, incluye: tiempo de espera de la carga mecánica, mano de obra, equipo y herramienta.  ( no incluye carga )', 'VIAJE', 1, 1400, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (183, '301-PRE-01-001', 'Trazo y nivelación manual para establecer ejes, banco de nivel y referencias, incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 553.57, 32.62, NULL, NULL, NULL, '4.23', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (184, '301-PRE-01-014', 'Renta mensual de sanitario portátil, con tres servicios semanales.', 'MES', 4, 1580, NULL, NULL, NULL, '0', '301-PRE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (185, '326-LIM-00-001', 'Acarreo de material y escombro fuera de la obra en camiones de 14 m3 durante la obra', 'VIAJE', 40, 1760, NULL, NULL, NULL, '0', '001-TYP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (186, '301-01.5-002', 'RETROEXCAVADORA CON MARTILLO', 'HR', 0, 430, NULL, NULL, NULL, '0', '001-TYP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (187, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 0, 140, NULL, NULL, NULL, '0', '001-TYP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (188, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 0, 1925, NULL, NULL, NULL, '0', '001-TYP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (189, '301-01.5-001', 'RETROEXCAVADOR', 'HR', 112, 350, NULL, NULL, NULL, '0', '001-TYP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (190, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 77.31, 140, NULL, NULL, NULL, '0', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (191, '302-EXC-002', 'Excavación en zapatas  a cielo abierto en material tipo III-A,  de  0.00 a -2.00 m. con martillo hidráulico, incluye: mano de obra, equipo y herramienta.', 'M3', 0, 323.92, NULL, NULL, NULL, '0', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (192, '302-EXC-02-01', 'Relleno con producto de la excavacion_x000D_\n, (con retroexcavadora )compactado con bailarina al 95% proctor, adicionando agua, incluye: suministro de materiales, acarreos, mano de obra, maquinaria, equipo, herramienta y todo lo necesario para su rcorrecta ejecución.', 'M3', 50.46, 240.73, NULL, NULL, NULL, '27.21', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (193, '302-EXC-02-02', 'Relleno con material de banco, ( CON RETROEXCAVADORA ) compactado con bailarina al 95% proctor, adicionando agua, incluye: suministro de materiales, acarreos, mano de obra, maquinaria, equipo, herramienta y todo lo necesario para su rcorrecta ejecución.', 'M3', 0, 396.73, NULL, NULL, NULL, '27.21', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (194, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 5, 1925, NULL, NULL, NULL, '0', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (195, '302-EXC-04-001', 'FUMIGACION ANTITERMITA EN ZAPATAS Y FIRME, INCLUYE ; MATERIAL Y MANO DE OBRA', 'M2', 553.57, 17.17, NULL, NULL, NULL, '2.81', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (196, '302-CIM-03-302', 'Flete ida y vuelta de perforadora Watson 5000, incluye: montaje, desmontaje, equipo, mano de obra y herramienta.', 'FLETE', 1, 15500.8, NULL, NULL, NULL, '313.8', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (197, '302-CIM-03-181', 'Campana o ampliación de base de pilas, en material compacto, incluye: equipo, mano de obra y herramienta.', 'M3', 16.2449, 1954.81, NULL, NULL, NULL, '50.13', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (198, 'PILA 1', 'PILOTE DE CONCRETO DE 60 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/10 VA. DEL No. 4 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 268.5, 1803.07, NULL, NULL, NULL, '74.53', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (199, 'PILA 2', 'PILOTE DE CONCRETO DE 60 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/12 VA. DEL No. 5 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 110.5, 2154.64, NULL, NULL, NULL, '100.45', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (200, 'PILA 3', 'PILOTE DE CONCRETO DE 80 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/10 VA. DEL No. 4 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 66, 2481.77, NULL, NULL, NULL, '100.46', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (201, 'PILA 4', 'PILOTE DE CONCRETO DE 80 CMS DE DIAMETRO, FABRICADO EN OBRA, ARMADO C/12 VA. DEL No. 5 Y EST. DE VA. DEL No. 3 @ 20CMS., Y VACIADO C/ CONCRETO PREMEZCLADO F.C=250 KG/CM2; INCL: PERFORACIÓN, AFINE DE SUPERFICIE, ARMADO, ENTUBADO Y VACIADO.', 'ML', 44, 2781.91, NULL, NULL, NULL, '126.33', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (202, '302-PED-022', 'Columna de 0.4 x 0.4 m. de concreto premezclado F.c=250 kg/cm2, armado con 8 varillas # 5 , y 2 estribos # 3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado aparente, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'ML', 7.42, 3315.34, NULL, NULL, NULL, '260.01', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (203, '302-PED-024', 'Columna de 0.45 x 0.45 m. de concreto premezclado F.c=250 kg/cm2, armado con 8 varillas # 6 , y 2 estribos # 3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado aparente, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'ML', 3.71, 4023.16, NULL, NULL, NULL, '312.39', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (204, '302-TRA-001', 'Trabe de 20 x 40 6 vs 1/2 est #3 @20', 'ML', 150.97, 1326.79, NULL, NULL, NULL, '113.4', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (205, '302-TRA-003', 'Trabe de 20 x 55, 8 vs 1/2 est #3 @20', 'ML', 36.56, 1828.86, NULL, NULL, NULL, '155.55', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (206, '302-TRA-004', 'Trabe de 25 x 50, 6 vs 5/8 est #3 @20', 'ML', 12.25, 1867.43, NULL, NULL, NULL, '154.3', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (207, '302-TRA-005', 'Trabe de 25 x 55, 8 vs 5/8 est #3 @20', 'ML', 8.1, 2097.71, NULL, NULL, NULL, '173.91', '001-CIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (208, '304-ALBA-01', 'ALBAÑILERÍA GRAL.', 'LOTE', 1, 1, NULL, NULL, NULL, '1', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (209, '304-ALB-FIR-009', 'Firme de 12 cm acabado común, armado 3/8 @40 ambos lados, de concreto PREMEZCLADO F.c= 200  kg/cm2, incluye: suministro de materiales, acarreos, nivelación, cimbrado de fronteras, mano de obra, equipo y herramienta.', 'M2', 356.45, 638.59, NULL, NULL, NULL, '77.92', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (210, '304-ALB-02-201', 'Muro de 10 cm. de block de concreto de 10x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 7.31, 761.22, NULL, NULL, NULL, '69.25', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (211, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 735.73, 770.55, NULL, NULL, NULL, '70.59', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (212, '304-ALB-02-203', 'Muro de 20 cm. de block de concreto de 20x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 1, 902.08, NULL, NULL, NULL, '73.98', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (213, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 194.79, 1042.33, NULL, NULL, NULL, '117.13', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (214, '304-ALB-04-033-A', 'Castillo de 0.2 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 4 varillas del No. 4 , con estribos del No.2 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 41.75, 991.43, NULL, NULL, NULL, '128.1', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (215, '304-ALB-04-043-A', 'Castillo de 20x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 1/2\" y estribos del No.3 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 59.36, 358.53, NULL, NULL, NULL, '139.26', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (216, '304-ALB-04-054-B', 'Castillo de 0.3 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 4 , con estribos del No.3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 11.13, 1550.15, NULL, NULL, NULL, '192.08', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (217, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 1, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (218, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 8.1, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (219, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 8.3, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (220, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 26.62, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (221, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 309.33, 900, NULL, NULL, NULL, '120', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (222, '304-LOSA-02-001', 'ESCALERA de 1.2 de ancho', 'LOTE', 1, 17391.7, NULL, NULL, NULL, '1392.82', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (223, 'MC-A-02', 'Muro de contención de 4.8 m. de altura y 0.25 m. de espesor promedio, de concreto premezclado F.c=250 kg/cm2, armado con dos parrillas, una con varillas #5@10 cm. en sentido vertical y #4@20 cm. en sentido horizontal, la otra parilla #3@20 cm. en ambos sentidos, con zapata corrida de 2 x 0.35 m. de peralte promedio, armada en el sentido longitudinal con 0#4 en el lechos superior y 10#4 en el lecho inferior y en sentido transversal con varillas #6@20 cm. en lechos superior y #5@12 cm. en lecho inferior, Incluye: suministro de materiales, acarreos, cortes, traslapes, desperdicios, habilitado, plantilla, cimbrado acabado común, colado, vibrado, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'ML', 0, 18512.9, NULL, NULL, NULL, '1888.67', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (224, '304-ALB-02-201', 'Muro de 10 cm. de block de concreto de 10x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 28.8, 761.22, NULL, NULL, NULL, '69.25', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (225, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 434.24, 770.55, NULL, NULL, NULL, '70.59', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (226, '304-ALB-02-203', 'Muro de 20 cm. de block de concreto de 20x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común,  incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 1, 902.08, NULL, NULL, NULL, '73.98', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (227, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 154.36, 1042.33, NULL, NULL, NULL, '117.13', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (228, '304-ALB-04-033-A', 'Castillo de 0.2 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 4 varillas del No. 4 , con estribos del No.2 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 13.6, 991.43, NULL, NULL, NULL, '128.1', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (229, '304-ALB-04-043-A', 'Castillo de 20x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 1/2\" y estribos del No.3 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 57.8, 358.53, NULL, NULL, NULL, '139.26', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (230, '304-ALB-04-054-B', 'Castillo de 0.3 x 0.15 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 4 , con estribos del No.3 a cada 20 cm. Incluye: materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado , limpieza, mano de obra, equipo y herramienta.', 'M', 3.4, 1550.15, NULL, NULL, NULL, '192.08', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (231, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 1, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (232, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 2.54, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (233, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 14.28, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (234, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 27.27, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (235, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 293.2, 900, NULL, NULL, NULL, '120', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (236, '304-ALB-03-058-B', 'Cadena de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 500.01, 302.63, NULL, NULL, NULL, '105.63', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (237, '304-ALB-03-062-A', 'Cadena de 15x30 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con 4 varillas de 1/2\" y estribos del No.2 a cada 20 cm., incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 0, 1354.02, NULL, NULL, NULL, '96.83', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (238, '304-ALB-03-078-A', 'Cadena de 0.3 x 0.2 m. de concreto hecho en obra F.c=200 kg/cm2, armado con 6 varillas del No. 3 , con estribos del No.2 a cada 0.2 cm. Incluye: suministro de materiales, acarreos, elevaciones , cortes, traslapes, desperdicios, habilitado, cimbrado, acabado común, descimbrado, limpieza, mano de obra, equipo y herramienta.', 'M', 2.54, 1450.69, NULL, NULL, NULL, '141.63', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (239, '304-ALB-VIG-011', 'VIGA DE 15 X 60 armada con_x000D_\n2#5_x000D_\n2#3_x000D_\n3#5_x000D_\nest@20 de 3/8', 'ML', 14.28, 2131.4, NULL, NULL, NULL, '305.05', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (240, '304-ALB-VIG-012', 'VIGA 30 X 70 armada con_x000D_\n3 #6_x000D_\n2#3_x000D_\n6#8_x000D_\nest@20 de 3/8', 'ML', 27.27, 3927.16, NULL, NULL, NULL, '478.25', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (241, '304-LOSA-01-001', 'Losa de 20 cms. a base de vigueta y bovedilla SANTA CLARA , con viguetas colocadas a cada 75., con capa de compresion de 5 cms. de espesor , incluye: cimbrado, descimbrado, , bombeo, colado, vibrado, mano de obra, equipo y herramienta.', 'M2', 293.2, 900, NULL, NULL, NULL, '120', '001-ALB', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (242, '302-EXC-001', 'Excavación para zapatasy trabes con maquinaria  en terreno tipo ll.', 'M3', 80, 140, NULL, NULL, NULL, '0', '001-ALBE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (243, '302-EXC-03-001', 'Retiro de tierra producto de la excavacion camiones de 14 m3 inclye carga con retroexcavadora', 'VIAJE', 7, 1925, NULL, NULL, NULL, '0', '001-ALBE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (244, '305-ALBERC-01-A', 'ALBERCA TIPO DE 10.0X4.0X1.6 M.', 'LOTE', 1, 267000, NULL, NULL, NULL, '0', '001-ALBE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (245, '304-ALB-02-202', 'Muro de 15 cm. de block de concreto de 15x20x40 cm. asentado con mezcla cemento arena 1:4, acabado común, incluye: materiales, acarreos, mano de obra, equipo y herramienta.', 'M2', 90.12, 770.55, NULL, NULL, NULL, '70.59', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (246, '304-ALB-04-033-B', 'Castillo de 15x20 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armado con 4 varillas de 3/8\" y estribos del No.2 a cada 20 cm, incluye: materiales, acarreos, cortes, desperdicios, armado, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 31, 1042.33, NULL, NULL, NULL, '117.13', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (247, '304-ALB-03-046', 'Cadena de 15x15 cm. de concreto hecho en obra de F.c=200 kg/cm2, acabado común, armada con armex 15x15-4, incluye: materiales, acarreos, cortes, desperdicios, traslapes, amarres, cimbrado, coldado, descimbrado, mano de obra, equipo y herramienta.', 'M', 20, 672.19, NULL, NULL, NULL, '48.44', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (248, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 112.01, 946.69, NULL, NULL, NULL, '73.98', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (249, '304-ALB-10-141', 'Chaflan de 7 cm. de mezcla cemento-arena 1:5, incluye: materiales, acarreos, mano de obra, equipo y herramienta', 'M', 142.58, 183.52, NULL, NULL, NULL, '22.16', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (250, '304-ALB-10-202', 'EMPASTADO DE LOSA DE AZOTEA PARA DAR PENDIENTE   a base DE LIGHTSTONE FC=100 , incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 279.9, 463.03, NULL, NULL, NULL, '35.98', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (251, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 51.88, 383.06, NULL, NULL, NULL, '37.04', '001-TDE', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (252, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 19.15, 782.83, NULL, NULL, NULL, '60.53', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (253, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 214.4, 946.69, NULL, NULL, NULL, '73.98', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (254, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 0, 383.06, NULL, NULL, NULL, '37.04', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (255, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 0, 8633.6, NULL, NULL, NULL, '998.82', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (256, '304-APL-02-001', 'Yeso en muros  y cielos muestriado, con yeso-cemento,  incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 1424.47, 770.66, NULL, NULL, NULL, '60.06', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (257, '304-APL-02-002', 'Aplanado de yeso en plafond, con yeso-cemento,  incluye: materiales, mano de obra, equipo y herramienta.', 'M2', 1, 943.69, NULL, NULL, NULL, '74.33', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (258, '304-APL-02-003', 'Cajillo de yeso de 2 cms x 1.5 cms,  incluye: materiales, mano de obra, equipo y herramienta.', 'M', 0, 912.29, NULL, NULL, NULL, '60.06', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (259, '304-APL-02-004', 'Media caña de yeso en zoclo, incluye; material, mano de obra y limpieza', 'M', 253.81, 224.05, NULL, NULL, NULL, '23.65', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (260, '304-APL-02-005', 'Nicho de yeso en tomas de gas, refrigerador , incluye: material mano de obra y limpieza', 'PZA', 5, 1273.81, NULL, NULL, NULL, '156.18', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (261, '304-APL-02-006', 'Detalle de yeso en basucas incluye colocacion de malla', 'PZA', 7, 830.07, NULL, NULL, NULL, '156.18', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (262, '304-APL-03-001', 'Falso plafon de metal desplegado con canaleta 1 1/2 y 3/4 , incluye: material, mano de obra y herramienta', 'M2', 1, 1191.39, NULL, NULL, NULL, '90', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (263, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 270.61, 782.83, NULL, NULL, NULL, '60.53', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (264, '304-APL-01-002', 'ACABADO CARACOLEADO DELGADO sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 1, 366.18, NULL, NULL, NULL, '27.78', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (265, '304-APL-01-003', 'Zarpeo y afine  sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 891.14, 946.69, NULL, NULL, NULL, '73.98', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (266, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'M2', 66.65, 383.06, NULL, NULL, NULL, '37.04', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (267, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 0, 8633.6, NULL, NULL, NULL, '998.82', '001-APL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (268, '304-IMPER-001', 'Impermeabilizante a base de membrana termofusionada de 3.5 mm con gravilla color gris', 'M2', 331.78, 125, NULL, NULL, NULL, '0', '001-AMP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (269, '304-IMPER-002', 'Goteron metalico', 'ML', 36.78, 60, NULL, NULL, NULL, '0', '001-AMP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (270, '304-IMPER-010', 'Mmbrana delta; suministro e instalacion', 'M2', 0, 176.03, NULL, NULL, NULL, '13.32', '001-AMP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (271, '304-IMPER-003', 'Impermeabilizante a base de vitume 100', 'M2', 0, 133.87, NULL, NULL, NULL, '13.32', '001-AMP', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (272, '306-PIS-A1-001', 'PISO ( TOPE 330 )  formato mediano  asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 375.94, 969.1, NULL, NULL, NULL, '104.08', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (273, '306-PIS-A1-002', 'PISO ( TOPE 250 ) formato mediano asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 133.11, 916.1, NULL, NULL, NULL, '104.08', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (274, '306-PIS-A1-004', 'AZULEJO  ( TOPE 300 )  formato mediano  asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'M2', 135.64, 969.1, NULL, NULL, NULL, '104.08', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (275, '306-PIS-A1-003', 'Piso y/o Azulejo ( tope 250 ) en servico y lavanderia asentado con adesivo crest o similar incluye: material,mano de obra, desperdicio, corte y herramienta', 'LOTE', 1, 916.1, NULL, NULL, NULL, '104.08', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (276, '306-PIS-A1-005', 'Lote de escalera con PISO ( TOPE 330 ) formato mediano asentado con adhesivo crest o similar incluye; material,mano de obra, desperdicio, cortes y herramiuenta', 'ML', 1, 18112.2, NULL, NULL, NULL, '2231.03', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (277, '306-PIS-A1-006', 'Zoclo de 8 cm. PISO ( TOPE 330 )  según muestra aprobada en obra,asentada con cemento crest, incluye: suministro de materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta', 'ML', 268.22, 198.9, NULL, NULL, NULL, '30.05', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (278, '306-PIS-A1-007', 'Zoclo de 8 cm. PISO ( TOPE 250 )  según muestra aprobada en obra,asentada con cemento crest, incluye: suministro de materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta', 'PZA', 61.73, 193.9, NULL, NULL, NULL, '30.05', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (279, '306-PIS-A1-008', 'Nicho en regadera y/o  lavanderia ( tope 330 ) incluye;material, demoler para nicho, mano de obra y herramienta', 'ML', 4, 2038.81, NULL, NULL, NULL, '354.93', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (280, '306-PIS-A1-009', 'Pollo en regadera ( tope 330 )  incluye ; material, vaciado de pollo, mano de obra y herramienta', 'PZA', 6, 1559.13, NULL, NULL, NULL, '261.87', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (281, '306-PIS-A1-010', 'Pileta en general  ( tope 330 ) incluye; zarpeo, material, , mano de obra y herramienta', 'ML', 3, 2810.62, NULL, NULL, NULL, '390.44', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (282, '306-PIS-A1-011', 'Pollo en cocina  ( tope 330 )  mas vaciado de concreto incluye ; material, vaciado de pollo, mano de obra y herramienta', 'M2', 9.5, 1374.58, NULL, NULL, NULL, '233.33', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (283, '304-APL-01-001', 'Zarpeo sobre muros, con mezcla cemento arena en proporción de 1:4, incluye: suministro de materiales, acarreos, andamios, limpieza, mano de obra, equipo y herramienta.', 'M2', 135.64, 782.83, NULL, NULL, NULL, '60.53', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (284, '304-ALB-10-201', 'EMPASTADO de 4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'LOTE', 509.05, 383.06, NULL, NULL, NULL, '37.04', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (285, '304-ALB-10-204', 'EMPASTADO DE ESCALERA  4 cm. de espesor a base de mezcla cemento-arena en proporción 1:5, incluye: trazo, nivelacion, suministro de materiales, acarreos, elevación, mano de obra, equipo y herramienta.', 'ML', 1, 8633.6, NULL, NULL, NULL, '998.82', '001-PYA', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (286, '306-MYG-B1-001', 'Labavos marmol o granito TIPO    ( morita,ubatuva,santo tomas ,crema marfil )', 'M2', 9.05, 3500, NULL, NULL, NULL, '0', '001-MYG', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (287, '306-MYG-03-001', 'Mármol ( TIPO 1  l clásico de 2 cm de espesor, acabado pulido y brillado según despiece de proyecto en pisos, asentado con mortero cemento arena 1:4, incluye: materiales, acarreos, cortes, desperdicios, mano de obra, equipo y herramienta.', 'ML', 0, 3595.58, NULL, NULL, NULL, '350', '001-MYG', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (288, '306-MYG-03-001-1', 'ZOCLO DE MARMOL', 'M2', 0, 1589.8, NULL, NULL, NULL, '185', '001-MYG', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (289, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'ML', 16.81, 580, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (290, '306-CPT-A1-002B', 'Suministro e instalacion de TAPAS de cantera  ( blanca huichapan,cafe, negra ) INTERIOR', 'M2', 6.97, 380, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (291, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 102.66, 580, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (292, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 20.21, 580, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (293, '306-CPT-A1-001', 'Suministro e instalacion de cantera  ( blanca huichapan,cafe, negra ) EN INTERIOR', 'M2', 0, 580, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (294, '306-CPT-B1-001', 'Suministro e instalacion de rajuela', 'M2', 1, 950, NULL, NULL, NULL, '0', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (295, '306-CPT-B2-001', 'PIedra de la huasteca, incluye; material, mano de obra y herramienta', 'ML', 66.65, 1016.23, NULL, NULL, NULL, '115', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (296, '306-CPT-B2-002', 'Zoclo de piedra de la huasteca', 'PZA', 18.69, 810.69, NULL, NULL, NULL, '100', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (297, '306-CPT-B2-003', 'Escalon de piedra dela huasteca', 'M2', 0, 1254.82, NULL, NULL, NULL, '150', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (298, '306-CPT-C1-001', 'Teja mextail pizzarra, incluye: trazo, materiales, acareos, cortes, desperdicios, mano de obra, equipo y herramienta.', 'M2', 0, 598.72, NULL, NULL, NULL, '65', '001-CPT', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (299, '306-PIN-01-001', 'Pintura vinilica en muros interiores marca Berel-berelinte  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'M2', 1424.47, 245.91, NULL, NULL, NULL, '18.77', '001-PIN', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (300, '306-PIN-01-002', 'Pintura vinilica en muros exteriores marca Berel-berelinte  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'M2', 891.14, 246.7, NULL, NULL, NULL, '18.77', '001-PIN', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (301, '306-PIN-01-003', 'Pintura satinada en muros exteriores rustico marca Berel-berelex o similar  a dos manos, incluye: aplicación de sellador, materiales, preparación de la superficie, mano de obra, equipo, herramienta y andamios.', 'PZA', 0, 250.51, NULL, NULL, NULL, '18.77', '001-PIN', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (302, '306-PIN-01-010', 'Pintura acrilica suma en marco metalico', 'PZA', 6, 1406.92, NULL, NULL, NULL, '112.47', '001-PIN', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (303, '307-HER-A1-001', 'PUERTA PRINCIPAL (TOPE 30,000) DE FIERO', 'PZA', 1, 25000, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (304, '307-HER-A1-002', 'PUERTA SECUNDARIA DE FIERRO           ( TOPE 8000 )', 'PZA', 0, 8000, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (305, '307-HER-A2-001', 'Puerta pasillo luber ( tope 6000 )', 'PZA', 1, 6000, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (306, '307-HER-A3-001', 'REJIULLA PLUBVIAL MARCO Y CONTRA DE .20 X 1.00', 'PZA', 2, 950, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (307, '307-HER-A4-001', 'TAPA MARCO Y CONTRAMARCO 60 X 60', 'PZA', 1, 750, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (308, '307-HER-A6-001', 'GARGOLA TIPO 4 X 4', 'PZA', 1, 200, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (309, '307-HER-A7-001', 'BASE PARA CAMPANA DE COCINA', 'PZA', 0, 900, NULL, NULL, NULL, '0', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (310, '307-HER-A9-001', 'MARCO METALICO  PARA PUERTA', 'LOTE', 6, 1233.55, NULL, NULL, NULL, '166.48', '001-HER', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (311, '308-ALU-A1-001', 'Lote de ventanas ( casa tipo 700 m2 ) en colorhueso o bca, linia eurovent en serie 70 y 100 segun claro con cristal tintex 6mm duovent solo recamaras', 'PZA', 1, 212750, NULL, NULL, NULL, '0', '001-ALU', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (312, '310-CAR-A1-001', 'Puedrta de encino enchapada sobre MDF en 6mm con cama de mdf de 3mm con 5 ranuras de 1/8,sin relleno, marco de encino,chambrana de encino 2 caras , pintada e instalada incluye; visagras', 'PZA', 13, 6600, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (313, '310-CAR-A1-002', 'Puedrta corrediza de encino enchapada sobre MDF en 6mm con cama de mdf de 3mm con 5 ranuras de 1/8,sin relleno, marco de encino,chambrana de encino 2 caras , pintada e instalada incluye; visagras y riel cooredizo', 'PZA', 0, 8530, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (314, '310-CAR-A1-003', 'Puerta multipanel lisa', 'M2', 6, 1950, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (315, '310-CAR-A3-002', 'DUELA DE INGENIERÍA Mca. GOOD MASTER o similar; suministro e instalación directa al firme; incluye pegamento.', 'ML', 0, 922.2, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (316, '310-CAR-A3-003', 'ZOCLO DE ENCINO DE 8 CMS', 'LOTE', 0, 220.04, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (317, '310-CAR-A4-001', 'Escalera de encino ( escalera tipo )solo huellas', 'PZA', 1, 16500, NULL, NULL, NULL, '0', '001-CAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (318, '311-ACB-A1-001C', 'Llave mezcladora y regaderta,modelo ............... ( tope 2500 )', '', 6, 3169.89, NULL, NULL, NULL, '187.25', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (319, '311-ACB-A1-002', 'Llave mezcladora y regaderta economica ,modelo ............... ', 'PZA', 1, 1769.89, NULL, NULL, NULL, '187.25', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (320, '311-ACB-A1-003', 'Llave mezcladora para lavabo modelo .............. ( tope 2500 )', 'PZA', 4, 3169.89, NULL, NULL, NULL, '187.25', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (321, '311-ACB-A1-004', 'Llave mezcladora economica para lavabo modelo .............. ( tope 800 )', 'PZA', 1, 1769.89, NULL, NULL, NULL, '187.25', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (322, '311-ACB-A1-005', 'resumidero marca elvex modelo.....', 'PZA', 9, 862.95, NULL, NULL, NULL, '93.63', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (323, '311-ACB-A1-006', 'Resumidero economico rugo', 'PZA', 7, 616.03, NULL, NULL, NULL, '93.63', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (324, '311-MB-01-001', 'Sanitario  TOPE 3000 , incluye: suministro de materiales, instalación, mano de obra, equipo y herramienta.', 'PZA', 1, 4017.48, NULL, NULL, NULL, '249.63', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (325, '311-MB-01-002', 'Sanitario y lavabo economico  modelo........... , incluye: suministro de materiales, instalación, mano de obra, equipo y herramienta.', 'PZA', 1, 3661.8, NULL, NULL, NULL, '374.51', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (326, '311-MB-01-003', 'Ovalin studio para placas de marmol', 'LOTE', 6, 1427, NULL, NULL, NULL, '0', '001-MDB', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (327, '314-PLO-001', 'CASA TIPO A_x000D_\nINSTALACIONES HIDROSANITARIAS_x000D_\nINCLUYE; DRENAJE SANITARIO, DRENAJE PLUVIAL, DRENAJE MINIESPLIT,RED DE AGUA FRIA Y CALIENTE TUBO PLUS, RED DE GAS EN COBRE,TUBO LAGRIMERO  ( SUMINISTRO E INSTALACION)', 'LOTE', 67800, 396283, NULL, NULL, NULL, '67800', '001-IHS', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (328, '315-ELE-001', 'CASA TIPO A_x000D_\nLOTE DE MANGUERAS Y CAJAS_x000D_\nLOTE DE CABLEADO_x000D_\nLOTE DE TAPAS Y CONTACTOS_x000D_\nLOTE DE LAMPARAS_x000D_\nLOTE GABINETES METALICOS_x000D_\nLOTE CABLEADO PRINCIPAL_x000D_\nLOTE DE INTER Y CENTROS DE CARGA', 'LOTE', 82500, 548935, NULL, NULL, NULL, '82500', '001-IEL', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (329, '319-DUC-01-001', 'Lote de ductode inyecion y retorno a pleno ( SALA COMEDOR ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'LOTE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (330, '319-DUC-01-002', 'Lote de ductode inyecion y retorno a pleno ( COCINA Y FAMILI  ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'LOTE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (331, '319-DUC-01-003', 'Lote de ductode inyecion y retorno a pleno ( RECAMARA PRINCIPAL  ), fabricado en lamina calibre 24, foil de aluminio de 1.5 pulgada , incluye; material, rejilla , soporte y mano de obra.', 'VIAJE', 0, 18000, NULL, NULL, NULL, '0', '001-DYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (332, '326-LIM-00-001', 'Acarreo de material y escombro fuera de la obra en camiones de 14 m3 durante la obra', 'M2', 18, 1760, NULL, NULL, NULL, '0', '001-LIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (333, '326-LIM-01-001', 'Limpieza gruesa durante la obra, incluye: mano de obra, equipo y herramienta.', 'M2', 605.73, 56.77, NULL, NULL, NULL, '6.81', '001-LIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (334, '326-LIM-01-002', 'Limpieza fina de la obra para entrega, incluye: materiales, mano de obra, equipo y herramienta.', 'M3', 605.73, 93.66, NULL, NULL, NULL, '11.72', '001-LIM', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (335, '327-JAR-01-000', 'Tierra NEGRA  para jardinería, incluye: suministro, acarreo, colocación, mano de obra, equipo y herramienta.', 'M3', 0, 608.43, NULL, NULL, NULL, '54.43', '001-JAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (336, '327-JAR-01-001', 'Tierra vegetal preparada para jardinería, incluye: suministro, acarreo, colocación, mano de obra, equipo y herramienta.', 'LOTE', 7, 557.35, NULL, NULL, NULL, '77.76', '001-JAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (337, '327-JAR-01-011', 'LOTE DE PLANTAS Y PALMAS CASA A', 'M2', 1, 11543.7, NULL, NULL, NULL, '780.88', '001-JAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (338, '327-JAR-01-017', 'Pasto , incluye: acarreos, plantación, mano de obra, equipo y herramienta.', 'LOTE', 38.14, 157.35, NULL, NULL, NULL, '22.65', '001-JAR', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (339, '301-ADM-001', 'GASTOS ADMINISTRATIVOS POR EL DESARROLLO DE LA OBRA', 'LOTE', 300000, 30, NULL, NULL, NULL, '24', '001-AYC', 2, 1, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (340, '301-ADM-005', 'PAGO POR VENTA DE PROYECTO _x000D_\nCOMISION DE VENTA', 'LOTE', 1, 345, NULL, NULL, NULL, '130', '001-AYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (341, '301-ADM-006', 'CUOTAS AL IMSS DURANTE LA CONSTRUCCION', 'LOTE', 597.6, 464.78, NULL, NULL, NULL, '343.3', '001-AYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (342, '301-ADM-007', 'BONIFICACION ARQ RESPONSABLE', 'LOTE', 0.4, 50000, NULL, NULL, NULL, '434.23', '001-AYC', 2, 0, 0, 0, 0, 0);
INSERT INTO `conceptos` VALUES (343, 'concepto', 'prueba de importador', 'M', 100, 100, NULL, NULL, NULL, '200', '001-PRU', 10, 0, NULL, NULL, NULL, NULL);
INSERT INTO `conceptos` VALUES (344, '121', '12121', '12121', 2121, 21, NULL, NULL, NULL, '21', '21', 21, 2, NULL, NULL, NULL, NULL);
INSERT INTO `conceptos` VALUES (345, '', 'Ejemplo 1', '2', 0, 0, NULL, NULL, NULL, '0', '', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `conceptos` VALUES (346, '', 'Ejemplo 1', '2', 0, 0, NULL, NULL, NULL, '0', '', 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for conceptos_areas
-- ----------------------------
DROP TABLE IF EXISTS `conceptos_areas`;
CREATE TABLE `conceptos_areas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_concepto` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_area` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conceptos_areas
-- ----------------------------
INSERT INTO `conceptos_areas` VALUES (1, '304-ALBA-01', 1);
INSERT INTO `conceptos_areas` VALUES (2, '301-ADM-001', 1);
INSERT INTO `conceptos_areas` VALUES (3, '301-ADM-001', 3);
INSERT INTO `conceptos_areas` VALUES (4, '301-ADM-001', 26);

-- ----------------------------
-- Table structure for conceptos_contrato
-- ----------------------------
DROP TABLE IF EXISTS `conceptos_contrato`;
CREATE TABLE `conceptos_contrato`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cantidad_tope` float NULL DEFAULT NULL,
  `cantidad_contrato` float NULL DEFAULT NULL,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conceptos_contrato
-- ----------------------------
INSERT INTO `conceptos_contrato` VALUES (1, '301-ADM-001', 300000, 400, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (2, '301-ADM-005', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (3, '301-ADM-006', 597.6, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (4, '301-ADM-007', 0.4, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (5, '304-ALBA-01', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (6, '304-ALB-FIR-009', 356.45, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (7, '304-ALB-02-201', 7.31, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (8, '304-ALB-02-202', 735.73, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (9, '304-ALB-02-203', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (10, '304-ALB-04-033-B', 194.79, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (11, '304-ALB-04-033-A', 41.75, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (12, '304-ALB-04-043-A', 59.36, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (13, '304-ALB-04-054-B', 11.13, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (14, '304-ALB-03-062-A', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (15, '304-ALB-03-078-A', 8.1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (16, '304-ALB-VIG-011', 8.3, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (17, '304-ALB-VIG-012', 26.62, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (18, '304-LOSA-01-001', 309.33, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (19, '304-LOSA-02-001', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (20, 'MC-A-02', 0, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (21, '304-ALB-02-201', 28.8, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (22, '304-ALB-02-202', 434.24, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (23, '304-ALB-02-203', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (24, '304-ALB-04-033-B', 154.36, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (25, '304-ALB-04-033-A', 13.6, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (26, '304-ALB-04-043-A', 57.8, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (27, '304-ALB-04-054-B', 3.4, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (28, '304-ALB-03-062-A', 1, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (29, '304-ALB-03-078-A', 2.54, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (30, '304-ALB-VIG-011', 14.28, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (31, '304-ALB-VIG-012', 27.27, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (32, '304-LOSA-01-001', 293.2, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (33, '304-ALB-03-058-B', 500.01, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (34, '304-ALB-03-062-A', 0, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (35, '304-ALB-03-078-A', 2.54, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (36, '304-ALB-VIG-011', 14.28, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (37, '304-ALB-VIG-012', 27.27, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (38, '304-LOSA-01-001', 293.2, 0, 1, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (39, '301-ADM-001', 300000, 10100, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (40, '301-ADM-005', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (41, '301-ADM-006', 597.6, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (42, '301-ADM-007', 0.4, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (43, '304-ALBA-01', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (44, '304-ALB-FIR-009', 356.45, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (45, '304-ALB-02-201', 7.31, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (46, '304-ALB-02-202', 735.73, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (47, '304-ALB-02-203', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (48, '304-ALB-04-033-B', 194.79, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (49, '304-ALB-04-033-A', 41.75, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (50, '304-ALB-04-043-A', 59.36, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (51, '304-ALB-04-054-B', 11.13, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (52, '304-ALB-03-062-A', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (53, '304-ALB-03-078-A', 8.1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (54, '304-ALB-VIG-011', 8.3, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (55, '304-ALB-VIG-012', 26.62, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (56, '304-LOSA-01-001', 309.33, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (57, '304-LOSA-02-001', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (58, 'MC-A-02', 0, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (59, '304-ALB-02-201', 28.8, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (60, '304-ALB-02-202', 434.24, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (61, '304-ALB-02-203', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (62, '304-ALB-04-033-B', 154.36, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (63, '304-ALB-04-033-A', 13.6, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (64, '304-ALB-04-043-A', 57.8, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (65, '304-ALB-04-054-B', 3.4, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (66, '304-ALB-03-062-A', 1, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (67, '304-ALB-03-078-A', 2.54, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (68, '304-ALB-VIG-011', 14.28, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (69, '304-ALB-VIG-012', 27.27, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (70, '304-LOSA-01-001', 293.2, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (71, '304-ALB-03-058-B', 500.01, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (72, '304-ALB-03-062-A', 0, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (73, '304-ALB-03-078-A', 2.54, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (74, '304-ALB-VIG-011', 14.28, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (75, '304-ALB-VIG-012', 27.27, 0, 2, NULL, NULL);
INSERT INTO `conceptos_contrato` VALUES (76, '304-LOSA-01-001', 293.2, 0, 2, NULL, NULL);

-- ----------------------------
-- Table structure for contratistas
-- ----------------------------
DROP TABLE IF EXISTS `contratistas`;
CREATE TABLE `contratistas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `persona_moral` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `razon_social` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_paterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_materno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_proveedor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_moneda` int(11) NOT NULL,
  `rfc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario_modifica` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `id_familia` int(11) NULL DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contratistas
-- ----------------------------
INSERT INTO `contratistas` VALUES (1, 'JRAMIREZ', 'Juan Francisco Ramirez', 'Juan Francisco Ramirez', 'Juan Francisco', 'Ramirez', 'Martinez', '1', 1, '23243', '', 'admin', '2018-10-10', 85, 1);

-- ----------------------------
-- Table structure for contratistas_familias
-- ----------------------------
DROP TABLE IF EXISTS `contratistas_familias`;
CREATE TABLE `contratistas_familias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contratista` int(255) NULL DEFAULT NULL,
  `id_familia` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contratistas_familias
-- ----------------------------
INSERT INTO `contratistas_familias` VALUES (1, 1, 85);
INSERT INTO `contratistas_familias` VALUES (2, 1, 57);

-- ----------------------------
-- Table structure for contratos
-- ----------------------------
DROP TABLE IF EXISTS `contratos`;
CREATE TABLE `contratos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contratista` int(11) NULL DEFAULT NULL,
  `residente` int(11) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `usuario` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT 'relacionar con la tabla estatus_contratos',
  `tipo_contrato` int(11) NULL DEFAULT NULL COMMENT 'tipo 1 = contrato de mano de obra, tipo 2 = subcontrato',
  `monto_anticipo` float(11, 2) NULL DEFAULT NULL,
  `monto_fondo_garantia` float(11, 2) NULL DEFAULT NULL,
  `monto_iva` float(11, 2) NULL DEFAULT NULL,
  `total_a` float(11, 2) NULL DEFAULT 0.00,
  `total_b` float(11, 2) NULL DEFAULT 0.00,
  `total_c` float(11, 2) NULL DEFAULT 0.00,
  `total_d` float(11, 2) NULL DEFAULT 0.00,
  `total_e` float(11, 2) NULL DEFAULT NULL,
  `monto_pendiente` float(11, 2) NULL DEFAULT NULL,
  `total_contrato` float(11, 2) NULL DEFAULT 0.00,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IdUserRegistro` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `familia` int(255) NULL DEFAULT NULL,
  `total_contrato_impuestos` float(11, 2) NULL DEFAULT NULL,
  `seleccionado` int(11) NOT NULL DEFAULT 0 COMMENT '0=creado, 1=verificado',
  `consecutivo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contratos
-- ----------------------------
INSERT INTO `contratos` VALUES (1, '1', 1, 4, '2019-01-06', 'Ejemplo 1', NULL, 4, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2019-01-06', 'msilva', 'msilva', NULL, 0.00, 0, 1);
INSERT INTO `contratos` VALUES (2, '1', 1, 4, '2019-01-08', 'Contrato Amorada', NULL, 1, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2019-01-08', 'msilva', 'msilva', NULL, 0.00, 0, 0);

-- ----------------------------
-- Table structure for cuartos_generador
-- ----------------------------
DROP TABLE IF EXISTS `cuartos_generador`;
CREATE TABLE `cuartos_generador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_area` int(11) NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cuartos_generador
-- ----------------------------
INSERT INTO `cuartos_generador` VALUES (1, 'ESTANCIA FAMILIAR', 5, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (2, 'DISTRIBUIDOR', 5, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (3, 'BLANCOS', 5, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (4, 'RECÁMARA PPAL.', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (5, 'VESTIDOR', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (6, 'VESTÍBULO DE BAÑO', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (7, 'SANITARIO ', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (8, 'REGADERA ', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (9, 'TERRAZA /BALCÓN ', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (10, 'RECÁMARA 1', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (11, 'VESTIDOR', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (12, 'VESTÍBULO  BAÑO', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (13, 'SANITARIO ', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (14, 'REGADERA ', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (15, 'RECÁMARA 2 ', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (16, 'VESTIDOR ', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (17, 'VESTÍBULO  BAÑO', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (18, 'SANITARIO ', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (19, 'REGADERA ', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (20, 'RECÁMARA 3', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (21, 'VESTIDOR Y VESTÍBULO  BAÑO', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (22, 'REGADERA ', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (23, 'SANITARIO ', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (24, 'RECIBIDOR /DISTRIBUIDOR', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (25, 'SALA COMEDOR ', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (26, 'ALACENA', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (27, 'COCINA /FAMILY ROOM', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (28, 'TERRAZA DE COCINA', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (29, 'BAÑO DE VISITAS PPAL.', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (30, 'ESTUDIO Y/O REC. VISITAS', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (31, 'VESTIDOR Y VESTÍBULO  BAÑO', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (32, 'SANITARIO', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (33, 'REGADERA ', 1, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (34, 'COCHERA ', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (35, 'PÓRTICO', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (36, 'LAVANDERÍA ', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (37, 'PATIO SERV. /TRIQUES', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (38, 'CUARTO DE SERVICIO ', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (39, 'BAÑO DE SERVICIO ', 6, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (40, 'HOME TEATHER /CTO. JUEGOS ', 7, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (41, 'VESTÍBULO ', 7, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (42, 'BAÑO DE VISITAS SÓTANO', 7, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (43, 'REGADERA ', 7, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (44, 'TERRAZA TECHADA ', 8, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (45, 'TRIQUES /BAJO ESCALERA', 8, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (46, 'BAÑO DE TERRAZA', 8, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (47, 'ESCALERAS ', 8, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (48, 'MURO DE SANITARIO', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (49, 'MUROS DE REGADERA ', 9, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (50, 'MURO DE SANITARIO', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (51, 'MUROS DE REGADERA ', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (52, 'MURO DE SANITARIO', 3, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (53, 'MUROS DE REGADERA ', 2, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (54, 'MURO DE SANITARIO', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (55, 'MUROS DE REGADERA ', 4, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (56, 'MURO DE BAÑO ', 13, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (57, 'MURO ', 14, NULL, NULL);
INSERT INTO `cuartos_generador` VALUES (58, 'MUROS DE REGADERA', 15, NULL, NULL);

-- ----------------------------
-- Table structure for detalle_contratos
-- ----------------------------
DROP TABLE IF EXISTS `detalle_contratos`;
CREATE TABLE `detalle_contratos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `concepto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cantidad` float NULL DEFAULT NULL,
  `importe_renglon` float NULL DEFAULT NULL,
  `costo_actual` float NULL DEFAULT NULL,
  `tipo_concepto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `clave_contrato` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_modificacion` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estatus` int(11) NULL DEFAULT 4,
  `comentarios` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `costo_tope` float(255, 0) NULL DEFAULT NULL,
  `marcado` int(11) NOT NULL DEFAULT 0 COMMENT '1=marcado, 0=desactivado',
  `consecutivo` int(11) NULL DEFAULT NULL,
  `consecutivo_contrato` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_contratos
-- ----------------------------
INSERT INTO `detalle_contratos` VALUES (1, 1, '7', 0, 0, 0, 'A', NULL, '2019-01-06', NULL, 4, NULL, 0, 0, 1, 1);
INSERT INTO `detalle_contratos` VALUES (2, 1, '8', 0, 0, 0, 'A', NULL, '2019-01-06', NULL, 4, NULL, 1, 0, 1, 2);
INSERT INTO `detalle_contratos` VALUES (3, 1, '9', 0, 0, 0, 'A', NULL, '2019-01-06', NULL, 4, NULL, 0, 0, 1, 3);
INSERT INTO `detalle_contratos` VALUES (4, 1, '10', 0, 0, 0, 'A', NULL, '2019-01-06', NULL, 4, NULL, 4, 0, 1, 4);

-- ----------------------------
-- Table structure for detalle_estimaciones
-- ----------------------------
DROP TABLE IF EXISTS `detalle_estimaciones`;
CREATE TABLE `detalle_estimaciones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estimacion` int(255) NULL DEFAULT NULL,
  `id_detalle_contrato` int(255) NULL DEFAULT NULL,
  `estimado` float(255, 2) NULL DEFAULT NULL COMMENT 'este valor es la suma de todas las estimaciones existentes',
  `pendiente_estimar` float(255, 2) NULL DEFAULT NULL COMMENT 'este valor se calcula restando lo estimado menos el tope',
  `cantidad` float(255, 2) NULL DEFAULT NULL COMMENT 'Valor estimado en esta estimacion',
  `importe_renglon` float(255, 2) NULL DEFAULT NULL COMMENT 'costo establecido en la tabla conceptos multiplicado por la cantidad estimada',
  `costo` float(255, 2) NULL DEFAULT NULL COMMENT 'se consulta el mas bajo, se guarda para la multiplicacion',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for detalle_perfil
-- ----------------------------
DROP TABLE IF EXISTS `detalle_perfil`;
CREATE TABLE `detalle_perfil`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of detalle_perfil
-- ----------------------------
INSERT INTO `detalle_perfil` VALUES (1, 1, 1, '2018-09-13', '00:00:08', 1, 1);
INSERT INTO `detalle_perfil` VALUES (2, 1, 2, '2018-09-13', '00:00:11', 1, 1);
INSERT INTO `detalle_perfil` VALUES (51, 1, 21, '0000-00-00', '00:00:00', 1, 1);
INSERT INTO `detalle_perfil` VALUES (4, 1, 4, '2018-09-14', '00:00:10', 1, 1);
INSERT INTO `detalle_perfil` VALUES (5, 1, 5, '2018-09-14', '00:00:12', 1, 1);
INSERT INTO `detalle_perfil` VALUES (6, 1, 9, '2018-09-15', '13:25:29', 1, 1);
INSERT INTO `detalle_perfil` VALUES (7, 1, 6, '2018-09-20', '15:58:35', 1, 1);
INSERT INTO `detalle_perfil` VALUES (8, 1, 7, '2018-09-20', '16:19:58', 1, 1);
INSERT INTO `detalle_perfil` VALUES (9, 1, 8, '2018-09-20', '00:00:00', 1, 1);
INSERT INTO `detalle_perfil` VALUES (10, 1, 10, '2018-09-20', '17:28:14', 1, 1);
INSERT INTO `detalle_perfil` VALUES (49, 1, 19, '2018-11-21', '06:29:40', 1, 1);
INSERT INTO `detalle_perfil` VALUES (48, 3, 16, '2018-11-17', '03:38:35', 1, 2);
INSERT INTO `detalle_perfil` VALUES (47, 3, 9, '2018-11-17', '03:38:35', 1, 2);
INSERT INTO `detalle_perfil` VALUES (46, 3, 1, '2018-11-17', '03:38:35', 1, 2);
INSERT INTO `detalle_perfil` VALUES (45, 3, 2, '2018-11-17', '03:38:35', 1, 2);
INSERT INTO `detalle_perfil` VALUES (43, 5, 2, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_perfil` VALUES (42, 5, 18, '2018-11-12', '05:47:25', 1, 1);
INSERT INTO `detalle_perfil` VALUES (41, 5, 17, '2018-11-12', '05:47:25', 1, 1);
INSERT INTO `detalle_perfil` VALUES (40, 1, 18, '2018-11-12', '04:02:44', 1, 1);
INSERT INTO `detalle_perfil` VALUES (39, 1, 17, '2018-11-01', '03:36:53', 1, 1);
INSERT INTO `detalle_perfil` VALUES (38, 1, 16, '2018-10-25', '06:15:34', 1, 1);
INSERT INTO `detalle_perfil` VALUES (37, 1, 15, '2018-10-22', '05:14:41', 1, 1);
INSERT INTO `detalle_perfil` VALUES (36, 1, 14, '2018-10-17', '04:49:22', 1, 1);
INSERT INTO `detalle_perfil` VALUES (35, 1, 13, '2018-10-16', '05:13:13', 1, 1);
INSERT INTO `detalle_perfil` VALUES (34, 1, 12, '2018-10-09', '05:39:13', 1, 1);
INSERT INTO `detalle_perfil` VALUES (33, 1, 11, '2018-09-25', '04:34:11', 1, 5);
INSERT INTO `detalle_perfil` VALUES (32, 9, 4, '2018-09-22', '03:06:10', 1, 1);
INSERT INTO `detalle_perfil` VALUES (31, 9, 2, '2018-09-22', '03:06:10', 1, 1);
INSERT INTO `detalle_perfil` VALUES (50, 1, 20, '2018-12-18', '12:03:18', 1, 1);
INSERT INTO `detalle_perfil` VALUES (55, 1, 23, '2018-12-19', '03:25:32', 1, 0);
INSERT INTO `detalle_perfil` VALUES (53, 1, 2, '2018-12-18', '01:15:53', 1, 0);
INSERT INTO `detalle_perfil` VALUES (54, 1, 22, '2018-12-18', '01:15:53', 1, 0);
INSERT INTO `detalle_perfil` VALUES (56, 1, 2, '2018-12-19', '03:26:14', 1, 0);
INSERT INTO `detalle_perfil` VALUES (57, 1, 23, '2018-12-19', '03:26:14', 1, 0);
INSERT INTO `detalle_perfil` VALUES (58, 1, 24, '2018-12-19', '03:37:18', 1, 0);
INSERT INTO `detalle_perfil` VALUES (59, 1, 25, '2018-12-19', '03:38:41', 1, 0);
INSERT INTO `detalle_perfil` VALUES (60, 1, 26, '2018-12-19', '03:40:11', 1, 0);
INSERT INTO `detalle_perfil` VALUES (61, 1, 27, '2018-12-19', '03:43:41', 1, 0);
INSERT INTO `detalle_perfil` VALUES (62, 1, 28, '2018-12-19', '03:45:27', 1, 0);
INSERT INTO `detalle_perfil` VALUES (63, 3, 2, '2018-12-21', '11:23:47', 1, 0);
INSERT INTO `detalle_perfil` VALUES (64, 3, 21, '2018-12-21', '11:23:47', 1, 0);
INSERT INTO `detalle_perfil` VALUES (65, 3, 20, '2018-12-21', '11:23:47', 1, 0);
INSERT INTO `detalle_perfil` VALUES (66, 3, 2, '2018-12-21', '11:23:55', 1, 0);
INSERT INTO `detalle_perfil` VALUES (67, 3, 21, '2018-12-21', '11:23:55', 1, 0);
INSERT INTO `detalle_perfil` VALUES (68, 3, 20, '2018-12-21', '11:23:55', 1, 0);
INSERT INTO `detalle_perfil` VALUES (69, 3, 2, '2018-12-21', '11:24:33', 1, 0);
INSERT INTO `detalle_perfil` VALUES (70, 3, 20, '2018-12-21', '11:24:33', 1, 0);
INSERT INTO `detalle_perfil` VALUES (71, 3, 2, '2018-12-21', '11:26:13', 1, 0);
INSERT INTO `detalle_perfil` VALUES (72, 3, 20, '2018-12-21', '11:26:13', 1, 0);
INSERT INTO `detalle_perfil` VALUES (73, 3, 2, '2018-12-21', '11:27:01', 1, 0);
INSERT INTO `detalle_perfil` VALUES (74, 3, 20, '2018-12-21', '11:27:01', 1, 0);
INSERT INTO `detalle_perfil` VALUES (75, 3, 2, '2018-12-21', '11:27:29', 1, 0);
INSERT INTO `detalle_perfil` VALUES (76, 3, 20, '2018-12-21', '11:27:29', 1, 0);
INSERT INTO `detalle_perfil` VALUES (77, 2, 2, '2018-12-21', '01:10:05', 1, 0);
INSERT INTO `detalle_perfil` VALUES (78, 2, 20, '2018-12-21', '01:10:05', 1, 0);
INSERT INTO `detalle_perfil` VALUES (79, 5, 2, '2018-12-21', '02:16:15', 1, 0);
INSERT INTO `detalle_perfil` VALUES (80, 5, 20, '2018-12-21', '02:16:15', 1, 0);
INSERT INTO `detalle_perfil` VALUES (81, 1, 29, '2019-01-08', '02:04:10', 1, 0);
INSERT INTO `detalle_perfil` VALUES (82, 5, 2, '2019-01-08', '02:47:11', 1, 0);
INSERT INTO `detalle_perfil` VALUES (83, 5, 21, '2019-01-08', '02:47:11', 1, 0);
INSERT INTO `detalle_perfil` VALUES (84, 2, 2, '2019-01-08', '02:49:24', 1, 0);
INSERT INTO `detalle_perfil` VALUES (85, 2, 21, '2019-01-08', '02:49:24', 1, 0);

-- ----------------------------
-- Table structure for detalle_usuario
-- ----------------------------
DROP TABLE IF EXISTS `detalle_usuario`;
CREATE TABLE `detalle_usuario`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `solo_sucursal` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_usuario
-- ----------------------------
INSERT INTO `detalle_usuario` VALUES (1, 1, 20, 2, 0, '2018-09-24', '17:25:55', 1, 1);
INSERT INTO `detalle_usuario` VALUES (2, 1, 2, 0, 0, '2018-09-24', '17:26:17', 1, 1);
INSERT INTO `detalle_usuario` VALUES (3, 1, 3, 1, 0, '2018-09-24', '17:26:29', 1, 1);
INSERT INTO `detalle_usuario` VALUES (4, 1, 4, 0, 0, '2018-09-24', '17:26:43', 1, 1);
INSERT INTO `detalle_usuario` VALUES (5, 1, 5, 3, 0, '2018-09-24', '17:27:00', 1, 1);
INSERT INTO `detalle_usuario` VALUES (6, 1, 6, 3, 0, '2018-09-24', '17:27:14', 1, 1);
INSERT INTO `detalle_usuario` VALUES (7, 1, 7, 3, 0, '2018-09-24', '17:27:26', 1, 1);
INSERT INTO `detalle_usuario` VALUES (8, 1, 8, 3, 0, '2018-09-24', '17:27:41', 1, 1);
INSERT INTO `detalle_usuario` VALUES (9, 1, 9, 2, 0, '2018-09-24', '17:27:55', 1, 1);
INSERT INTO `detalle_usuario` VALUES (10, 1, 10, 3, 0, '2018-09-24', '17:28:07', 1, 1);
INSERT INTO `detalle_usuario` VALUES (11, 2, 1, 2, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (12, 2, 2, 0, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (13, 2, 3, 1, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (14, 2, 4, 0, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (15, 2, 5, 3, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (16, 2, 9, 2, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (17, 2, 6, 3, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (18, 2, 7, 3, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (19, 2, 8, 3, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (20, 2, 10, 3, 0, '2018-09-24', '05:36:15', 1, 1);
INSERT INTO `detalle_usuario` VALUES (21, 5, 1, 2, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (22, 5, 2, 0, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (23, 5, 3, 1, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (24, 5, 4, 0, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (25, 5, 5, 3, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (26, 5, 9, 2, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (27, 5, 6, 3, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (28, 5, 7, 3, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (29, 5, 8, 3, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (30, 5, 10, 3, 0, '2018-09-24', '07:08:04', 1, 1);
INSERT INTO `detalle_usuario` VALUES (31, 1, 11, 100, 0, '2018-09-25', '04:34:11', 1, 5);
INSERT INTO `detalle_usuario` VALUES (32, 2, 11, 100, 0, '2018-09-25', '04:34:11', 1, 5);
INSERT INTO `detalle_usuario` VALUES (33, 5, 11, 100, 0, '2018-09-25', '04:34:11', 1, 5);
INSERT INTO `detalle_usuario` VALUES (34, 1, 12, 100, 0, '2018-10-09', '05:39:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (35, 2, 12, 100, 0, '2018-10-09', '05:39:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (36, 5, 12, 100, 0, '2018-10-09', '05:39:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (37, 1, 13, 100, 0, '2018-10-16', '05:13:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (38, 2, 13, 100, 0, '2018-10-16', '05:13:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (39, 5, 13, 100, 0, '2018-10-16', '05:13:13', 1, 1);
INSERT INTO `detalle_usuario` VALUES (40, 1, 14, 100, 0, '2018-10-17', '04:49:22', 1, 1);
INSERT INTO `detalle_usuario` VALUES (41, 2, 14, 100, 0, '2018-10-17', '04:49:22', 1, 1);
INSERT INTO `detalle_usuario` VALUES (42, 5, 14, 100, 0, '2018-10-17', '04:49:22', 1, 1);
INSERT INTO `detalle_usuario` VALUES (43, 1, 15, 100, 0, '2018-10-22', '05:14:41', 1, 1);
INSERT INTO `detalle_usuario` VALUES (44, 2, 15, 100, 0, '2018-10-22', '05:14:41', 1, 1);
INSERT INTO `detalle_usuario` VALUES (45, 5, 15, 100, 0, '2018-10-22', '05:14:41', 1, 1);
INSERT INTO `detalle_usuario` VALUES (46, 1, 16, 2, 1, '2018-10-25', '06:15:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (47, 2, 16, 2, 0, '2018-10-25', '06:15:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (48, 5, 16, 2, 0, '2018-10-25', '06:15:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (49, 1, 17, 101, 0, '2018-11-01', '03:36:53', 1, 1);
INSERT INTO `detalle_usuario` VALUES (50, 2, 17, 101, 0, '2018-11-01', '03:36:53', 1, 1);
INSERT INTO `detalle_usuario` VALUES (51, 5, 17, 101, 0, '2018-11-01', '03:36:53', 1, 1);
INSERT INTO `detalle_usuario` VALUES (52, 1, 18, 101, 0, '2018-11-12', '04:02:44', 1, 1);
INSERT INTO `detalle_usuario` VALUES (53, 2, 18, 101, 0, '2018-11-12', '04:02:44', 1, 1);
INSERT INTO `detalle_usuario` VALUES (54, 5, 18, 101, 0, '2018-11-12', '04:02:44', 1, 1);
INSERT INTO `detalle_usuario` VALUES (55, 6, 18, 101, 0, '2018-11-12', '05:48:08', 1, 1);
INSERT INTO `detalle_usuario` VALUES (56, 6, 17, 101, 0, '2018-11-12', '05:48:08', 1, 1);
INSERT INTO `detalle_usuario` VALUES (57, 7, 18, 101, 0, '2018-11-12', '05:49:24', 1, 1);
INSERT INTO `detalle_usuario` VALUES (58, 7, 17, 101, 0, '2018-11-12', '05:49:24', 1, 1);
INSERT INTO `detalle_usuario` VALUES (59, 8, 18, 101, 0, '2018-11-12', '05:49:51', 1, 1);
INSERT INTO `detalle_usuario` VALUES (60, 8, 17, 101, 0, '2018-11-12', '05:49:51', 1, 1);
INSERT INTO `detalle_usuario` VALUES (61, 9, 18, 101, 0, '2018-11-12', '05:50:08', 1, 1);
INSERT INTO `detalle_usuario` VALUES (62, 9, 17, 101, 0, '2018-11-12', '05:50:08', 1, 1);
INSERT INTO `detalle_usuario` VALUES (63, 10, 18, 101, 0, '2018-11-12', '05:50:23', 1, 1);
INSERT INTO `detalle_usuario` VALUES (64, 10, 17, 101, 0, '2018-11-12', '05:50:23', 1, 1);
INSERT INTO `detalle_usuario` VALUES (65, 6, 2, 0, 0, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (66, 7, 2, 0, 0, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (67, 8, 2, 0, 0, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (68, 9, 2, 0, 0, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (69, 10, 2, 0, 0, '2018-11-12', '05:58:34', 1, 1);
INSERT INTO `detalle_usuario` VALUES (76, 11, 2, 0, 0, '2018-11-13', '09:50:41', 1, 2);
INSERT INTO `detalle_usuario` VALUES (77, 11, 18, 101, 0, '2018-11-13', '09:50:41', 1, 2);
INSERT INTO `detalle_usuario` VALUES (78, 11, 17, 101, 0, '2018-11-13', '09:50:41', 1, 2);
INSERT INTO `detalle_usuario` VALUES (79, 12, 16, 2, 0, '2018-11-17', '03:39:27', 1, 2);
INSERT INTO `detalle_usuario` VALUES (80, 12, 9, 2, 0, '2018-11-17', '03:39:27', 1, 2);
INSERT INTO `detalle_usuario` VALUES (81, 12, 1, 2, 0, '2018-11-17', '03:39:27', 1, 2);
INSERT INTO `detalle_usuario` VALUES (82, 12, 2, 0, 0, '2018-11-17', '03:39:27', 1, 2);
INSERT INTO `detalle_usuario` VALUES (83, 1, 19, 102, 0, '2018-11-21', '06:29:40', 1, 1);
INSERT INTO `detalle_usuario` VALUES (84, 1, 21, 2, 0, '2018-11-21', '06:29:40', 1, 1);
INSERT INTO `detalle_usuario` VALUES (85, 5, 19, 102, 0, '2018-11-21', '06:29:40', 0, 1);
INSERT INTO `detalle_usuario` VALUES (86, 1, 22, 2, 0, '0000-00-00', '00:00:00', 1, 0);
INSERT INTO `detalle_usuario` VALUES (87, 1, 26, 4, 0, '2018-12-19', '03:40:11', 1, 0);
INSERT INTO `detalle_usuario` VALUES (88, 2, 26, 4, 0, '2018-12-19', '03:40:11', 1, 0);
INSERT INTO `detalle_usuario` VALUES (89, 1, 27, 4, 0, '2018-12-19', '03:43:41', 1, 0);
INSERT INTO `detalle_usuario` VALUES (90, 2, 27, 4, 0, '2018-12-19', '03:43:41', 1, 0);
INSERT INTO `detalle_usuario` VALUES (91, 1, 28, 4, 0, '2018-12-19', '03:45:27', 1, 0);
INSERT INTO `detalle_usuario` VALUES (92, 2, 28, 4, 0, '2018-12-19', '03:45:27', 1, 0);
INSERT INTO `detalle_usuario` VALUES (93, 1, 2, 0, 0, '2018-12-19', '04:31:38', 1, 0);
INSERT INTO `detalle_usuario` VALUES (94, 3, 2, 0, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (95, 3, 21, 2, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (96, 3, 4, 0, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (97, 3, 5, 3, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (98, 3, 6, 3, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (99, 3, 7, 3, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (100, 3, 8, 3, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (101, 3, 10, 3, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (102, 3, 20, 2, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (103, 3, 2, 0, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (104, 3, 22, 2, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (105, 3, 2, 0, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (106, 3, 26, 4, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (107, 3, 27, 4, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (108, 3, 28, 4, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `detalle_usuario` VALUES (109, 4, 2, 0, 0, '2018-12-19', '04:51:11', 1, 0);
INSERT INTO `detalle_usuario` VALUES (110, 4, 21, 0, 0, '2018-12-21', '11:23:47', 1, 0);
INSERT INTO `detalle_usuario` VALUES (111, 4, 20, 0, 0, '2018-12-21', '11:23:47', 1, 0);
INSERT INTO `detalle_usuario` VALUES (112, 4, 21, 0, 0, '2018-12-21', '11:23:55', 1, 0);
INSERT INTO `detalle_usuario` VALUES (113, 4, 20, 0, 0, '2018-12-21', '11:23:55', 1, 0);
INSERT INTO `detalle_usuario` VALUES (114, 4, 20, 0, 0, '2018-12-21', '11:24:33', 1, 0);
INSERT INTO `detalle_usuario` VALUES (115, 4, 20, 0, 0, '2018-12-21', '11:26:13', 1, 0);
INSERT INTO `detalle_usuario` VALUES (116, 4, 20, 0, 0, '2018-12-21', '11:27:01', 1, 0);
INSERT INTO `detalle_usuario` VALUES (117, 4, 20, 2, 0, '2018-12-21', '11:27:29', 1, 0);
INSERT INTO `detalle_usuario` VALUES (118, 5, 20, 2, 0, '2018-12-21', '01:10:05', 1, 0);
INSERT INTO `detalle_usuario` VALUES (119, 6, 2, 0, 0, '2018-12-21', '02:15:43', 1, 0);
INSERT INTO `detalle_usuario` VALUES (120, 6, 20, 2, 0, '2018-12-21', '02:16:15', 1, 0);
INSERT INTO `detalle_usuario` VALUES (121, 1, 29, 2, 0, '2019-01-08', '02:04:10', 1, 0);
INSERT INTO `detalle_usuario` VALUES (122, 2, 29, 2, 0, '2019-01-08', '02:04:10', 1, 0);
INSERT INTO `detalle_usuario` VALUES (123, 6, 21, 2, 0, '2019-01-08', '02:47:11', 1, 0);
INSERT INTO `detalle_usuario` VALUES (124, 5, 21, 2, 0, '2019-01-08', '02:49:24', 1, 0);

-- ----------------------------
-- Table structure for estatus_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `estatus_conceptos`;
CREATE TABLE `estatus_conceptos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_estatus` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_modifica` datetime(0) NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estatus_conceptos
-- ----------------------------
INSERT INTO `estatus_conceptos` VALUES (1, 'Autorizado', NULL, 'admin');
INSERT INTO `estatus_conceptos` VALUES (2, 'Rechazado', NULL, 'admin');
INSERT INTO `estatus_conceptos` VALUES (3, 'Enviado Revision', NULL, 'admin');
INSERT INTO `estatus_conceptos` VALUES (4, 'Creado', NULL, 'admin');
INSERT INTO `estatus_conceptos` VALUES (5, 'Rechazado Parcial', NULL, 'admin');

-- ----------------------------
-- Table structure for estatus_contratos
-- ----------------------------
DROP TABLE IF EXISTS `estatus_contratos`;
CREATE TABLE `estatus_contratos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estatus_contratos
-- ----------------------------
INSERT INTO `estatus_contratos` VALUES (1, 'Creado');
INSERT INTO `estatus_contratos` VALUES (2, 'Vo. Residente');
INSERT INTO `estatus_contratos` VALUES (3, 'Vo. Supervisor');
INSERT INTO `estatus_contratos` VALUES (4, 'Autorizado');
INSERT INTO `estatus_contratos` VALUES (5, 'Cancelado');
INSERT INTO `estatus_contratos` VALUES (6, 'Finiquitado');

-- ----------------------------
-- Table structure for estimaciones
-- ----------------------------
DROP TABLE IF EXISTS `estimaciones`;
CREATE TABLE `estimaciones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(255) NULL DEFAULT NULL,
  `p_anticipo` float(255, 2) NULL DEFAULT 0.00,
  `p_garantia` float(255, 2) NULL DEFAULT 0.00,
  `p_iva` float(255, 2) NULL DEFAULT 0.00,
  `p_pendiente` float(255, 2) NULL DEFAULT 0.00,
  `t_anticipo` float(255, 2) NULL DEFAULT 0.00,
  `t_garantia` float(255, 2) NULL DEFAULT 0.00,
  `t_iva` float(255, 2) NULL DEFAULT 0.00,
  `t_pendiente` float(255, 2) NULL DEFAULT 0.00,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre` int(255) NULL DEFAULT NULL,
  `contratista` int(255) NULL DEFAULT NULL,
  `residente` int(255) NULL DEFAULT NULL,
  `total_estimacion` float(255, 2) NULL DEFAULT NULL,
  `total_estimacion_impuesto` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for familias
-- ----------------------------
DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familia` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cuenta` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usuario_modifica` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `id_clave` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of familias
-- ----------------------------
INSERT INTO `familias` VALUES (1, 'SERVICIOS', 'AGUA,LUZ,GAS', '5101-0003-0001', '', NULL, '001-Ser');
INSERT INTO `familias` VALUES (2, 'HER-ANDAMIOS', 'COMPRA DE ANDAMIOS', '5101-0005-0001', '', NULL, NULL);
INSERT INTO `familias` VALUES (3, 'HER-FORMAS', 'COMPRA DE FORMAS', '5101-0005-0002', '', NULL, NULL);
INSERT INTO `familias` VALUES (4, 'HER-VARIOS', 'HERRAMIENTA VARIAS', '5101-0005-0003', '', NULL, NULL);
INSERT INTO `familias` VALUES (5, 'MAT-ACERO', 'ACEROS', '5101-0010-0001', '', NULL, NULL);
INSERT INTO `familias` VALUES (6, 'MAT-CIMBRA', 'MADERAS', '5101-0010-0002', '', NULL, NULL);
INSERT INTO `familias` VALUES (7, 'MAT-AGREGADOS', 'GRAVA, ARENAS', '5101-0010-0003', '', NULL, NULL);
INSERT INTO `familias` VALUES (8, 'MAT-CEMENTO', 'CEMENTOS', '5101-0010-0004', '', NULL, NULL);
INSERT INTO `familias` VALUES (9, 'MAT-CONSTRUCCION', 'MATERIAL CONSTRUCCION', '5101-0010-0005', '', NULL, NULL);
INSERT INTO `familias` VALUES (10, 'MAT-SANTA CLARA', 'VIGUETA BOVEDILLA', '5101-0010-0006', '', NULL, NULL);
INSERT INTO `familias` VALUES (11, 'MAT-CONCRETO', 'PREMEZCLADOS', '5101-0010-0007', '', NULL, NULL);
INSERT INTO `familias` VALUES (12, 'MAT-PLASTICO', 'PLASTICO', '5101-0010-0008', '', NULL, NULL);
INSERT INTO `familias` VALUES (13, 'MAT-BLOCK', 'BLOCK, LADRILLO, BARROBLOCK', '5101-0010-0009', '', NULL, NULL);
INSERT INTO `familias` VALUES (14, 'MAT-VARIOS', 'VARIOS', '5101-0010-0010', '', NULL, NULL);
INSERT INTO `familias` VALUES (15, 'MAT-AC-PIEDRAS', 'PIEDRAS', '5101-0010-0011', '', NULL, NULL);
INSERT INTO `familias` VALUES (16, 'MAT-AC-TEJA', 'TEJAS', '5101-0010-0012', '', NULL, NULL);
INSERT INTO `familias` VALUES (17, 'MAT-AC-CANTERA', 'CANTERAS', '5101-0010-0013', '', NULL, NULL);
INSERT INTO `familias` VALUES (18, 'MAT-AC-CHAPAS', 'CHAPAS Y CERRADURAS', '5101-0010-0014', '', NULL, NULL);
INSERT INTO `familias` VALUES (19, 'MAT-AC-SANITARIOS', 'SANITARIOS, LAVABOS Y MEZCLADORAS', '5101-0010-0015', '', NULL, NULL);
INSERT INTO `familias` VALUES (20, 'MAT-AC-MARMOL', 'MARMOL Y GRANITO', '5101-0010-0016', '', NULL, NULL);
INSERT INTO `familias` VALUES (21, 'MAT-AC-ADHESIVOS', 'ADHESIVOS PARA PISOS', '5101-0010-0017', '', NULL, NULL);
INSERT INTO `familias` VALUES (22, 'MAT-AC-PISOS', 'PISOS Y AZULEJOS', '5101-0010-0018', '', NULL, NULL);
INSERT INTO `familias` VALUES (23, 'MAT-AC-DUELA ', 'DUELA,DEK', '5101-0010-0019', '', NULL, NULL);
INSERT INTO `familias` VALUES (24, 'MAT-PAPEL ', 'CRAF Y CORRUGADO', '5101-0010-0020', '', NULL, NULL);
INSERT INTO `familias` VALUES (25, 'MAT-PINTURAS', 'PINTURAS y SELLADORES', '5101-0010-0021', '', NULL, NULL);
INSERT INTO `familias` VALUES (26, 'MAT-IMPER', 'IMPERMEABILIZANTES Y MEMBRANAS', '5101-0010-0022', '', NULL, NULL);
INSERT INTO `familias` VALUES (27, 'MAT-AISLANTE', 'AISLANTES', '5101-0010-0023', '', NULL, NULL);
INSERT INTO `familias` VALUES (28, 'MAT-PLOMERIA', 'MATERIAL PLOMERIA', '5101-0010-0024', '', NULL, NULL);
INSERT INTO `familias` VALUES (29, 'MAT-PLOMERIA-PEX', 'MATERIAL PEX', '5101-0010-0025', '', NULL, NULL);
INSERT INTO `familias` VALUES (30, 'MAT-ELEC-ELEC ', 'MATERIAL ELECTRICO', '5101-0010-0026', '', NULL, NULL);
INSERT INTO `familias` VALUES (31, 'MAT-ELEC-CABLE', 'CABLES', '5101-0010-0027', '', NULL, NULL);
INSERT INTO `familias` VALUES (32, ' JARDINERIA', 'VIVERO, TIERRA JARDIN', '5101-0010-0028', '', NULL, '001-JAR');
INSERT INTO `familias` VALUES (33, 'RTA-LIG-MAQ', 'BAILARINA,ROMPEDORA,ETC', '5101-0012-0001', '', NULL, NULL);
INSERT INTO `familias` VALUES (34, 'RTA-LIG-ANDAMIOS', 'RENTA ANDAMIOS', '5101-0012-0002', '', NULL, NULL);
INSERT INTO `familias` VALUES (35, 'RTA-LIG-WC', 'RENTA WC', '5101-0012-0003', '', NULL, NULL);
INSERT INTO `familias` VALUES (36, 'RTA-LIG-COMPOSTURAS', 'COMPOSTURA DE MAQUINARIA', '5101-0012-0004', '', NULL, NULL);
INSERT INTO `familias` VALUES (37, 'RTA-RETRO', 'RETROEXCAVADORA', '5101-0012-0005', '', NULL, NULL);
INSERT INTO `familias` VALUES (38, 'RTA-RETIROS', 'RETIRO DE MATERIAL Y ESCOMBRO', '5101-0012-0006', '', NULL, NULL);
INSERT INTO `familias` VALUES (39, 'RTA-RELLENO', 'VIAJES DE TIERRA RELLENO', '5101-0012-0007', '', NULL, NULL);
INSERT INTO `familias` VALUES (40, 'SB-SUBCONTRATOS', 'SUBCONTRATOS', '5101-0014-0001', '', NULL, NULL);
INSERT INTO `familias` VALUES (41, 'SB-01-ALUMINIO', 'ALUMINIO Y VIDRIO', '5101-0014-0002', '', NULL, NULL);
INSERT INTO `familias` VALUES (42, 'SB-02-TEMPLADOS', 'TEMPLADOS', '5101-0014-0003', '', NULL, NULL);
INSERT INTO `familias` VALUES (43, 'SB-03-HERRERIA', 'HERRERIA', '5101-0014-0004', '', NULL, NULL);
INSERT INTO `familias` VALUES (44, 'SB-04-CANTERA', 'CANTERA', '5101-0014-0005', '', NULL, NULL);
INSERT INTO `familias` VALUES (45, 'SB-05-MARMOL,GRANITO', 'MARMOL Y GRANITO', '5101-0014-0006', '', NULL, NULL);
INSERT INTO `familias` VALUES (46, 'SB-06-DUELA', 'DUELA', '5101-0014-0007', '', NULL, NULL);
INSERT INTO `familias` VALUES (47, 'SB-07-COCINA', 'CARPINTERIA COCINA', '5101-0014-0008', '', NULL, NULL);
INSERT INTO `familias` VALUES (48, 'SB-08-PUERTAS', 'CARPINTERIA PUERTAS', '5101-0014-0009', '', NULL, NULL);
INSERT INTO `familias` VALUES (49, 'SB-09-CARPINTERIA', 'CARPINTERIA GENERAL', '5101-0014-0010', '', NULL, '001-CAR');
INSERT INTO `familias` VALUES (50, 'SB-10-DUCTOS', 'DUCTOS Y EQUIPOS', '5101-0014-0011', '', NULL, NULL);
INSERT INTO `familias` VALUES (51, 'SB-11-RIEGO', 'SISTEMA DE RIEGO', '5101-0014-0012', '', NULL, NULL);
INSERT INTO `familias` VALUES (52, 'SB-12-PLAFON', 'PLAFONERO', '5101-0014-0013', '', NULL, NULL);
INSERT INTO `familias` VALUES (53, 'SB-13-IMPER', 'IMPERMEABILIZADOR', '5101-0014-0014', '', NULL, NULL);
INSERT INTO `familias` VALUES (54, 'SB-14-ALBERCA', 'ALBERCA', '5101-0014-0015', '', NULL, NULL);
INSERT INTO `familias` VALUES (55, 'SB-15-PINTURA', 'PINTORES', '5101-0014-0016', '', NULL, NULL);
INSERT INTO `familias` VALUES (56, 'CONT-CONTRATISTAS', 'CONTRATISTAS', '5101-0014-0017', '', NULL, NULL);
INSERT INTO `familias` VALUES (57, 'CONT-01-ALBAÑILERIA', 'ALBAÑILERIA', '5101-0014-0018', '', NULL, '001-ALB');
INSERT INTO `familias` VALUES (58, 'CONT-02-PLOM/ELECT', 'PLOMERIA Y ELECTRICO', '5101-0014-0019', '', NULL, NULL);
INSERT INTO `familias` VALUES (59, 'CONT-03-YESERO', 'YESEROS', '5101-0014-0020', '', NULL, NULL);
INSERT INTO `familias` VALUES (60, 'CONT-04-AZULEJERO', 'AZULEJEROS', '5101-0014-0021', '', NULL, NULL);
INSERT INTO `familias` VALUES (61, 'CONT-05-PINTURA', 'PINTORES', '5101-0014-0022', '', NULL, NULL);
INSERT INTO `familias` VALUES (62, 'CONT-06-PIEDRITA', 'PIEDRITA', '5101-0014-0023', '', NULL, NULL);
INSERT INTO `familias` VALUES (63, 'CONT-07-LIMPIEZA', 'LIMPIEZA', '5101-0014-0024', '', NULL, '001-LIM');
INSERT INTO `familias` VALUES (64, 'CONT-08-PLAFON', 'PLAFONERO', '5101-0014-0025', '', NULL, NULL);
INSERT INTO `familias` VALUES (66, 'CONT-09-TEJA', 'INSTALACION DE TEJA', '5101-0014-0026', '', NULL, NULL);
INSERT INTO `familias` VALUES (67, 'CONT-15-VARIOS', 'VARIOS', '5101-0014-0027', '', NULL, NULL);
INSERT INTO `familias` VALUES (68, 'PRELIMINARES', 'PRELIMINARES', '5101-0010-0007', '', NULL, '301-PRE');
INSERT INTO `familias` VALUES (69, 'TERRACERIAS Y PLATAFORMAS', 'TERRACERIAS Y PLATAFORMAS', '5101-0010-0007', '', NULL, '001-TYP');
INSERT INTO `familias` VALUES (70, 'CIMENTACION', 'CIMENTACION', '5101-0010-0007', '', NULL, '001-CIM');
INSERT INTO `familias` VALUES (71, 'ALBERCA TIPO (10X4.20X1.60 M)', 'ALBERCA TIPO (10X4.20X1.60 M)', '5101-0010-0007', '', NULL, '001-ALBE');
INSERT INTO `familias` VALUES (72, 'TERMINO DE LOSA', 'TERMINO DE LOSA', '5101-0010-0007', '', NULL, '001-TDE');
INSERT INTO `familias` VALUES (73, 'APLANADOS', 'APLANADOS', '5101-0010-0007', '', NULL, '001-APL');
INSERT INTO `familias` VALUES (74, 'IMPERMEABILIZANTE', 'IMPERMMEABILIZANTE', '5101-0010-0007', '', NULL, '001-IMP');
INSERT INTO `familias` VALUES (75, 'PISOS Y AZULEJOS', 'PISOS Y AZULEJOS', '5101-0010-0007', '', NULL, '001-PYA');
INSERT INTO `familias` VALUES (76, 'MARMOL Y GRANITO', 'MARMOL Y GRANITO', '5101-0010-0007', '', NULL, '001-MYG');
INSERT INTO `familias` VALUES (77, 'CANTERA PIEDRA Y TEJA', 'CANTERA PIEDRA Y TEJA', '5101-0010-0007', '', NULL, '001-CPT');
INSERT INTO `familias` VALUES (78, 'PINTURA', 'PINTURA', '5101-0010-0007', '', NULL, '001-PIN');
INSERT INTO `familias` VALUES (79, 'HERRERIA', 'HERRERIA', '5101-0010-0007', '', NULL, '001-HER');
INSERT INTO `familias` VALUES (80, 'ALUMINIO', 'ALUMINIO', '5101-0010-0007', '', NULL, '001-ALU');
INSERT INTO `familias` VALUES (81, 'MUEBLES DE BAÑO', 'MUEBLES DE BAÑO', '5101-0010-0007', '', NULL, '001-MDB');
INSERT INTO `familias` VALUES (82, 'INST. HIDROSANITARIAS', 'INST. HIDROSANITARIAS', '5101-0010-0007', '', NULL, '001-IHS');
INSERT INTO `familias` VALUES (83, 'INST.ELECTRICAS', 'INST.ELECTRICAS', '5101-0010-0007', '', NULL, '001-IEL');
INSERT INTO `familias` VALUES (84, 'DUCTOS Y CLIMAS', 'DUCTOS Y CLIMAS', '5101-0010-0007', '', NULL, '001-DYC');
INSERT INTO `familias` VALUES (85, 'ADMINISTRATIVOS Y COMISIONES', 'ADMINISTRATIVOS Y COMISIONES', '5101-0010-0007', '', NULL, '001-AYC');

-- ----------------------------
-- Table structure for fechas_contratos
-- ----------------------------
DROP TABLE IF EXISTS `fechas_contratos`;
CREATE TABLE `fechas_contratos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(255) NULL DEFAULT NULL,
  `fecha_residente` date NULL DEFAULT NULL,
  `fecha_supervisor` date NULL DEFAULT NULL,
  `fecha_costos` date NULL DEFAULT NULL,
  `fecha_return` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fechas_contratos
-- ----------------------------
INSERT INTO `fechas_contratos` VALUES (1, 1, '2019-01-06', NULL, NULL, '2019-01-07');
INSERT INTO `fechas_contratos` VALUES (2, 1, '2019-01-08', '2019-01-08', '2019-01-08', NULL);
INSERT INTO `fechas_contratos` VALUES (3, 2, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for generador_contrato
-- ----------------------------
DROP TABLE IF EXISTS `generador_contrato`;
CREATE TABLE `generador_contrato`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `id_concepto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_area` int(11) NULL DEFAULT NULL,
  `largo` float NULL DEFAULT NULL,
  `ancho` float NULL DEFAULT NULL,
  `alto` float NULL DEFAULT NULL,
  `total` float NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estatus` int(255) NOT NULL DEFAULT 0 COMMENT '1=sin estimar, 2=estimado',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of generador_contrato
-- ----------------------------
INSERT INTO `generador_contrato` VALUES (1, 1, '168', 3, 20, 20, 0, 400, '2018-11-27', 'admin', 0);
INSERT INTO `generador_contrato` VALUES (2, 2, '168', 3, 10, 10, 0, 100, '2018-11-27', 'admin', 0);
INSERT INTO `generador_contrato` VALUES (3, 2, '168', 3, 100, 100, 0, 10000, '2018-11-27', 'admin', 0);

-- ----------------------------
-- Table structure for importes
-- ----------------------------
DROP TABLE IF EXISTS `importes`;
CREATE TABLE `importes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contrato` int(11) NULL DEFAULT NULL,
  `p_anticipo` float NULL DEFAULT NULL,
  `p_fondo_garantia` float NULL DEFAULT NULL,
  `p_iva` float NULL DEFAULT NULL,
  `t_anticipo` float NULL DEFAULT NULL,
  `t_fondo_garantia` float NULL DEFAULT NULL,
  `t_iva` float NULL DEFAULT NULL,
  `p_pendiente` float NULL DEFAULT NULL,
  `t_pendiente` float NULL DEFAULT NULL,
  `total_contrato` float NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre_carpeta` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `panel_control` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `icono` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tema` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES (2, 'Panel de Control', 'mPanel_control', 'Utilizada como pagina de inicio, es el acceso a todos los demás modulos permitidos para el usuario logueado', 1, 0, '', '', '2018-09-13', '00:00:09', 1, 1);
INSERT INTO `modulos` VALUES (4, 'Cambiar Contraseña', 'mCambiarContra', 'Permite cambiar la contraseña del usuario.', 0, 0, '', '', '2018-09-14', '00:00:11', 1, 1);
INSERT INTO `modulos` VALUES (5, 'Categorías de Módulos', 'mCategorias', 'Administra los módulos del sistema.', 1, 3, 'ion-filing', 'bg-red', '2018-09-14', '00:00:11', 1, 1);
INSERT INTO `modulos` VALUES (6, 'Módulos', 'mModulos', 'Administra las categorías en las que puede ser clasificado un módulo del sistema.', 1, 3, 'ion-social-buffer', 'bg-green', '2018-09-15', '12:32:42', 1, 1);
INSERT INTO `modulos` VALUES (10, 'Personal', 'mPersonal', 'Permite la administración del personal que tendrá acceso al sistema.', 1, 3, 'ion-person-stalker', 'bg-yellow', '2018-09-20', '05:00:26', 1, 0);
INSERT INTO `modulos` VALUES (7, 'Perfiles', 'mPerfiles', 'Permite administrar los diferentes perfiles de usuario que existen.', 1, 3, 'ion-android-contacts', 'bg-yellow', '2018-09-15', '12:41:53', 1, 1);
INSERT INTO `modulos` VALUES (8, 'Detalle Perfil', 'mDetalle_perfil', 'Administra los diferentes módulos a los que tiene acceso determinado perfil.', 1, 3, 'ion-grid', 'bg-aqua', '2018-09-15', '12:47:45', 1, 1);
INSERT INTO `modulos` VALUES (26, 'Residentes', 'mResidentes', 'Catalogo de residentes', 1, 4, 'ion-clipboard', 'bg-aqua', '2018-12-19', '03:40:11', 1, 0);
INSERT INTO `modulos` VALUES (27, 'Conceptos', 'mConceptos', 'Catalogo de conceptos', 1, 4, 'ion-clipboard', 'bg-red', '2018-12-19', '03:43:41', 1, 0);
INSERT INTO `modulos` VALUES (28, 'Contratistas', 'mContratistas', 'Catalogo de contratistas', 1, 4, 'ion-clipboard', 'bg-green', '2018-12-19', '03:45:27', 1, 0);
INSERT INTO `modulos` VALUES (29, 'Historial', 'mHistorial', 'Historial de los contratos', 1, 2, 'ion-clipboard', 'bg-red', '2019-01-08', '02:04:10', 1, 0);
INSERT INTO `modulos` VALUES (22, 'Contratos Siguientes', 'mContratosSig', 'Contratos Siguientes', 1, 2, 'ion-clipboard', 'bg-yellow', '2018-12-18', '01:10:21', 1, 1);
INSERT INTO `modulos` VALUES (21, 'Contratos en proceso', 'mContratosDesarrollo', 'Contratos en proceso', 1, 2, 'ion-clipboard', 'bg-aqua', '0000-00-00', '00:00:00', 1, 1);
INSERT INTO `modulos` VALUES (20, 'Contratos', 'mContratos', 'Contratos', 1, 2, 'ion-clipboard', 'bg-red', '2018-12-18', '03:00:00', 1, 1);

-- ----------------------------
-- Table structure for nombres_formularios
-- ----------------------------
DROP TABLE IF EXISTS `nombres_formularios`;
CREATE TABLE `nombres_formularios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_form` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for observaciones_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `observaciones_conceptos`;
CREATE TABLE `observaciones_conceptos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observacion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fecha` date NULL DEFAULT NULL,
  `id_detalle_contrato` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personas
-- ----------------------------
DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_paterno` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_materno` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sexo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `rfc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `curp` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `e_mail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `colonia` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numero` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ecivil` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `municipio` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coloniax` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `callex` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `estudiante` int(11) NOT NULL DEFAULT 0,
  `numerox` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `estadox` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `municipiox` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `telvive` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `telprocede` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personas
-- ----------------------------
INSERT INTO `personas` VALUES (18, 'Sebastian ', 'Villarreal', 'Alvarado', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2018-12-19', '04:31:38', 1, 0, 0);
INSERT INTO `personas` VALUES (19, 'Marcela', 'Bautista', 'Nieto', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2018-12-19', '04:50:51', 1, 0, 0);
INSERT INTO `personas` VALUES (20, 'Marcelo', 'Silva', 'Casas', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2018-12-19', '04:51:11', 1, 0, 0);
INSERT INTO `personas` VALUES (21, 'Mayra', 'Lopez', 'Jimenez', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2018-12-19', '04:51:37', 1, 0, 0);
INSERT INTO `personas` VALUES (22, 'Costos', 'Costos', 'Costos', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2018-12-21', '02:15:43', 1, 0, 0);

-- ----------------------------
-- Table structure for proyectos
-- ----------------------------
DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE `proyectos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activo` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos
-- ----------------------------
INSERT INTO `proyectos` VALUES (1, 'Amorada', '2018-11-05', NULL, 1);
INSERT INTO `proyectos` VALUES (2, 'Amorada dos', '2018-11-20', 'admin', 1);

-- ----------------------------
-- Table structure for residentes
-- ----------------------------
DROP TABLE IF EXISTS `residentes`;
CREATE TABLE `residentes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(1) NOT NULL DEFAULT 1,
  `id_usuario` int(255) NULL DEFAULT NULL,
  `id_supervisor` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of residentes
-- ----------------------------
INSERT INTO `residentes` VALUES (1, 1, 4, 5);

-- ----------------------------
-- Table structure for sc_log
-- ----------------------------
DROP TABLE IF EXISTS `sc_log`;
CREATE TABLE `sc_log`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inserted_date` datetime(0) NULL DEFAULT NULL,
  `username` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `application` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2331 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc_log
-- ----------------------------
INSERT INTO `sc_log` VALUES (1, '2018-10-10 11:52:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2, '2018-10-10 11:53:13', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (3, '2018-10-10 11:53:43', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- descripcion (old)  : Contrato Amorada r||descripcion (new)  : Contrato Amorada ');
INSERT INTO `sc_log` VALUES (4, '2018-10-10 12:44:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (5, '2018-10-10 12:44:10', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (6, '2018-10-10 12:46:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (7, '2018-10-10 12:46:40', 'Test', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (8, '2018-10-10 13:05:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (9, '2018-10-10 13:05:39', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (10, '2018-10-10 13:06:28', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (11, '2018-10-10 13:06:36', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (12, '2018-10-10 13:09:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (13, '2018-10-10 13:09:19', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (14, '2018-10-10 13:10:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (15, '2018-10-10 13:10:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (16, '2018-10-10 13:10:49', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (17, '2018-10-10 13:11:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (18, '2018-10-10 13:11:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (19, '2018-10-10 13:11:23', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (20, '2018-10-10 13:12:04', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (21, '2018-10-10 13:12:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (22, '2018-10-10 13:12:11', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:supervisor');
INSERT INTO `sc_log` VALUES (23, '2018-10-10 13:12:16', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (24, '2018-10-10 13:12:52', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (25, '2018-10-10 13:13:19', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (26, '2018-10-10 13:13:51', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (27, '2018-10-10 13:14:02', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (28, '2018-10-10 13:14:39', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (29, '2018-10-10 13:15:08', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (30, '2018-10-10 13:15:49', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (31, '2018-10-10 13:16:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (32, '2018-10-10 13:16:42', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (33, '2018-10-10 13:16:46', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (34, '2018-10-10 13:17:50', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (35, '2018-10-10 13:18:35', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (36, '2018-10-10 13:18:50', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (37, '2018-10-10 13:19:11', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (38, '2018-10-10 13:19:54', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (39, '2018-10-10 13:21:02', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (40, '2018-10-10 13:22:38', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (41, '2018-10-10 13:22:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (42, '2018-10-10 13:22:49', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (43, '2018-10-10 13:23:22', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (44, '2018-10-10 13:23:33', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (45, '2018-10-10 13:26:40', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (46, '2018-10-10 13:27:14', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (47, '2018-10-10 13:27:21', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (48, '2018-10-10 13:28:06', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (49, '2018-10-10 13:29:04', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (50, '2018-10-10 13:29:09', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (51, '2018-10-10 13:35:31', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (52, '2018-10-10 13:37:32', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (53, '2018-10-10 13:38:13', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (54, '2018-10-10 13:38:30', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (55, '2018-10-10 13:38:54', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (56, '2018-10-10 13:39:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (57, '2018-10-10 13:39:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (58, '2018-10-10 13:39:59', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 2||residente (new)  : 1||fecha (new)  : 2018-10-10||descripcion (new)  : ||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (59, '2018-10-10 13:40:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (60, '2018-10-10 13:41:54', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (61, '2018-10-10 13:43:31', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (62, '2018-10-10 13:43:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (63, '2018-10-10 13:43:44', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (64, '2018-10-10 13:46:25', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (65, '2018-10-10 13:53:28', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (66, '2018-10-10 13:56:41', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (67, '2018-10-10 13:56:45', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (68, '2018-10-10 14:00:02', 'admin', 'App_form_edit_users', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- login : admin||--> fields <-- pswd (old)  : 3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79||pswd (new)  : ||groups (old)  : 1;||groups (new)  : 1');
INSERT INTO `sc_log` VALUES (69, '2018-10-10 14:58:49', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (70, '2018-10-10 14:59:17', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (71, '2018-10-10 15:02:45', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (72, '2018-10-10 15:03:50', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : Administrador||cargo (new)  : Administrador de contratos||telefono (new)  : 343434||fax (new)  : sf||mail (new)  : admin@origen.com||rol (new)  : 1||flag_activo (new)  : 1||tb_sec_users_login (new)  : admin||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 15:03:50');
INSERT INTO `sc_log` VALUES (73, '2018-10-10 15:07:21', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (74, '2018-10-10 15:08:15', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : admin||cargo (new)  : Administrador de contratos||telefono (new)  : 3434||fax (new)  : 434||mail (new)  : admin@origen.com||rol (new)  : 1||flag_activo (new)  : 1||tb_sec_users_login (new)  : admin||usuario_modifica (new)  : ||fecha_modifica (new)  : 2018-10-10 15:08:15');
INSERT INTO `sc_log` VALUES (75, '2018-10-10 15:08:59', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (76, '2018-10-10 15:09:41', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (77, '2018-10-10 15:10:06', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : admin||cargo (new)  : Administrador de contratos||telefono (new)  : 1234||fax (new)  : 434||mail (new)  : origen@admin.com||rol (new)  : 1||flag_activo (new)  : 1||tb_sec_users_login (new)  : admin||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 15:10:06');
INSERT INTO `sc_log` VALUES (78, '2018-10-10 15:11:12', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (79, '2018-10-10 15:11:49', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (80, '2018-10-10 15:12:40', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (81, '2018-10-10 15:15:13', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (82, '2018-10-10 15:15:23', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- nombre (old)  : admin||nombre (new)  : Administrador||fecha_modifica (old)  : 2018-10-10||fecha_modifica (new)  : 2018-10-10 15:15:23');
INSERT INTO `sc_log` VALUES (83, '2018-10-10 15:15:52', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (84, '2018-10-10 15:16:24', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : AdministradorRayas||cargo (new)  : Rayas ||telefono (new)  : 787||fax (new)  : 787||mail (new)  : rayass@origen.com||rol (new)  : 4||flag_activo (new)  : 1||tb_sec_users_login (new)  : adminRayas||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 15:16:24');
INSERT INTO `sc_log` VALUES (85, '2018-10-10 15:19:46', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (86, '2018-10-10 15:19:51', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (87, '2018-10-10 15:19:53', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (88, '2018-10-10 15:19:55', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (89, '2018-10-10 15:19:57', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (90, '2018-10-10 15:24:21', 'admin', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (91, '2018-10-10 15:34:36', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (92, '2018-10-10 15:34:44', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (93, '2018-10-10 15:39:35', 'admin', 'form_areas_generador', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 17||--> fields <-- descripcion (new)  : Prueba 2||id_zona (new)  : 1');
INSERT INTO `sc_log` VALUES (94, '2018-10-10 15:42:46', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (95, '2018-10-10 15:42:53', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (96, '2018-10-10 15:43:00', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (97, '2018-10-10 15:43:14', 'admin', 'form_areas_generador', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 1||--> fields <-- descripcion (old)  : ÁREA SOCIAL DE P. BAJA||descripcion (new)  : ÁREA SOCIAL DE Planta BAJA');
INSERT INTO `sc_log` VALUES (98, '2018-10-10 15:44:17', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (99, '2018-10-10 15:45:14', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- codigo (new)  : 1||persona_moral (new)  : francisco rdz||razon_social (new)  : francisco rdz||nombre (new)  : francisco||ap_paterno (new)  : rdz||ap_materno (new)  : rdz||tipo_proveedor (new)  : 1||tipo_moneda (new)  : 2||rfc (new)  : 23||ciudad (new)  : 23||flag_activo (new)  : 1||tb_sec_users_login (new)  : supervisor1||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 15:45:14||mail (new)  : supervisro@origne.com');
INSERT INTO `sc_log` VALUES (100, '2018-10-10 15:57:10', 'admin', 'form_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (101, '2018-10-10 15:58:38', 'admin', 'form_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (102, '2018-10-10 15:59:35', 'admin', 'form_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (103, '2018-10-10 16:00:13', 'admin', 'form_residentes', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- codigo (new)  : 1||persona_moral (new)  : juan rdz||razon_social (new)  : juan rdz||nombre (new)  : juan ||ap_paterno (new)  : rdz||ap_materno (new)  : rdz||tipo_proveedor (new)  : 1||tipo_moneda (new)  : 1||rfc (new)  : 121||ciudad (new)  : 22||flag_activo (new)  : 1||tb_sec_users_login (new)  : residente||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 16:00:13||mail (new)  : residente@origien.com');
INSERT INTO `sc_log` VALUES (104, '2018-10-10 16:05:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (105, '2018-10-10 16:05:13', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (106, '2018-10-10 16:05:23', 'admin', 'App_sync_apps', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (107, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_administradores||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (108, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_contratistas||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (109, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_residentes||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (110, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_supervisores||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (111, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_administradores||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (112, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_Conceptos_Pendientes||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (113, '2018-10-10 16:05:54', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_contratistas||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (114, '2018-10-10 16:06:05', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_residentes||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (115, '2018-10-10 16:06:05', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_supervisores||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (116, '2018-10-10 16:06:07', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (117, '2018-10-10 16:06:11', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (118, '2018-10-10 16:06:15', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (119, '2018-10-10 16:06:18', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (120, '2018-10-10 16:06:19', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (121, '2018-10-10 16:06:20', 'admin', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (122, '2018-10-10 16:07:49', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (123, '2018-10-10 16:07:55', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (124, '2018-10-10 16:07:59', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (125, '2018-10-10 16:08:11', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (126, '2018-10-10 16:08:50', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (127, '2018-10-10 16:08:54', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (128, '2018-10-10 16:08:57', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (129, '2018-10-10 16:09:00', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (130, '2018-10-10 16:11:38', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (131, '2018-10-10 16:12:32', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (132, '2018-10-10 16:12:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (133, '2018-10-10 16:12:47', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (134, '2018-10-10 16:12:53', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (135, '2018-10-10 16:12:55', 'admin', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (136, '2018-10-10 16:14:00', 'admin', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- codigo (new)  : 1||persona_moral (new)  : Juan Francisco Ramirez||razon_social (new)  : Juan Francisco Ramirez||nombre (new)  : Juan Francisco||ap_paterno (new)  : Ramirez||ap_materno (new)  : Martinez||tipo_proveedor (new)  : 1||tipo_moneda (new)  : 1||rfc (new)  : 23243||ciudad (new)  : ||usuario_modifica (new)  : admin||fecha_modifica (new)  : 2018-10-10 16:14:00||id_familia (new)  : 85');
INSERT INTO `sc_log` VALUES (137, '2018-10-10 16:14:05', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (138, '2018-10-10 16:21:40', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (139, '2018-10-10 16:29:38', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (140, '2018-10-10 16:29:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (141, '2018-10-10 16:30:08', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (142, '2018-10-10 16:30:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (143, '2018-10-10 16:30:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (144, '2018-10-10 16:30:24', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (145, '2018-10-10 16:30:29', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (146, '2018-10-10 16:31:01', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (147, '2018-10-10 16:31:04', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (148, '2018-10-10 16:31:30', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (149, '2018-10-10 16:43:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (150, '2018-10-10 16:43:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (151, '2018-10-10 16:43:28', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (152, '2018-10-10 16:44:06', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (153, '2018-10-10 16:44:10', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (154, '2018-10-10 16:44:14', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (155, '2018-10-10 16:45:16', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (156, '2018-10-10 16:45:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (157, '2018-10-10 16:45:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (158, '2018-10-10 16:45:54', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (159, '2018-10-10 16:46:59', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (160, '2018-10-10 16:47:46', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (161, '2018-10-10 16:47:51', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (162, '2018-10-10 16:47:57', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (163, '2018-10-10 16:48:01', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (164, '2018-10-10 17:09:42', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (165, '2018-10-10 17:10:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (166, '2018-10-10 17:10:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (167, '2018-10-10 17:11:02', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (168, '2018-10-10 17:11:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (169, '2018-10-10 17:11:49', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (170, '2018-10-10 17:12:38', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (171, '2018-10-10 17:15:08', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (172, '2018-10-10 17:26:26', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (173, '2018-10-10 17:26:37', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (174, '2018-10-10 17:26:44', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (175, '2018-10-10 17:31:39', '', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (176, '2018-10-10 17:37:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (177, '2018-10-10 17:37:17', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (178, '2018-10-10 17:38:07', 'admin', 'form_conceptos_areas', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_concepto (new)  : 304-ALBA-01||id_area (new)  : 1');
INSERT INTO `sc_log` VALUES (179, '2018-10-10 17:38:40', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (180, '2018-10-10 18:00:59', '2', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:00:59||usuario_modifica (old)  : ||usuario_modifica (new)  : 2');
INSERT INTO `sc_log` VALUES (181, '2018-10-10 18:02:46', 'e', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (182, '2018-10-10 18:03:07', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (183, '2018-10-10 18:05:01', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (184, '2018-10-10 18:07:50', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (185, '2018-10-10 18:08:18', 'supervisor1', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 5||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:08:18||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1||estatus (old)  : 4||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (186, '2018-10-10 18:09:25', 'supervisor1', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 6||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:09:25||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1||estatus (old)  : 4||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (187, '2018-10-10 18:11:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (188, '2018-10-10 18:11:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (189, '2018-10-10 18:11:39', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (190, '2018-10-10 18:11:48', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (191, '2018-10-10 18:16:33', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (192, '2018-10-10 18:22:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (193, '2018-10-10 18:22:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (194, '2018-10-10 18:22:15', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (195, '2018-10-10 18:31:57', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 7||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:31:57||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 4||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (196, '2018-10-10 18:33:12', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 8||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:33:12||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 4||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (197, '2018-10-10 18:36:13', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modificacion (old)  : 2018-10-10||fecha_modificacion (new)  : 2018-10-10 18:36:13||usuario_modifica (old)  : 2||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 5');
INSERT INTO `sc_log` VALUES (198, '2018-10-10 18:44:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (199, '2018-10-10 18:44:25', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (200, '2018-10-10 18:44:30', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (201, '2018-10-10 18:45:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (202, '2018-10-10 18:45:35', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (203, '2018-10-10 18:45:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (204, '2018-10-10 18:45:42', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (205, '2018-10-10 18:45:55', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (206, '2018-10-10 18:46:18', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (207, '2018-10-10 18:46:46', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (208, '2018-10-10 18:46:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (209, '2018-10-10 18:46:57', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (210, '2018-10-10 18:47:02', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (211, '2018-10-10 18:47:23', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (212, '2018-10-10 18:48:14', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 9||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:48:14||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 4||estatus (new)  : 1');
INSERT INTO `sc_log` VALUES (213, '2018-10-10 18:48:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (214, '2018-10-10 18:50:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (215, '2018-10-10 18:50:34', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (216, '2018-10-10 18:50:41', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (217, '2018-10-10 18:50:43', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (218, '2018-10-10 18:50:49', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (219, '2018-10-10 18:51:04', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:51:04||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 1');
INSERT INTO `sc_log` VALUES (220, '2018-10-10 18:51:14', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-10 18:51:14||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 2');
INSERT INTO `sc_log` VALUES (221, '2018-10-10 18:52:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (222, '2018-10-10 18:52:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (223, '2018-10-10 18:52:39', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (224, '2018-10-10 18:53:00', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (225, '2018-10-10 18:53:06', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (226, '2018-10-10 18:53:12', 'supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (227, '2018-10-10 19:02:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (228, '2018-10-10 19:02:29', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:admin');
INSERT INTO `sc_log` VALUES (229, '2018-10-10 19:02:33', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (230, '2018-10-10 19:02:43', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (231, '2018-10-10 19:04:13', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (232, '2018-10-10 19:04:19', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (233, '2018-10-10 19:04:24', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (234, '2018-10-10 19:04:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (235, '2018-10-10 19:04:38', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (236, '2018-10-10 19:04:43', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (237, '2018-10-11 11:01:29', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (238, '2018-10-11 11:01:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (239, '2018-10-11 11:01:46', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (240, '2018-10-11 11:03:14', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (241, '2018-10-11 11:05:04', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (242, '2018-10-11 11:05:24', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-11 11:05:24||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (243, '2018-10-11 11:08:11', 'sbeastian', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (244, '2018-10-11 11:09:15', 'sbeastian', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (245, '2018-10-11 11:16:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (246, '2018-10-11 11:16:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (247, '2018-10-11 11:16:26', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (248, '2018-10-11 11:16:47', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (249, '2018-10-11 11:16:51', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (250, '2018-10-11 11:16:59', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (251, '2018-10-11 11:17:06', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (252, '2018-10-11 11:20:19', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (253, '2018-10-11 11:20:21', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (254, '2018-10-11 11:20:22', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (255, '2018-10-11 11:20:29', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (256, '2018-10-11 11:21:13', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (257, '2018-10-11 11:21:14', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (258, '2018-10-11 11:21:15', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (259, '2018-10-11 11:21:16', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (260, '2018-10-11 11:21:17', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (261, '2018-10-11 11:21:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (262, '2018-10-11 11:21:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (263, '2018-10-11 11:21:23', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (264, '2018-10-11 11:21:45', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (265, '2018-10-11 11:21:46', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (266, '2018-10-11 11:21:47', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (267, '2018-10-11 11:21:48', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (268, '2018-10-11 11:22:07', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (269, '2018-10-11 11:22:48', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (270, '2018-10-11 11:24:05', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (271, '2018-10-11 11:24:06', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (272, '2018-10-11 11:24:08', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (273, '2018-10-11 11:24:12', 'sbeastian', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- user (new)  : sbeastian||observacion (new)  : Prueba 1||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (274, '2018-10-11 11:24:33', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (275, '2018-10-11 11:24:52', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (276, '2018-10-11 11:25:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (277, '2018-10-11 11:25:30', 'Supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (278, '2018-10-11 11:25:33', 'Supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (279, '2018-10-11 11:25:42', 'Supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (280, '2018-10-11 11:25:48', 'Supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (281, '2018-10-11 11:25:55', 'Supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (282, '2018-10-11 11:26:27', 'Supervisor1', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 11||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-11 11:26:27||usuario_modifica (old)  : ||usuario_modifica (new)  : Supervisor1||estatus (old)  : 4||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (283, '2018-10-11 11:26:45', 'Supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (284, '2018-10-11 11:26:46', 'Supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (285, '2018-10-11 11:27:03', 'Supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (286, '2018-10-11 11:27:04', 'Supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (287, '2018-10-11 11:27:05', 'Supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (288, '2018-10-11 11:28:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (289, '2018-10-11 11:28:13', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (290, '2018-10-11 11:28:16', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (291, '2018-10-11 11:28:47', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 11||--> fields <-- fecha_modificacion (old)  : 2018-10-11||fecha_modificacion (new)  : 2018-10-11 11:28:47||usuario_modifica (old)  : Supervisor1||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 5');
INSERT INTO `sc_log` VALUES (292, '2018-10-11 11:28:52', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (293, '2018-10-11 11:29:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (294, '2018-10-11 11:29:15', 'Supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (295, '2018-10-11 11:29:18', 'Supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (296, '2018-10-11 11:29:42', 'Supervisor1', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 11||--> fields <-- fecha_modificacion (old)  : 2018-10-11||fecha_modificacion (new)  : 2018-10-11 11:29:42||usuario_modifica (old)  : admin||usuario_modifica (new)  : Supervisor1||estatus (old)  : 5||estatus (new)  : 3');
INSERT INTO `sc_log` VALUES (297, '2018-10-11 11:29:45', 'Supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (298, '2018-10-11 11:29:51', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (299, '2018-10-11 11:29:55', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (300, '2018-10-11 11:29:57', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (301, '2018-10-11 11:29:58', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (302, '2018-10-11 11:30:11', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 11||--> fields <-- fecha_modificacion (old)  : 2018-10-11||fecha_modificacion (new)  : 2018-10-11 11:30:11||usuario_modifica (old)  : Supervisor1||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 1');
INSERT INTO `sc_log` VALUES (303, '2018-10-11 11:30:12', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (304, '2018-10-11 11:30:16', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (305, '2018-10-11 11:30:28', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (306, '2018-10-11 11:30:34', 'Supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (307, '2018-10-11 11:30:37', 'Supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (308, '2018-10-11 11:55:31', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (309, '2018-10-11 11:55:35', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (310, '2018-10-11 11:57:33', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (311, '2018-10-11 12:11:10', '1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (312, '2018-10-11 12:15:18', '1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (313, '2018-10-11 12:15:20', '1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (314, '2018-10-11 12:15:22', '1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (315, '2018-10-11 12:21:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (316, '2018-10-11 12:21:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (317, '2018-10-11 12:21:10', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (318, '2018-10-11 12:21:17', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (319, '2018-10-11 12:22:58', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (320, '2018-10-11 12:23:03', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (321, '2018-10-11 12:24:46', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (322, '2018-10-11 12:24:55', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (323, '2018-10-11 12:24:59', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (324, '2018-10-11 12:25:07', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (325, '2018-10-11 12:25:35', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (326, '2018-10-11 12:27:21', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (327, '2018-10-11 12:27:47', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (328, '2018-10-11 12:27:50', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (329, '2018-10-11 12:32:30', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (330, '2018-10-11 12:35:11', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (331, '2018-10-11 12:36:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (332, '2018-10-11 12:36:45', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (333, '2018-10-11 12:36:52', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (334, '2018-10-11 12:39:02', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (335, '2018-10-11 12:41:32', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (336, '2018-10-11 12:41:47', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (337, '2018-10-11 12:41:49', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (338, '2018-10-11 12:42:25', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (339, '2018-10-11 12:42:26', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (340, '2018-10-11 12:42:34', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- user (new)  : admin||observacion (new)  : test||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (341, '2018-10-11 12:42:38', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (342, '2018-10-11 12:42:40', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (343, '2018-10-11 12:42:44', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- user (new)  : admin||observacion (new)  : test||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (344, '2018-10-11 12:44:33', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (345, '2018-10-11 12:45:29', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (346, '2018-10-11 12:45:31', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (347, '2018-10-11 12:45:38', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- user (new)  : admin||observacion (new)  : test||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (348, '2018-10-11 12:45:47', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (349, '2018-10-11 12:46:11', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (350, '2018-10-11 12:46:41', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (351, '2018-10-11 12:47:35', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (352, '2018-10-11 12:47:49', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (353, '2018-10-11 12:48:03', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (354, '2018-10-11 12:48:17', '1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (355, '2018-10-11 12:48:18', '1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (356, '2018-10-11 12:48:21', '1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- user (new)  : 1||observacion (new)  : w4||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (357, '2018-10-11 12:48:25', '1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- user (new)  : 1||observacion (new)  : ||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 0');
INSERT INTO `sc_log` VALUES (358, '2018-10-11 12:52:15', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (359, '2018-10-11 12:52:30', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (360, '2018-10-11 12:52:45', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (361, '2018-10-11 12:52:51', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (362, '2018-10-11 12:52:54', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (363, '2018-10-11 12:52:58', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- user (new)  : admin||observacion (new)  : test||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 1');
INSERT INTO `sc_log` VALUES (364, '2018-10-11 12:53:01', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (365, '2018-10-11 12:53:54', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (366, '2018-10-11 12:53:55', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (367, '2018-10-11 12:54:02', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (368, '2018-10-11 12:54:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (369, '2018-10-11 12:55:27', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (370, '2018-10-11 12:56:23', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (371, '2018-10-11 12:56:33', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (372, '2018-10-11 12:57:27', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (373, '2018-10-11 12:57:30', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (374, '2018-10-11 12:57:31', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (375, '2018-10-11 12:57:35', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- user (new)  : admin||observacion (new)  : test3||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 1');
INSERT INTO `sc_log` VALUES (376, '2018-10-11 12:58:51', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (377, '2018-10-11 12:59:08', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (378, '2018-10-11 13:02:22', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (379, '2018-10-11 13:04:02', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (380, '2018-10-11 13:04:51', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (381, '2018-10-11 13:04:56', '1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (382, '2018-10-11 13:05:05', '1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (383, '2018-10-11 13:20:33', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (384, '2018-10-11 13:20:41', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (385, '2018-10-11 13:20:56', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (386, '2018-10-11 13:21:00', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (387, '2018-10-11 13:30:03', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (388, '2018-10-11 13:30:07', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (389, '2018-10-11 13:30:12', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (390, '2018-10-11 13:31:58', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modifica (old)  : 2018-10-11||fecha_modifica (new)  : 2018-10-11 13:31:58');
INSERT INTO `sc_log` VALUES (391, '2018-10-11 13:32:13', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (392, '2018-10-11 13:33:13', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (393, '2018-10-11 13:35:39', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (394, '2018-10-11 13:35:43', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (395, '2018-10-11 13:35:46', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (396, '2018-10-11 13:35:58', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (397, '2018-10-11 13:36:49', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (398, '2018-10-11 13:36:55', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (399, '2018-10-11 13:36:58', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (400, '2018-10-11 13:37:03', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (401, '2018-10-11 13:37:06', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (402, '2018-10-11 13:37:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (403, '2018-10-11 13:37:21', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (404, '2018-10-11 13:37:53', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (405, '2018-10-11 13:38:31', '1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (406, '2018-10-11 13:41:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (407, '2018-10-11 13:41:10', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (408, '2018-10-11 13:41:36', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (409, '2018-10-11 13:41:47', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (410, '2018-10-11 13:41:51', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (411, '2018-10-11 13:41:55', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (412, '2018-10-11 13:41:58', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (413, '2018-10-11 13:42:02', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (414, '2018-10-11 13:42:06', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (415, '2018-10-11 13:42:51', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (416, '2018-10-11 13:43:02', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (417, '2018-10-11 13:43:17', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (418, '2018-10-11 13:52:21', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (419, '2018-10-11 13:52:45', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (420, '2018-10-11 13:53:14', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (421, '2018-10-11 13:54:43', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (422, '2018-10-11 13:57:54', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (423, '2018-10-11 13:58:20', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (424, '2018-10-11 13:59:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (425, '2018-10-11 13:59:28', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (426, '2018-10-11 13:59:32', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (427, '2018-10-11 13:59:37', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 5||--> fields <-- user (new)  : admin||observacion (new)  : test34||fecha (new)  : 2018-10-11||id_detalle_contrato (new)  : 1');
INSERT INTO `sc_log` VALUES (428, '2018-10-11 13:59:38', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (429, '2018-10-11 14:00:01', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (430, '2018-10-11 14:00:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (431, '2018-10-11 14:00:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (432, '2018-10-11 14:00:26', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (433, '2018-10-11 14:00:29', 'supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (434, '2018-10-11 14:00:37', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (435, '2018-10-11 14:00:42', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (436, '2018-10-11 14:02:07', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (437, '2018-10-11 14:20:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (438, '2018-10-11 14:20:59', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (439, '2018-10-11 14:21:04', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (440, '2018-10-11 14:21:17', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (441, '2018-10-11 14:21:37', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (442, '2018-10-11 15:22:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (443, '2018-10-11 15:22:24', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (444, '2018-10-11 15:22:29', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (445, '2018-10-11 15:22:54', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (446, '2018-10-11 15:24:17', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (447, '2018-10-11 15:26:24', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (448, '2018-10-11 15:34:33', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (449, '2018-10-11 15:34:42', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (450, '2018-10-11 15:34:45', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (451, '2018-10-11 15:34:47', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (452, '2018-10-11 15:41:17', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (453, '2018-10-11 15:41:22', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (454, '2018-10-11 15:46:52', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (455, '2018-10-11 15:47:04', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (456, '2018-10-11 15:48:31', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (457, '2018-10-11 15:48:36', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (458, '2018-10-11 15:48:58', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (459, '2018-10-11 15:49:04', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (460, '2018-10-11 15:50:47', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (461, '2018-10-11 15:52:40', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (462, '2018-10-11 15:54:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (463, '2018-10-11 15:57:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (464, '2018-10-11 15:59:12', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (465, '2018-10-11 16:00:39', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (466, '2018-10-11 16:00:39', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (467, '2018-10-11 16:02:48', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (468, '2018-10-11 16:05:41', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (469, '2018-10-11 16:06:44', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (470, '2018-10-11 16:06:49', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (471, '2018-10-11 16:08:47', 'supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (472, '2018-10-11 16:11:56', 'supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (473, '2018-10-11 16:13:20', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (474, '2018-10-11 16:13:27', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (475, '2018-10-11 16:15:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (476, '2018-10-11 16:15:41', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (477, '2018-10-11 16:15:49', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (478, '2018-10-11 16:17:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (479, '2018-10-11 16:19:07', '', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (480, '2018-10-11 16:19:14', '', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (481, '2018-10-11 16:22:29', '', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (482, '2018-10-11 16:24:44', '', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (483, '2018-10-11 16:28:16', '', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (484, '2018-10-11 16:28:28', '', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (485, '2018-10-11 16:28:35', '', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (486, '2018-10-11 16:31:09', '', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (487, '2018-10-11 16:32:29', '', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (488, '2018-10-11 16:46:04', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (489, '2018-10-11 16:46:22', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (490, '2018-10-11 16:46:32', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (491, '2018-10-11 16:51:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (492, '2018-10-11 16:51:43', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (493, '2018-10-11 16:53:59', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (494, '2018-10-11 16:54:03', 'admin', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (495, '2018-10-11 16:54:07', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (496, '2018-10-11 17:01:46', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (497, '2018-10-11 17:01:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (498, '2018-10-11 17:09:03', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (499, '2018-10-11 17:09:07', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (500, '2018-10-11 17:18:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (501, '2018-10-11 17:18:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (502, '2018-10-11 17:19:45', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (503, '2018-10-11 17:20:44', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (504, '2018-10-11 17:20:45', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (505, '2018-10-11 17:20:46', 'supervisor1', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (506, '2018-10-11 17:26:57', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (507, '2018-10-11 17:28:35', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (508, '2018-10-11 17:31:36', 'admin', 'form_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (509, '2018-10-11 17:35:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (510, '2018-10-11 17:35:28', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (511, '2018-10-11 17:36:20', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (512, '2018-10-11 17:37:24', 'admin', 'form_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (513, '2018-10-11 17:45:44', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (514, '2018-10-11 17:45:51', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (515, '2018-10-11 17:47:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (516, '2018-10-11 17:48:16', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (517, '2018-10-11 17:48:17', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (518, '2018-10-11 17:48:20', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (519, '2018-10-11 17:48:24', 'admin', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (520, '2018-10-11 17:48:28', 'admin', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (521, '2018-10-11 17:48:29', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (522, '2018-10-11 17:48:29', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (523, '2018-10-11 17:48:43', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (524, '2018-10-11 17:48:45', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (525, '2018-10-11 17:48:56', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (526, '2018-10-11 17:49:02', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (527, '2018-10-11 17:49:08', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (528, '2018-10-11 17:49:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (529, '2018-10-11 18:27:09', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (530, '2018-10-11 18:30:55', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (531, '2018-10-15 10:21:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (532, '2018-10-15 10:21:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (533, '2018-10-15 10:22:52', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Amorada 3||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 10:22:52||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (534, '2018-10-15 10:38:33', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Amorada 4||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 10:38:33||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (535, '2018-10-15 15:37:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (536, '2018-10-15 15:37:53', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (537, '2018-10-15 15:38:22', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 5||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Amorada 5||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 15:38:22||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (538, '2018-10-15 16:18:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (539, '2018-10-15 16:18:24', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (540, '2018-10-15 16:24:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (541, '2018-10-15 16:24:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (542, '2018-10-15 16:29:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (543, '2018-10-15 16:29:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (544, '2018-10-15 16:29:29', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (545, '2018-10-15 16:48:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (546, '2018-10-15 16:48:23', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:admin');
INSERT INTO `sc_log` VALUES (547, '2018-10-15 16:48:29', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (548, '2018-10-15 16:49:01', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 12||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : ||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 16:48:58||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (549, '2018-10-15 16:52:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (550, '2018-10-15 16:53:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (551, '2018-10-15 16:53:12', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (552, '2018-10-15 16:53:35', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 13||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Contrato Amorada||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 16:53:32||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (553, '2018-10-15 17:00:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (554, '2018-10-15 17:00:52', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (555, '2018-10-15 17:01:53', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 14||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Sala comedor||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 17:01:50||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (556, '2018-10-15 17:09:25', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (557, '2018-10-15 17:09:32', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (558, '2018-10-15 17:09:58', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 15||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Contrato Amorada 2||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 17:09:55||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (559, '2018-10-15 17:42:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (560, '2018-10-15 17:42:42', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (561, '2018-10-15 17:43:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (562, '2018-10-15 17:43:41', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (563, '2018-10-15 17:45:51', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (564, '2018-10-15 17:45:57', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (565, '2018-10-15 17:46:18', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 16||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Amorada 3||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 17:46:18||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (566, '2018-10-15 17:52:22', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (567, '2018-10-15 17:52:32', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (568, '2018-10-15 17:53:06', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 17||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Recamara 2||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 17:53:06||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (569, '2018-10-15 17:54:23', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 18||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-15||descripcion (new)  : Contrato Amorada 2||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-15 17:54:19||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (570, '2018-10-16 10:02:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (571, '2018-10-16 10:02:45', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (572, '2018-10-16 10:03:24', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 19||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-16||descripcion (new)  : Contrato Amorada 10||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-16 10:03:20||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (573, '2018-10-16 10:13:15', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (574, '2018-10-16 10:13:46', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (575, '2018-10-16 10:14:21', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (576, '2018-10-16 10:14:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (577, '2018-10-16 10:14:41', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (578, '2018-10-16 10:14:44', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (579, '2018-10-16 10:37:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (580, '2018-10-16 10:38:12', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (581, '2018-10-16 10:38:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (582, '2018-10-16 10:38:25', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (583, '2018-10-16 10:38:50', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (584, '2018-10-16 10:45:07', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (585, '2018-10-16 10:45:14', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (586, '2018-10-16 10:45:22', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (587, '2018-10-16 10:45:24', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (588, '2018-10-16 10:46:34', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (589, '2018-10-16 10:46:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (590, '2018-10-16 10:46:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (591, '2018-10-16 10:46:50', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (592, '2018-10-16 10:58:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (593, '2018-10-16 11:00:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (594, '2018-10-16 11:00:26', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (595, '2018-10-16 11:02:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (596, '2018-10-16 11:02:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (597, '2018-10-16 11:02:43', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (598, '2018-10-16 11:24:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (599, '2018-10-16 11:24:14', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (600, '2018-10-16 11:24:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (601, '2018-10-16 11:25:29', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (602, '2018-10-16 11:25:36', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (603, '2018-10-16 11:25:39', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (604, '2018-10-16 11:32:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (605, '2018-10-16 11:32:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (606, '2018-10-16 11:32:11', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (607, '2018-10-16 11:32:50', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (608, '2018-10-16 11:32:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (609, '2018-10-16 11:33:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (610, '2018-10-16 11:33:15', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (611, '2018-10-16 11:35:49', '[usr_login]', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- id_concepto (old)  : 304-ALBA-01||id_concepto (new)  : 16||total (old)  : 0||total (new)  : 2||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : [usr_login]');
INSERT INTO `sc_log` VALUES (612, '2018-10-16 11:44:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (613, '2018-10-16 11:45:07', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (614, '2018-10-16 11:45:33', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (615, '2018-10-16 11:45:50', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (616, '2018-10-16 11:50:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (617, '2018-10-16 11:55:27', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (618, '2018-10-16 11:55:37', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (619, '2018-10-16 11:55:52', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (620, '2018-10-16 11:57:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (621, '2018-10-16 11:57:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (622, '2018-10-16 11:57:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (623, '2018-10-16 11:57:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (624, '2018-10-16 11:58:34', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (625, '2018-10-16 11:59:02', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 20||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-16||descripcion (new)  : Amorada 100||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-16 11:58:59||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (626, '2018-10-16 11:59:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (627, '2018-10-16 11:59:17', 'supervisor', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (628, '2018-10-16 11:59:21', 'supervisor', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (629, '2018-10-16 11:59:29', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (630, '2018-10-16 11:59:34', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (631, '2018-10-16 11:59:37', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (632, '2018-10-16 12:12:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (633, '2018-10-16 12:12:38', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (634, '2018-10-16 12:12:42', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (635, '2018-10-16 12:15:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (636, '2018-10-16 12:15:19', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (637, '2018-10-16 12:15:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (638, '2018-10-16 12:15:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (639, '2018-10-16 12:17:02', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (640, '2018-10-16 12:17:34', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 21||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-16||descripcion (new)  : Contrato Amorada 900||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-16 12:17:31||usuario_modifica (new)  : francisco rdz rdz||IdUserRegistro (new)  : francisco rdz rdz||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (641, '2018-10-16 12:17:53', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (642, '2018-10-16 12:18:39', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (643, '2018-10-16 12:18:45', '', 'App_retrieve_pswd', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (644, '2018-10-16 12:18:50', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (645, '2018-10-16 12:18:55', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (646, '2018-10-16 12:30:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (647, '2018-10-16 12:30:19', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (648, '2018-10-16 12:30:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (649, '2018-10-16 12:30:45', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (650, '2018-10-16 12:31:24', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 22||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-16||descripcion (new)  : Contrato Amorada 09||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-16 12:31:21||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (651, '2018-10-16 12:31:51', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (652, '2018-10-16 12:34:10', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (653, '2018-10-16 12:42:43', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (654, '2018-10-16 12:48:01', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (655, '2018-10-16 12:50:30', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (656, '2018-10-16 12:51:29', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (657, '2018-10-16 12:52:03', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (658, '2018-10-16 12:52:31', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (659, '2018-10-16 12:55:37', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (660, '2018-10-16 12:55:59', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (661, '2018-10-16 14:29:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (662, '2018-10-16 14:29:34', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (663, '2018-10-16 14:29:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (664, '2018-10-16 14:29:48', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (665, '2018-10-16 14:29:54', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (666, '2018-10-16 14:30:24', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (667, '2018-10-16 14:30:24', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (668, '2018-10-16 14:30:42', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (669, '2018-10-16 14:34:42', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (670, '2018-10-16 14:49:17', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (671, '2018-10-16 14:52:53', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (672, '2018-10-16 14:53:38', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (673, '2018-10-16 15:03:05', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (674, '2018-10-16 15:03:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (675, '2018-10-16 15:03:22', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (676, '2018-10-16 15:03:29', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (677, '2018-10-16 15:05:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (678, '2018-10-16 15:05:21', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (679, '2018-10-16 15:05:26', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (680, '2018-10-16 15:07:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (681, '2018-10-16 15:07:56', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (682, '2018-10-16 15:08:00', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (683, '2018-10-16 15:12:03', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (684, '2018-10-16 15:12:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (685, '2018-10-16 15:12:51', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (686, '2018-10-16 15:12:54', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (687, '2018-10-16 15:23:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (688, '2018-10-16 15:23:44', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (689, '2018-10-16 15:23:46', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (690, '2018-10-16 15:24:50', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (691, '2018-10-16 15:25:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (692, '2018-10-16 15:25:02', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (693, '2018-10-16 15:26:13', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (694, '2018-10-16 15:26:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (695, '2018-10-16 15:26:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (696, '2018-10-16 15:26:26', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (697, '2018-10-16 15:26:51', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (698, '2018-10-16 15:27:22', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (699, '2018-10-16 15:27:26', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (700, '2018-10-16 15:27:31', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (701, '2018-10-16 15:27:34', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (702, '2018-10-16 15:29:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (703, '2018-10-16 15:29:31', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (704, '2018-10-16 15:29:40', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (705, '2018-10-16 15:32:14', '[usr_login]', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : form_generador_contrato||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (706, '2018-10-16 15:32:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (707, '2018-10-16 15:32:41', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (708, '2018-10-16 15:32:44', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (709, '2018-10-16 15:33:15', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (710, '2018-10-16 15:33:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (711, '2018-10-16 15:33:50', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (712, '2018-10-16 15:34:28', '[usr_login]', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- id_concepto (old)  : 304-ALBA-01||id_concepto (new)  : 16||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : [usr_login]');
INSERT INTO `sc_log` VALUES (713, '2018-10-16 15:36:03', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (714, '2018-10-16 15:36:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (715, '2018-10-16 15:39:27', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (716, '2018-10-16 15:39:34', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (717, '2018-10-16 15:41:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (718, '2018-10-16 15:41:31', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (719, '2018-10-16 15:41:36', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (720, '2018-10-16 15:42:05', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (721, '2018-10-16 15:43:04', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (722, '2018-10-16 15:46:45', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (723, '2018-10-16 15:47:18', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (724, '2018-10-16 15:47:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (725, '2018-10-16 15:47:28', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (726, '2018-10-16 15:47:30', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (727, '2018-10-16 15:48:01', '[usr_login]', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (728, '2018-10-16 15:48:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (729, '2018-10-16 15:48:58', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (730, '2018-10-16 15:49:03', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (731, '2018-10-16 15:49:22', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (732, '2018-10-16 15:52:53', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- id_concepto (old)  : 304-ALBA-01||id_concepto (new)  : 16||total (old)  : 0||total (new)  : 3||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (733, '2018-10-16 15:54:50', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (734, '2018-10-16 15:56:10', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (735, '2018-10-16 15:57:17', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 4||--> fields <-- id_concepto (old)  : 304-ALBA-01||id_concepto (new)  : 16||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (736, '2018-10-16 15:57:52', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (737, '2018-10-16 15:58:08', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (738, '2018-10-16 16:01:54', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (739, '2018-10-16 16:03:15', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 5||--> fields <-- id_concepto (old)  : 304-ALBA-01||id_concepto (new)  : 16||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (740, '2018-10-16 16:07:08', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (741, '2018-10-16 16:09:34', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (742, '2018-10-16 16:09:49', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 6||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-16||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (743, '2018-10-16 16:17:25', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (744, '2018-10-16 16:28:39', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (745, '2018-10-17 10:19:02', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (746, '2018-10-17 10:19:39', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (747, '2018-10-17 10:27:01', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (748, '2018-10-17 10:27:10', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (749, '2018-10-17 10:27:14', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (750, '2018-10-17 10:27:55', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 6||--> fields <-- total (old)  : 0||total (new)  : 1||fecha_modifica (old)  : 2018-10-16||fecha_modifica (new)  : 2018-10-17');
INSERT INTO `sc_log` VALUES (751, '2018-10-17 10:46:27', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (752, '2018-10-17 11:22:39', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (753, '2018-10-17 11:22:49', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (754, '2018-10-17 11:22:58', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (755, '2018-10-17 11:23:05', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (756, '2018-10-17 11:25:53', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (757, '2018-10-17 11:25:59', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (758, '2018-10-17 11:26:54', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (759, '2018-10-17 11:27:00', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (760, '2018-10-17 11:31:16', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (761, '2018-10-17 11:31:22', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (762, '2018-10-17 11:34:39', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (763, '2018-10-17 11:34:47', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (764, '2018-10-17 11:37:06', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 23||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-17||descripcion (new)  : Amorada590||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-17 11:37:01||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (765, '2018-10-17 11:53:23', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (766, '2018-10-17 12:11:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (767, '2018-10-17 12:12:48', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (768, '2018-10-17 12:12:56', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (769, '2018-10-17 12:14:45', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (770, '2018-10-17 12:15:07', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (771, '2018-10-17 12:15:14', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (772, '2018-10-17 12:16:22', 'admin', 'form_conceptos_areas', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- id_concepto (new)  : 301-ADM-001||id_area (new)  : 1');
INSERT INTO `sc_log` VALUES (773, '2018-10-17 12:16:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (774, '2018-10-17 12:16:53', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (775, '2018-10-17 12:17:16', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (776, '2018-10-17 12:40:01', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (777, '2018-10-17 12:40:08', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (778, '2018-10-17 12:40:16', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (779, '2018-10-17 12:40:40', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1922||--> fields <-- total (old)  : 0||total (new)  : 12||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-17||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (780, '2018-10-17 12:52:02', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (781, '2018-10-17 12:52:10', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (782, '2018-10-17 12:52:13', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (783, '2018-10-17 12:52:34', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1922||--> fields <-- total (old)  : 12||total (new)  : 16');
INSERT INTO `sc_log` VALUES (784, '2018-10-17 12:53:56', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (785, '2018-10-17 15:06:44', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (786, '2018-10-17 15:06:54', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (787, '2018-10-17 15:07:02', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (788, '2018-10-17 15:07:24', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1922||--> fields <-- total (old)  : 16||total (new)  : 19');
INSERT INTO `sc_log` VALUES (789, '2018-10-17 15:08:06', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (790, '2018-10-17 15:13:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (791, '2018-10-17 15:13:46', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (792, '2018-10-17 15:13:51', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (793, '2018-10-17 15:14:12', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (794, '2018-10-17 15:30:27', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (795, '2018-10-17 15:35:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (796, '2018-10-17 15:35:59', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (797, '2018-10-17 15:37:09', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (798, '2018-10-17 15:39:50', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (799, '2018-10-17 15:57:27', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (800, '2018-10-17 15:57:42', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (801, '2018-10-17 16:02:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (802, '2018-10-17 16:03:12', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (803, '2018-10-17 16:07:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (804, '2018-10-17 16:07:28', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (805, '2018-10-17 16:15:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (806, '2018-10-17 16:15:22', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (807, '2018-10-17 16:19:01', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (808, '2018-10-17 16:19:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (809, '2018-10-17 16:19:34', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (810, '2018-10-17 16:20:02', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (811, '2018-10-17 16:44:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (812, '2018-10-17 16:44:59', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (813, '2018-10-18 10:04:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (814, '2018-10-18 10:05:25', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (815, '2018-10-18 10:05:49', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1922||--> fields <-- total (old)  : 19||total (new)  : 56||fecha_modifica (old)  : 2018-10-17||fecha_modifica (new)  : 2018-10-18');
INSERT INTO `sc_log` VALUES (816, '2018-10-18 10:48:37', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 128||--> fields <-- id_contrato (new)  : 23||concepto (new)  : 301-ADM-001||cantidad (new)  : 12||importe_renglon (new)  : 288||costo_actual (new)  : 0||tipo_concepto (new)  : B||clave_contrato (new)  : ||fecha_modificacion (new)  : 2018-10-18 10:48:37||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 0||comentarios (new)  : ');
INSERT INTO `sc_log` VALUES (817, '2018-10-18 11:17:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (818, '2018-10-18 11:17:14', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (819, '2018-10-18 11:18:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (820, '2018-10-18 11:18:38', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (821, '2018-10-18 11:21:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (822, '2018-10-18 11:21:20', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (823, '2018-10-18 11:23:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (824, '2018-10-18 11:26:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (825, '2018-10-18 11:29:48', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (826, '2018-10-18 11:29:54', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (827, '2018-10-18 11:32:33', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (828, '2018-10-18 11:32:38', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (829, '2018-10-18 11:34:42', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 129||--> fields <-- id_contrato (new)  : 23||concepto (new)  : 168||cantidad (new)  : 12||importe_renglon (new)  : 288||costo_actual (new)  : 0||tipo_concepto (new)  : B||clave_contrato (new)  : ||fecha_modificacion (new)  : 2018-10-18 11:34:42||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 0||comentarios (new)  : ');
INSERT INTO `sc_log` VALUES (830, '2018-10-18 11:44:55', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 130||--> fields <-- id_contrato (new)  : 23||concepto (new)  : 168||cantidad (new)  : 7||importe_renglon (new)  : 168||costo_actual (new)  : 0||tipo_concepto (new)  : C||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-10-18 11:44:55||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 4||comentarios (new)  : ');
INSERT INTO `sc_log` VALUES (831, '2018-10-18 12:11:37', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (832, '2018-10-18 12:11:42', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (833, '2018-10-18 15:34:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (834, '2018-10-18 15:35:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (835, '2018-10-18 15:35:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (836, '2018-10-18 15:49:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (837, '2018-10-18 15:49:21', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (838, '2018-10-18 15:53:06', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (839, '2018-10-18 15:53:12', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (840, '2018-10-18 15:55:48', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (841, '2018-10-18 15:58:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (842, '2018-10-18 15:58:39', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (843, '2018-10-18 16:00:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (844, '2018-10-18 16:01:20', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:supervisor1');
INSERT INTO `sc_log` VALUES (845, '2018-10-18 16:01:28', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (846, '2018-10-18 16:01:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (847, '2018-10-18 16:01:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (848, '2018-10-18 16:01:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (849, '2018-10-18 16:02:00', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (850, '2018-10-18 16:04:00', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (851, '2018-10-18 16:04:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (852, '2018-10-18 16:04:35', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 23||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 10||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 12||p_iva (old)  : 0||p_iva (new)  : 16||t_anticipo (old)  : 0||t_anticipo (new)  : 5.6||t_fondo_garantia (old)  : 0||t_fondo_garantia (new)  : 6.72||t_iva (old)  : 0||t_iva (new)  : 8.96||p_pendiente (old)  : 0||p_pendiente (new)  : 78||t_pendiente (old)  : 0||t_pendiente (new)  : 43||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-18||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (853, '2018-10-18 16:09:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (854, '2018-10-18 16:11:58', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (855, '2018-10-18 16:17:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (856, '2018-10-18 16:17:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (857, '2018-10-18 16:22:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (858, '2018-10-18 16:22:27', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (859, '2018-10-18 16:27:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (860, '2018-10-18 16:27:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (861, '2018-10-18 16:29:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (862, '2018-10-18 16:29:22', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (863, '2018-10-18 17:19:24', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (864, '2018-10-18 17:19:42', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 23||--> fields <-- t_pendiente (old)  : 43.68||t_pendiente (new)  : 43');
INSERT INTO `sc_log` VALUES (865, '2018-10-18 17:25:50', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 23||--> fields <-- t_pendiente (old)  : 43.68||t_pendiente (new)  : 43');
INSERT INTO `sc_log` VALUES (866, '2018-10-18 17:26:59', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 23||--> fields <-- t_pendiente (old)  : 43.68||t_pendiente (new)  : 43||total_contrato (old)  : 0||total_contrato (new)  : 56');
INSERT INTO `sc_log` VALUES (867, '2018-10-18 17:27:26', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 23||--> fields <-- p_anticipo (old)  : 10||p_anticipo (new)  : 15||t_anticipo (old)  : 5.6||t_anticipo (new)  : 8.4||p_pendiente (old)  : 78||p_pendiente (new)  : 73||t_pendiente (old)  : 43.68||t_pendiente (new)  : 40||total_contrato (old)  : 0||total_contrato (new)  : 56');
INSERT INTO `sc_log` VALUES (868, '2018-10-18 17:29:57', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (869, '2018-10-18 17:30:05', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (870, '2018-10-18 17:46:29', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 132||--> fields <-- id_contrato (new)  : 23||concepto (new)  : 168||cantidad (new)  : 12||importe_renglon (new)  : 288||costo_actual (new)  : 0||tipo_concepto (new)  : E||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-10-18 17:46:29||usuario_modifica (new)  : admin||estatus (new)  : 4||comentarios (new)  : ');
INSERT INTO `sc_log` VALUES (871, '2018-10-19 10:50:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (872, '2018-10-19 10:55:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (873, '2018-10-19 10:56:22', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (874, '2018-10-19 11:23:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (875, '2018-10-19 11:23:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (876, '2018-10-19 11:37:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (877, '2018-10-19 11:37:31', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (878, '2018-10-19 11:44:30', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (879, '2018-10-19 11:44:34', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (880, '2018-10-19 11:46:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (881, '2018-10-19 11:46:27', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (882, '2018-10-19 13:23:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (883, '2018-10-19 13:24:13', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (884, '2018-10-19 13:24:37', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-19||descripcion (new)  : Amorada Uno||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-19 13:24:33||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (885, '2018-10-19 13:26:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (886, '2018-10-19 13:26:38', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (887, '2018-10-19 13:27:22', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 15||p_iva (old)  : 0||p_iva (new)  : 16||p_pendiente (old)  : 0||p_pendiente (new)  : 35||total_contrato (old)  : ||total_contrato (new)  : 0||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-19||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (888, '2018-10-19 13:34:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (889, '2018-10-19 13:34:46', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (890, '2018-10-19 14:36:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (891, '2018-10-19 14:36:22', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (892, '2018-10-19 14:38:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (893, '2018-10-19 14:38:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (894, '2018-10-19 14:40:22', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (895, '2018-10-19 14:40:41', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (896, '2018-10-19 14:42:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (897, '2018-10-19 14:43:28', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (898, '2018-10-19 14:44:27', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-19||descripcion (new)  : Contrato Amorada||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-19 14:44:24||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (899, '2018-10-19 14:54:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (900, '2018-10-19 14:54:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (901, '2018-10-19 14:54:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (902, '2018-10-19 14:54:54', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (903, '2018-10-19 14:54:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (904, '2018-10-19 14:55:09', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (905, '2018-10-19 14:55:21', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (906, '2018-10-19 14:55:27', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (907, '2018-10-19 14:55:39', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (908, '2018-10-19 14:55:43', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (909, '2018-10-19 14:55:50', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (910, '2018-10-19 14:55:56', 'admin', 'grid_supervisores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (911, '2018-10-19 14:55:59', 'admin', 'grid_contratistas', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (912, '2018-10-19 14:56:03', 'admin', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (913, '2018-10-19 14:56:20', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (914, '2018-10-19 14:56:24', 'admin', 'form_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (915, '2018-10-19 14:56:56', 'admin', 'grid_residentes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (916, '2018-10-19 14:59:52', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (917, '2018-10-19 15:04:10', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-19||descripcion (new)  : ||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-19 15:04:06||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (918, '2018-10-19 15:05:53', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (919, '2018-10-19 15:07:40', 'admin', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 65||--> fields <-- total (old)  : 0||total (new)  : 50||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-19||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (920, '2018-10-19 15:08:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (921, '2018-10-19 15:08:23', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (922, '2018-10-19 15:14:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (923, '2018-10-19 15:14:22', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (924, '2018-10-19 15:14:23', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (925, '2018-10-19 15:14:26', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (926, '2018-10-19 15:14:32', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (927, '2018-10-19 15:14:35', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (928, '2018-10-19 15:14:57', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (929, '2018-10-19 15:14:59', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (930, '2018-10-19 15:15:13', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (931, '2018-10-19 15:17:01', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (932, '2018-10-19 15:18:29', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (933, '2018-10-19 15:18:39', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (934, '2018-10-19 15:18:45', 'supervisor1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (935, '2018-10-19 15:21:15', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (936, '2018-10-19 15:21:35', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (937, '2018-10-19 15:22:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (938, '2018-10-19 15:22:15', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (939, '2018-10-19 15:22:23', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (940, '2018-10-19 15:22:24', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (941, '2018-10-19 15:22:27', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (942, '2018-10-19 15:22:40', 'admin', 'grid_administradores', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (943, '2018-10-19 15:27:54', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (944, '2018-10-19 15:27:58', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (945, '2018-10-19 15:27:59', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (946, '2018-10-19 15:28:01', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (947, '2018-10-19 15:28:07', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (948, '2018-10-19 15:28:09', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (949, '2018-10-19 15:28:16', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (950, '2018-10-19 15:28:36', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-19||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (951, '2018-10-19 15:28:51', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (952, '2018-10-19 15:29:20', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (953, '2018-10-19 15:29:33', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (954, '2018-10-19 15:31:39', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (955, '2018-10-19 15:33:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (956, '2018-10-19 15:35:30', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (957, '2018-10-19 15:44:38', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (958, '2018-10-19 15:47:28', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (959, '2018-10-19 16:02:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (960, '2018-10-19 16:02:50', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (961, '2018-10-19 16:03:52', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (962, '2018-10-19 16:04:28', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (963, '2018-10-19 16:04:49', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (964, '2018-10-19 16:07:20', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (965, '2018-10-19 16:08:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (966, '2018-10-19 16:08:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (967, '2018-10-19 16:08:28', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (968, '2018-10-19 16:10:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (969, '2018-10-19 16:10:21', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (970, '2018-10-19 16:10:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (971, '2018-10-19 16:10:36', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (972, '2018-10-19 16:11:01', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (973, '2018-10-19 16:11:05', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (974, '2018-10-19 16:11:12', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (975, '2018-10-19 16:11:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (976, '2018-10-19 16:11:24', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (977, '2018-10-19 16:13:50', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (978, '2018-10-19 16:13:58', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (979, '2018-10-19 16:19:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (980, '2018-10-19 16:19:56', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (981, '2018-10-19 16:20:43', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (982, '2018-10-19 16:20:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (983, '2018-10-19 16:20:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (984, '2018-10-19 16:23:20', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (985, '2018-10-19 16:23:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (986, '2018-10-19 16:23:59', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (987, '2018-10-19 16:26:02', 'admin', 'App_sync_apps', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (988, '2018-10-19 16:27:34', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : grid_Conceptos_EnviadosRevision||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (989, '2018-10-19 16:27:34', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : grid_Conceptos_Historial||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (990, '2018-10-19 16:27:34', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : grid_Conceptos_Pendientes||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (991, '2018-10-19 16:27:34', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : grid_conceptos_seleccion||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (992, '2018-10-19 16:27:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (993, '2018-10-19 16:28:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (994, '2018-10-19 16:28:02', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (995, '2018-10-19 16:28:29', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (996, '2018-10-19 16:28:36', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (997, '2018-10-19 16:28:40', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (998, '2018-10-19 16:28:53', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (999, '2018-10-19 16:29:03', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1000, '2018-10-19 16:29:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1001, '2018-10-19 16:29:21', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1002, '2018-10-19 16:29:25', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1003, '2018-10-19 16:29:39', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 0||total (new)  : 40');
INSERT INTO `sc_log` VALUES (1004, '2018-10-19 16:30:02', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1005, '2018-10-19 16:30:17', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1006, '2018-10-19 16:40:13', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1007, '2018-10-19 16:41:29', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1008, '2018-10-19 16:48:18', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1009, '2018-10-19 16:54:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1010, '2018-10-19 16:55:07', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1011, '2018-10-19 16:55:14', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1012, '2018-10-19 16:55:29', 'admin', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- usuario_modifica (old)  : supervisor1||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1013, '2018-10-19 16:55:45', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1014, '2018-10-19 16:55:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1015, '2018-10-19 16:56:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1016, '2018-10-19 16:56:05', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1017, '2018-10-19 17:01:10', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1018, '2018-10-19 17:01:17', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1019, '2018-10-19 17:01:20', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1020, '2018-10-19 17:02:58', 'supervisor1', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1021, '2018-10-19 17:02:58', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1022, '2018-10-19 17:34:30', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1023, '2018-10-19 17:35:21', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1024, '2018-10-19 17:35:27', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1025, '2018-10-22 10:45:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1026, '2018-10-22 10:45:18', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1027, '2018-10-22 10:47:04', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1028, '2018-10-22 10:48:05', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1029, '2018-10-22 10:52:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1030, '2018-10-22 10:52:29', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1031, '2018-10-22 10:55:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1032, '2018-10-22 10:56:40', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1033, '2018-10-22 10:58:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1034, '2018-10-22 10:59:01', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1035, '2018-10-22 11:01:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1036, '2018-10-22 11:02:05', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1037, '2018-10-22 11:02:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1038, '2018-10-22 11:03:01', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1039, '2018-10-22 11:03:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1040, '2018-10-22 11:03:43', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1041, '2018-10-22 11:12:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1042, '2018-10-22 11:12:24', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1043, '2018-10-22 11:17:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1044, '2018-10-22 11:17:57', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1045, '2018-10-22 11:18:11', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1046, '2018-10-22 11:36:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1047, '2018-10-22 11:36:19', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1048, '2018-10-22 11:36:59', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-22||descripcion (new)  : AMORADA 6||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-22 11:36:54||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1049, '2018-10-22 11:39:00', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 129||--> fields <-- total (old)  : 0||total (new)  : 13||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-22||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1050, '2018-10-22 11:39:25', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 10||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-22 11:39:25||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1051, '2018-10-22 11:39:39', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 11||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 2||importe_renglon (old)  : 0||importe_renglon (new)  : 686||costo_actual (old)  : 343.3||costo_actual (new)  : 343||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-22 11:39:39||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1052, '2018-10-22 11:39:58', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 12||--> fields <-- costo_actual (old)  : 434.23||costo_actual (new)  : 434||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-22 11:39:58||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1053, '2018-10-22 11:42:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1054, '2018-10-22 11:42:10', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:admin');
INSERT INTO `sc_log` VALUES (1055, '2018-10-22 11:42:14', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1056, '2018-10-22 11:42:54', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 3||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 40||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||t_anticipo (old)  : 0||t_anticipo (new)  : 451.2||t_fondo_garantia (old)  : 0||t_fondo_garantia (new)  : 112.8||t_iva (old)  : 0||t_iva (new)  : 180.48||p_pendiente (old)  : 0||p_pendiente (new)  : 50||t_pendiente (old)  : 1128||t_pendiente (new)  : 564||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-22||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1057, '2018-10-22 11:45:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1058, '2018-10-22 11:45:52', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1059, '2018-10-22 11:56:00', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1060, '2018-10-22 11:56:05', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1061, '2018-10-22 12:04:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1062, '2018-10-22 12:05:05', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1063, '2018-10-22 12:12:10', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1064, '2018-10-22 12:12:15', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1065, '2018-10-22 12:14:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1066, '2018-10-22 12:14:28', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1067, '2018-10-22 12:15:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1068, '2018-10-22 12:15:29', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1069, '2018-10-22 14:52:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1070, '2018-10-22 14:53:02', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1071, '2018-10-22 14:54:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1072, '2018-10-22 14:54:59', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1073, '2018-10-22 15:14:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1074, '2018-10-22 15:14:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1075, '2018-10-22 15:32:03', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1076, '2018-10-22 15:32:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1077, '2018-10-22 15:35:22', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1078, '2018-10-22 15:37:26', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1079, '2018-10-22 15:40:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1080, '2018-10-22 15:41:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1081, '2018-10-22 15:41:48', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1082, '2018-10-22 15:41:53', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1083, '2018-10-22 15:46:04', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1084, '2018-10-22 15:46:10', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1085, '2018-10-22 15:53:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1086, '2018-10-22 15:53:29', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1087, '2018-10-22 16:41:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1088, '2018-10-22 16:43:08', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1089, '2018-10-22 16:49:13', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1090, '2018-10-22 16:49:20', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1091, '2018-10-22 16:50:03', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1092, '2018-10-22 16:50:07', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1093, '2018-10-22 16:50:11', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1094, '2018-10-22 16:50:26', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1095, '2018-10-22 16:51:05', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_conceptos_actualizar_estatus||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y');
INSERT INTO `sc_log` VALUES (1096, '2018-10-22 16:51:10', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1097, '2018-10-22 16:51:18', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1098, '2018-10-22 16:54:25', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1099, '2018-10-22 16:54:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1100, '2018-10-22 16:55:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1101, '2018-10-22 16:55:20', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1102, '2018-10-22 16:55:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1103, '2018-10-22 16:55:53', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1104, '2018-10-22 16:56:01', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1105, '2018-10-22 16:58:24', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 9||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-22 16:58:24||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 1');
INSERT INTO `sc_log` VALUES (1106, '2018-10-22 16:59:16', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_observaciones_conceptos||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (1107, '2018-10-22 16:59:16', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_observaciones_conceptos||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (1108, '2018-10-22 16:59:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1109, '2018-10-22 17:00:04', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1110, '2018-10-22 17:00:08', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1111, '2018-10-22 17:00:15', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1112, '2018-10-22 17:00:18', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1113, '2018-10-22 17:00:27', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- user (new)  : admin||observacion (new)  : Todo bien||fecha (new)  : 2018-10-22||id_detalle_contrato (new)  : 1');
INSERT INTO `sc_log` VALUES (1114, '2018-10-22 17:00:32', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-22 17:00:32||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 1');
INSERT INTO `sc_log` VALUES (1115, '2018-10-22 17:03:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1116, '2018-10-22 17:03:56', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1117, '2018-10-23 10:00:49', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1118, '2018-10-23 10:00:54', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1119, '2018-10-23 10:01:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1120, '2018-10-23 10:01:13', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1121, '2018-10-23 10:02:15', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1122, '2018-10-23 10:02:30', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1123, '2018-10-23 10:02:51', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1124, '2018-10-23 10:02:58', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1125, '2018-10-23 10:03:02', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1126, '2018-10-23 10:03:10', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- user (new)  : admin||observacion (new)  : Todo bien||fecha (new)  : 2018-10-23||id_detalle_contrato (new)  : 3');
INSERT INTO `sc_log` VALUES (1127, '2018-10-23 10:06:24', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1128, '2018-10-23 10:07:03', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1129, '2018-10-23 10:15:09', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1130, '2018-10-23 10:15:25', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1131, '2018-10-23 10:16:37', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1132, '2018-10-23 10:18:16', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1133, '2018-10-23 10:18:26', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1134, '2018-10-23 10:18:29', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1135, '2018-10-23 10:18:35', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- user (new)  : admin||observacion (new)  : Prueba id 9||fecha (new)  : 2018-10-23||id_detalle_contrato (new)  : 9');
INSERT INTO `sc_log` VALUES (1136, '2018-10-23 10:18:39', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1137, '2018-10-23 10:19:07', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1138, '2018-10-23 10:48:21', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1139, '2018-10-23 10:51:46', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1140, '2018-10-23 10:51:59', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1141, '2018-10-23 10:53:32', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1142, '2018-10-23 10:54:35', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1143, '2018-10-23 10:55:41', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1144, '2018-10-23 10:58:38', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1145, '2018-10-23 11:04:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1146, '2018-10-23 11:04:12', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1147, '2018-10-23 11:06:07', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 12||--> fields <-- fecha_modificacion (old)  : 2018-10-22||fecha_modificacion (new)  : 2018-10-23 11:06:07');
INSERT INTO `sc_log` VALUES (1148, '2018-10-23 11:07:07', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-23||descripcion (new)  : Amorada Cuatro||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-23 11:07:02||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1149, '2018-10-23 11:14:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1150, '2018-10-23 11:14:43', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1151, '2018-10-23 11:21:12', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1152, '2018-10-23 11:27:26', '', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1153, '2018-10-23 11:27:36', '', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1154, '2018-10-23 11:31:00', '', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1155, '2018-10-23 11:31:05', '', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1156, '2018-10-23 11:38:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1157, '2018-10-23 11:39:03', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1158, '2018-10-23 12:01:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1159, '2018-10-23 12:01:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1160, '2018-10-23 12:45:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1161, '2018-10-23 12:45:30', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1162, '2018-10-23 12:46:10', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1163, '2018-10-23 12:46:17', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1164, '2018-10-23 12:53:49', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-23 12:53:49||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1165, '2018-10-23 12:59:08', 'supervisor1', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 12:59:08||usuario_modifica (old)  : admin||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1166, '2018-10-23 13:00:53', 'e', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:00:53||usuario_modifica (old)  : supervisor1||usuario_modifica (new)  : e');
INSERT INTO `sc_log` VALUES (1167, '2018-10-23 13:15:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1168, '2018-10-23 13:17:40', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1169, '2018-10-23 13:20:02', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:20:02||usuario_modifica (old)  : e||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1170, '2018-10-23 13:22:10', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1171, '2018-10-23 13:22:15', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1172, '2018-10-23 13:22:31', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:22:31');
INSERT INTO `sc_log` VALUES (1173, '2018-10-23 13:34:31', '', 'login', 'Scriptcase', '127.0.0.1', 'access', '');
INSERT INTO `sc_log` VALUES (1174, '2018-10-23 13:34:41', 'admin', 'login', 'User', '127.0.0.1', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1175, '2018-10-23 13:43:46', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1176, '2018-10-23 13:45:22', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1177, '2018-10-23 13:45:34', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:45:34');
INSERT INTO `sc_log` VALUES (1178, '2018-10-23 13:45:44', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:45:44');
INSERT INTO `sc_log` VALUES (1179, '2018-10-23 13:47:18', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:47:18');
INSERT INTO `sc_log` VALUES (1180, '2018-10-23 13:48:17', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:48:17');
INSERT INTO `sc_log` VALUES (1181, '2018-10-23 13:50:03', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 2||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-23 13:50:03||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1182, '2018-10-23 13:50:17', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 2||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:50:17');
INSERT INTO `sc_log` VALUES (1183, '2018-10-23 13:50:29', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 2||--> fields <-- fecha_modifica (old)  : 2018-10-23||fecha_modifica (new)  : 2018-10-23 13:50:29');
INSERT INTO `sc_log` VALUES (1184, '2018-10-23 14:58:08', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1185, '2018-10-23 14:58:16', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1186, '2018-10-23 15:14:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1187, '2018-10-23 15:14:39', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1188, '2018-10-23 15:15:06', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 4||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 30||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 20||p_iva (old)  : 0||p_iva (new)  : 16||p_pendiente (old)  : 0||p_pendiente (new)  : 50||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-23||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1189, '2018-10-23 15:15:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1190, '2018-10-23 15:17:55', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1191, '2018-10-23 15:21:31', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1192, '2018-10-23 15:30:09', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1193, '2018-10-23 15:30:14', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1194, '2018-10-23 15:34:51', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : form_observaciones_conceptos||--> fields <-- priv_insert (old)  : ||priv_insert (new)  : Y');
INSERT INTO `sc_log` VALUES (1195, '2018-10-23 15:34:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1196, '2018-10-23 15:35:34', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1197, '2018-10-23 15:35:37', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1198, '2018-10-23 15:36:30', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1199, '2018-10-23 15:41:21', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1200, '2018-10-23 15:41:34', 'supervisor1', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1201, '2018-10-23 15:41:45', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1202, '2018-10-23 15:49:33', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1203, '2018-10-23 15:57:37', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1204, '2018-10-23 15:57:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1205, '2018-10-23 15:58:07', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1206, '2018-10-23 15:58:29', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1207, '2018-10-23 16:00:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1208, '2018-10-23 16:00:24', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1209, '2018-10-23 16:00:43', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1210, '2018-10-23 16:00:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1211, '2018-10-23 16:01:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1212, '2018-10-23 16:01:52', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1213, '2018-10-23 16:03:50', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1214, '2018-10-23 16:23:24', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1215, '2018-10-23 16:39:48', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1216, '2018-10-23 16:40:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1217, '2018-10-23 16:41:01', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1218, '2018-10-23 16:41:06', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1219, '2018-10-23 16:41:18', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1220, '2018-10-23 16:43:30', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1221, '2018-10-23 16:44:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1222, '2018-10-23 16:44:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1223, '2018-10-23 16:44:58', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1224, '2018-10-23 16:49:00', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1225, '2018-10-23 16:49:06', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1226, '2018-10-23 16:49:14', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1227, '2018-10-23 16:49:25', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1228, '2018-10-23 16:51:56', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1229, '2018-10-23 16:52:09', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1230, '2018-10-23 16:52:16', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1231, '2018-10-23 16:52:38', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1232, '2018-10-23 16:55:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1233, '2018-10-23 16:56:33', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1234, '2018-10-23 16:56:45', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1235, '2018-10-23 16:57:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1236, '2018-10-23 16:58:50', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1237, '2018-10-23 16:59:00', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1238, '2018-10-23 16:59:05', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1239, '2018-10-23 16:59:21', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1240, '2018-10-23 16:59:45', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1241, '2018-10-23 17:01:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1242, '2018-10-23 17:02:01', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1243, '2018-10-23 17:02:08', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1244, '2018-10-23 17:02:23', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1245, '2018-10-23 17:07:06', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1246, '2018-10-23 17:07:31', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1247, '2018-10-23 17:11:12', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1248, '2018-10-23 17:11:18', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1249, '2018-10-23 17:11:26', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1250, '2018-10-23 17:11:37', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1251, '2018-10-23 17:12:13', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1252, '2018-10-23 17:12:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1253, '2018-10-23 17:13:05', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1254, '2018-10-23 17:13:15', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1255, '2018-10-23 17:16:51', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1256, '2018-10-23 17:17:05', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1257, '2018-10-23 17:17:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1258, '2018-10-23 17:17:21', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1259, '2018-10-23 17:17:30', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1260, '2018-10-23 17:22:41', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1261, '2018-10-23 17:22:46', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1262, '2018-10-23 17:22:53', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1263, '2018-10-23 17:23:31', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1264, '2018-10-23 17:23:36', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1265, '2018-10-23 17:23:45', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1266, '2018-10-23 17:25:36', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1267, '2018-10-23 17:25:42', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1268, '2018-10-23 17:25:48', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1269, '2018-10-23 17:27:01', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1270, '2018-10-23 17:27:07', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1271, '2018-10-23 17:27:15', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1272, '2018-10-23 17:29:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1273, '2018-10-23 17:29:43', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1274, '2018-10-23 17:29:52', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1275, '2018-10-23 17:31:23', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1276, '2018-10-23 17:33:26', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1277, '2018-10-23 17:33:32', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1278, '2018-10-23 17:33:35', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1279, '2018-10-23 17:33:43', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1280, '2018-10-23 17:33:52', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1281, '2018-10-23 17:36:51', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1282, '2018-10-23 17:37:22', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1283, '2018-10-23 17:37:29', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1284, '2018-10-23 17:37:46', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1285, '2018-10-23 17:38:21', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1286, '2018-10-23 17:38:32', 'supervisor1', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1287, '2018-10-24 10:32:02', '', 'login', 'Scriptcase', '187.190.76.171', 'access', '');
INSERT INTO `sc_log` VALUES (1288, '2018-10-24 10:32:12', 'supervisor1', 'login', 'User', '187.190.76.171', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1289, '2018-10-24 10:32:46', 'supervisor1', 'form_contratos', 'Scriptcase', '187.190.76.171', 'insert', '--> keys <-- id : 5||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-24||descripcion (new)  : Prueba amorada||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-24 10:32:41||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1290, '2018-10-25 09:41:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1291, '2018-10-25 09:41:56', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1292, '2018-10-25 10:00:36', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1293, '2018-10-25 10:00:40', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1294, '2018-10-25 10:01:24', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1295, '2018-10-25 10:01:32', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1296, '2018-10-25 10:02:00', 'admin', 'form_anexos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 5||--> fields <-- fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-25 10:02:00||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1297, '2018-10-25 11:54:18', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1298, '2018-10-25 11:54:18', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1299, '2018-10-25 11:59:38', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1300, '2018-10-25 11:59:38', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1301, '2018-10-25 12:02:55', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1302, '2018-10-25 12:02:56', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1303, '2018-10-25 12:03:47', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1304, '2018-10-25 12:03:48', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1305, '2018-10-25 12:05:45', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1306, '2018-10-25 12:05:46', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1307, '2018-10-25 12:10:43', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1308, '2018-10-25 12:10:44', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1309, '2018-10-25 12:11:21', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1310, '2018-10-25 12:11:22', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1311, '2018-10-25 12:15:26', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1312, '2018-10-25 12:15:27', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1313, '2018-10-25 12:36:53', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1314, '2018-10-25 12:36:54', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1315, '2018-10-25 12:40:15', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1316, '2018-10-25 12:40:15', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1317, '2018-10-25 12:41:29', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1318, '2018-10-25 12:41:30', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1319, '2018-10-25 12:43:03', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1320, '2018-10-25 12:43:04', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1321, '2018-10-25 12:44:31', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1322, '2018-10-25 12:44:32', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1323, '2018-10-25 12:45:57', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1324, '2018-10-25 12:45:57', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1325, '2018-10-25 12:49:08', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1326, '2018-10-25 12:49:09', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1327, '2018-10-25 12:50:29', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1328, '2018-10-25 12:50:29', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1329, '2018-10-25 12:52:36', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1330, '2018-10-25 12:52:37', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1331, '2018-10-25 15:19:09', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1332, '2018-10-25 15:20:35', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1333, '2018-10-25 15:21:43', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1334, '2018-10-25 15:22:44', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1335, '2018-10-25 15:23:22', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1336, '2018-10-25 15:24:12', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1337, '2018-10-25 15:36:28', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1338, '2018-10-25 15:38:15', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1339, '2018-10-25 15:42:07', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1340, '2018-10-25 15:43:06', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1341, '2018-10-25 15:44:11', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1342, '2018-10-25 15:46:31', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1343, '2018-10-25 15:57:33', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1344, '2018-10-25 15:57:34', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1345, '2018-10-25 16:01:27', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1346, '2018-10-25 16:01:29', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1347, '2018-10-25 16:05:36', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1348, '2018-10-25 16:05:45', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1349, '2018-10-25 16:20:58', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1350, '2018-10-25 16:21:06', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1351, '2018-10-25 16:24:27', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1352, '2018-10-25 16:25:12', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1353, '2018-10-25 16:25:43', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1354, '2018-10-25 16:32:26', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1355, '2018-10-25 16:32:40', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1356, '2018-10-25 16:32:50', 'admin', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1357, '2018-10-25 16:32:51', 'admin', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1358, '2018-10-26 11:20:30', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1359, '2018-10-26 11:24:02', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1360, '2018-10-26 11:55:23', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1361, '2018-10-26 11:55:29', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1362, '2018-10-26 11:56:55', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1363, '2018-10-26 11:57:00', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1364, '2018-10-26 11:59:31', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1365, '2018-10-26 11:59:51', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1366, '2018-10-26 12:01:11', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1367, '2018-10-26 12:01:17', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1368, '2018-10-26 12:06:39', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1369, '2018-10-26 12:06:46', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1370, '2018-10-26 12:08:26', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1371, '2018-10-26 12:08:33', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1372, '2018-10-26 12:17:58', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1373, '2018-10-26 12:18:04', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1374, '2018-10-26 12:19:29', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1375, '2018-10-26 12:19:36', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1376, '2018-10-26 12:23:18', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1377, '2018-10-26 12:24:05', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1378, '2018-10-26 15:26:33', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1379, '2018-10-26 15:26:40', '', 'login', 'User', '189.152.131.166', 'login Fail', 'Alguien intentó ingresar con el usuario:supervisor1123');
INSERT INTO `sc_log` VALUES (1380, '2018-10-26 15:26:45', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1381, '2018-10-26 15:36:47', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1382, '2018-10-26 15:36:48', 'supervisor1', 'grid_estimaciones_contrato', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1383, '2018-10-26 15:46:40', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1384, '2018-10-26 15:46:42', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1385, '2018-10-26 15:47:52', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1386, '2018-10-26 15:47:53', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1387, '2018-10-26 15:49:45', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1388, '2018-10-26 15:49:46', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1389, '2018-10-26 15:50:59', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1390, '2018-10-26 15:51:00', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1391, '2018-10-26 15:51:41', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1392, '2018-10-26 15:51:43', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1393, '2018-10-26 15:52:10', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1394, '2018-10-26 15:52:12', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1395, '2018-10-26 15:52:29', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1396, '2018-10-26 15:52:30', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1397, '2018-10-26 15:53:11', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1398, '2018-10-26 15:53:12', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1399, '2018-10-26 15:54:51', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1400, '2018-10-26 15:54:53', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1401, '2018-10-26 15:55:48', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1402, '2018-10-26 15:55:49', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1403, '2018-10-26 15:57:57', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1404, '2018-10-26 15:57:58', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1405, '2018-10-26 16:09:02', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1406, '2018-10-26 16:09:07', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1407, '2018-10-26 16:11:18', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1408, '2018-10-26 16:11:23', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1409, '2018-10-26 16:15:14', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1410, '2018-10-26 16:15:20', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1411, '2018-10-26 16:16:45', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1412, '2018-10-26 16:16:52', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1413, '2018-10-26 16:20:51', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1414, '2018-10-26 16:20:56', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1415, '2018-10-26 16:22:15', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1416, '2018-10-26 16:22:22', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1417, '2018-10-26 16:25:38', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1418, '2018-10-26 16:25:43', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1419, '2018-10-26 16:35:35', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1420, '2018-10-26 16:35:36', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1421, '2018-10-26 16:35:55', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1422, '2018-10-26 16:35:56', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1423, '2018-10-26 16:36:43', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1424, '2018-10-26 16:36:44', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1425, '2018-10-26 16:38:13', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1426, '2018-10-26 16:38:15', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1427, '2018-10-26 16:43:41', 'supervisor1', 'form_contratos_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1428, '2018-10-26 16:44:03', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1429, '2018-10-26 16:44:04', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1430, '2018-10-26 16:53:31', '', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1431, '2018-10-26 16:53:32', '', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1432, '2018-10-29 09:43:56', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1433, '2018-10-29 09:43:58', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1434, '2018-10-29 10:25:49', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1435, '2018-10-29 10:25:50', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1436, '2018-10-29 10:27:54', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1437, '2018-10-29 10:27:55', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1438, '2018-10-29 10:33:33', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1439, '2018-10-29 10:33:34', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1440, '2018-10-29 10:34:22', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1441, '2018-10-29 10:34:23', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1442, '2018-10-29 10:57:26', '', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1443, '2018-10-29 11:10:31', '', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1444, '2018-10-29 11:13:24', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1445, '2018-10-29 11:13:26', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1446, '2018-10-29 11:21:49', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1447, '2018-10-29 11:21:56', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1448, '2018-10-29 11:22:09', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1449, '2018-10-29 11:24:42', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1450, '2018-10-29 11:28:31', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1451, '2018-10-29 11:30:52', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1452, '2018-10-29 11:30:58', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1453, '2018-10-29 11:30:58', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1454, '2018-10-29 11:49:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1455, '2018-10-29 11:49:49', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1456, '2018-10-29 11:57:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1457, '2018-10-29 11:59:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1458, '2018-10-29 11:59:21', '', 'login', 'User', '187.179.115.189', 'login Fail', 'Alguien intentó ingresar con el usuario:supervisor1');
INSERT INTO `sc_log` VALUES (1459, '2018-10-29 11:59:27', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1460, '2018-10-29 11:59:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1461, '2018-10-29 11:59:38', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1462, '2018-10-29 12:03:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1463, '2018-10-29 12:04:13', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1464, '2018-10-29 12:21:13', '', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1465, '2018-10-29 12:21:19', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1466, '2018-10-29 12:21:20', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1467, '2018-10-29 12:21:30', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1468, '2018-10-29 12:43:01', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1469, '2018-10-29 12:43:06', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1470, '2018-10-29 12:44:18', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1471, '2018-10-29 12:44:22', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1472, '2018-10-29 12:45:37', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1473, '2018-10-29 12:45:42', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1474, '2018-10-29 12:46:25', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1475, '2018-10-29 12:46:29', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1476, '2018-10-29 12:47:51', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1477, '2018-10-29 12:47:58', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1478, '2018-10-29 12:48:32', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1479, '2018-10-29 12:48:37', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1480, '2018-10-29 12:55:17', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1481, '2018-10-29 12:55:21', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1482, '2018-10-29 12:57:25', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1483, '2018-10-29 12:57:28', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1484, '2018-10-29 12:58:58', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 4||--> fields <-- cantidad (old)  : 0.00||cantidad (new)  : 12.90');
INSERT INTO `sc_log` VALUES (1485, '2018-10-29 12:59:03', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1486, '2018-10-29 12:59:08', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1487, '2018-10-29 13:07:08', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1488, '2018-10-29 13:07:12', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1489, '2018-10-29 13:12:57', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1490, '2018-10-29 13:13:01', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1491, '2018-10-29 15:38:33', '', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1492, '2018-10-29 15:38:39', '', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1493, '2018-10-29 15:38:42', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1494, '2018-10-29 15:38:45', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1495, '2018-10-29 15:49:31', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1496, '2018-10-29 15:49:33', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1497, '2018-10-29 15:49:41', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 4||--> fields <-- cantidad (old)  : 12.90||cantidad (new)  : 1.00');
INSERT INTO `sc_log` VALUES (1498, '2018-10-29 15:51:22', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1499, '2018-10-29 15:51:24', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1500, '2018-10-29 15:51:44', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 4||--> fields <-- importe_renglon (old)  : 960.00||importe_renglon (new)  : 30.00');
INSERT INTO `sc_log` VALUES (1501, '2018-10-29 15:53:36', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1502, '2018-10-29 15:53:38', '', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1503, '2018-10-29 15:54:02', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1504, '2018-10-29 16:09:23', '', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1505, '2018-10-29 16:13:48', '', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1506, '2018-10-29 16:13:49', '', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1507, '2018-10-29 16:13:52', '', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1508, '2018-10-29 16:16:37', '', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1509, '2018-10-29 16:16:40', '', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1510, '2018-10-29 16:16:41', '', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1511, '2018-10-29 16:16:44', '', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1512, '2018-10-29 16:19:36', '', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1513, '2018-10-29 16:21:03', '', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1514, '2018-10-29 16:21:04', '', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1515, '2018-10-29 16:21:14', '', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1516, '2018-10-29 16:21:22', '', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 11||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 4.00||pendiente_estimar (old)  : 12.00||pendiente_estimar (new)  : 8.00||cantidad (old)  : 0.00||cantidad (new)  : 4.00||importe_renglon (old)  : 0.00||importe_renglon (new)  : 120.00');
INSERT INTO `sc_log` VALUES (1517, '2018-10-29 16:21:27', '', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1518, '2018-10-29 16:23:28', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1519, '2018-10-29 16:23:33', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1520, '2018-10-29 16:24:02', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1521, '2018-10-29 16:24:06', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1522, '2018-10-29 16:24:06', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1523, '2018-10-29 16:31:08', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1524, '2018-10-29 16:31:15', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1525, '2018-10-29 16:31:16', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1526, '2018-10-29 16:31:36', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1527, '2018-10-29 16:31:46', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 1||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 12.00||pendiente_estimar (old)  : 13.00||pendiente_estimar (new)  : 1.00||cantidad (old)  : 0.00||cantidad (new)  : 12.00||importe_renglon (old)  : 312.00||importe_renglon (new)  : 0.00');
INSERT INTO `sc_log` VALUES (1528, '2018-10-29 16:31:48', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1529, '2018-10-29 16:41:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1530, '2018-10-29 16:41:31', '', 'App_retrieve_pswd', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1531, '2018-10-29 16:41:32', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1532, '2018-10-29 16:41:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1533, '2018-10-29 16:41:38', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1534, '2018-10-29 16:42:16', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1535, '2018-10-29 16:42:34', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1536, '2018-10-29 16:42:34', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1537, '2018-10-29 16:42:54', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1538, '2018-10-29 16:43:28', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 11.00||pendiente_estimar (old)  : 13.00||pendiente_estimar (new)  : 2.00||cantidad (old)  : 0.00||cantidad (new)  : 11.00||importe_renglon (old)  : 312.00||importe_renglon (new)  : 0.00');
INSERT INTO `sc_log` VALUES (1539, '2018-10-29 16:43:31', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1540, '2018-10-29 16:44:59', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1541, '2018-10-29 16:45:08', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1542, '2018-10-29 16:45:24', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1543, '2018-10-29 17:00:19', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1544, '2018-10-29 17:00:40', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1545, '2018-10-29 17:03:59', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1546, '2018-10-30 12:29:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1547, '2018-10-30 12:29:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1548, '2018-10-30 12:29:51', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 6||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-30||descripcion (new)  : Contrato Amorada||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-30 12:29:46||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1549, '2018-10-30 12:33:23', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 321||--> fields <-- total (old)  : 0||total (new)  : 12||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-10-30||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1550, '2018-10-30 12:33:50', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 22||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-30 12:33:50||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1551, '2018-10-30 15:48:52', '', 'login', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1552, '2018-10-30 15:48:58', 'supervisor1', 'login', 'User', '189.152.151.232', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1553, '2018-10-30 15:49:04', '', 'login', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1554, '2018-10-30 15:49:10', '', 'login', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1555, '2018-10-30 15:49:38', 'supervisor1', 'login', 'User', '189.152.151.232', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1556, '2018-10-30 15:49:51', 'admin', 'login', 'User', '189.152.151.232', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1557, '2018-10-30 15:55:44', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.151.232', 'insert', '--> keys <-- id : 7||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-30||descripcion (new)  : Amorada Prueba||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-30 15:55:39||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1558, '2018-10-30 15:56:08', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1559, '2018-10-30 15:56:38', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1560, '2018-10-30 16:00:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1561, '2018-10-30 16:20:22', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1562, '2018-10-30 16:21:39', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1563, '2018-10-30 16:23:06', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '189.152.151.232', 'update', '--> keys <-- id : 25||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-30 16:23:06||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 5');
INSERT INTO `sc_log` VALUES (1564, '2018-10-30 16:23:22', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1565, '2018-10-30 16:24:00', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1566, '2018-10-30 16:24:06', 'admin', 'form_conceptos_actualizar_estatus', 'Scriptcase', '189.152.151.232', 'update', '--> keys <-- id : 26||--> fields <-- fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-10-30 16:24:06||usuario_modifica (old)  : ||usuario_modifica (new)  : admin||estatus (old)  : 3||estatus (new)  : 2');
INSERT INTO `sc_log` VALUES (1567, '2018-10-30 16:24:18', 'supervisor1', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1568, '2018-10-30 16:27:01', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1569, '2018-10-30 16:29:29', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1570, '2018-10-30 16:30:13', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1571, '2018-10-30 16:30:23', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '189.152.151.232', 'insert', '--> keys <-- id : 4||--> fields <-- user (new)  : admin||observacion (new)  : Prueba||fecha (new)  : 2018-10-30||id_detalle_contrato (new)  : 7');
INSERT INTO `sc_log` VALUES (1572, '2018-10-30 17:25:34', '', 'login', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1573, '2018-10-30 17:25:40', 'supervisor1', 'login', 'User', '189.152.151.232', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1574, '2018-10-30 17:27:15', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1575, '2018-10-30 17:27:21', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1576, '2018-10-30 17:27:27', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1577, '2018-10-30 17:27:33', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1578, '2018-10-30 17:28:16', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1579, '2018-10-30 17:29:34', '', 'login', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1580, '2018-10-30 17:29:40', 'supervisor1', 'login', 'User', '189.152.151.232', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1581, '2018-10-30 17:30:07', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.151.232', 'insert', '--> keys <-- id : 8||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-30||descripcion (new)  : AMORADA 6||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-30 17:30:03||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1582, '2018-10-30 17:30:17', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1583, '2018-10-30 17:32:16', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.151.232', 'insert', '--> keys <-- id : 9||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-30||descripcion (new)  : Amorada Cuatro||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-30 17:32:12||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1584, '2018-10-30 17:32:25', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.151.232', 'access', '');
INSERT INTO `sc_log` VALUES (1585, '2018-10-31 11:25:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1586, '2018-10-31 11:26:03', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1587, '2018-10-31 11:26:12', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1588, '2018-10-31 12:39:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1589, '2018-10-31 12:40:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1590, '2018-10-31 12:40:14', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 10||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-10-31||descripcion (new)  : AMORADA 6||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-10-31 12:40:14||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1591, '2018-10-31 14:31:27', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1592, '2018-10-31 14:31:32', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1593, '2018-10-31 14:33:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1594, '2018-10-31 14:34:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1595, '2018-10-31 16:35:42', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1596, '2018-10-31 16:35:52', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1597, '2018-11-01 15:51:05', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1598, '2018-11-01 15:51:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1599, '2018-11-01 16:40:37', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1600, '2018-11-01 16:40:45', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1601, '2018-11-05 10:24:41', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1602, '2018-11-05 10:24:47', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1603, '2018-11-05 10:30:52', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1604, '2018-11-05 10:31:05', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1605, '2018-11-05 11:12:29', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1606, '2018-11-05 11:12:33', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1607, '2018-11-05 11:12:34', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1608, '2018-11-05 11:12:39', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1609, '2018-11-05 12:11:22', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 21||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-05||descripcion (new)  : Contrato Amorada||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-05 12:11:22||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1610, '2018-11-05 12:12:08', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 769||--> fields <-- total (old)  : 0||total (new)  : 10||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-05||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1611, '2018-11-05 12:13:04', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 78||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||costo_actual (old)  : 0||costo_actual (new)  : 130||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-05 12:13:04||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1612, '2018-11-05 12:13:22', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 79||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 14||importe_renglon (old)  : 0||importe_renglon (new)  : 4806||costo_actual (old)  : 0||costo_actual (new)  : 343||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-05 12:13:22||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1613, '2018-11-05 12:13:39', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 80||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 434||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-05 12:13:38||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1614, '2018-11-05 12:16:49', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 22||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-05||descripcion (new)  : Amorada Cuatro||usuario (new)  : 0||status (new)  : 0||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-05 12:16:49||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1615, '2018-11-05 15:34:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1616, '2018-11-05 15:34:20', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1617, '2018-11-05 15:34:54', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 0||total (new)  : 65||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-05||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1618, '2018-11-06 10:40:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1619, '2018-11-06 10:40:27', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1620, '2018-11-06 11:49:09', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 65||total (new)  : 100000000000||fecha_modifica (old)  : 2018-11-05||fecha_modifica (new)  : 2018-11-06');
INSERT INTO `sc_log` VALUES (1621, '2018-11-06 11:49:36', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 100000000000||total (new)  : 75675');
INSERT INTO `sc_log` VALUES (1622, '2018-11-06 11:50:00', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 75675||total (new)  : 0');
INSERT INTO `sc_log` VALUES (1623, '2018-11-06 11:50:41', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 769||--> fields <-- total (old)  : 10||total (new)  : 0||fecha_modifica (old)  : 2018-11-05||fecha_modifica (new)  : 2018-11-06');
INSERT INTO `sc_log` VALUES (1624, '2018-11-06 12:27:55', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 769||--> fields <-- total (old)  : 0||total (new)  : 21');
INSERT INTO `sc_log` VALUES (1625, '2018-11-06 12:50:49', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1626, '2018-11-06 12:50:56', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1627, '2018-11-06 12:51:18', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1628, '2018-11-06 12:51:19', 'admin', 'grid_Conceptos_EnviadosRevision', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1629, '2018-11-06 12:51:20', 'admin', 'grid_Conceptos_Historial', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1630, '2018-11-06 17:05:55', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 0||total (new)  : 2');
INSERT INTO `sc_log` VALUES (1631, '2018-11-07 10:32:44', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1632, '2018-11-07 10:32:50', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1633, '2018-11-07 10:33:09', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 833||--> fields <-- total (old)  : 2||total (new)  : 12||fecha_modifica (old)  : 2018-11-06||fecha_modifica (new)  : 2018-11-07');
INSERT INTO `sc_log` VALUES (1634, '2018-11-07 10:37:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1635, '2018-11-07 10:38:37', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1636, '2018-11-07 10:40:50', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 769||--> fields <-- fecha_modifica (old)  : 2018-11-06||fecha_modifica (new)  : 2018-11-07');
INSERT INTO `sc_log` VALUES (1637, '2018-11-07 11:10:16', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1638, '2018-11-07 11:10:24', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1639, '2018-11-07 11:27:23', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1640, '2018-11-07 11:27:43', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1641, '2018-11-07 11:27:44', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1642, '2018-11-07 11:27:49', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1643, '2018-11-07 11:27:51', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1644, '2018-11-07 11:27:51', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1645, '2018-11-07 11:29:49', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1646, '2018-11-07 11:30:08', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 25||--> fields <-- cantidad (old)  : 0.00||cantidad (new)  : 12.00');
INSERT INTO `sc_log` VALUES (1647, '2018-11-07 11:30:14', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1648, '2018-11-07 11:30:18', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1649, '2018-11-07 11:30:20', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1650, '2018-11-07 13:19:34', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1651, '2018-11-07 13:19:36', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1652, '2018-11-07 13:19:37', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1653, '2018-11-07 13:20:47', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1654, '2018-11-07 13:20:49', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1655, '2018-11-07 13:20:49', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1656, '2018-11-07 15:12:04', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1657, '2018-11-07 15:19:15', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1658, '2018-11-07 15:20:51', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1659, '2018-11-07 15:23:13', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1660, '2018-11-07 15:29:37', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1661, '2018-11-07 15:48:20', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1662, '2018-11-07 15:49:21', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1663, '2018-11-07 15:58:26', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1664, '2018-11-07 16:02:55', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1665, '2018-11-07 16:03:40', '', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1666, '2018-11-07 16:20:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1667, '2018-11-07 16:21:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1668, '2018-11-07 16:21:24', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-07||descripcion (new)  : Amorada 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-07 16:21:24||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1669, '2018-11-07 16:22:13', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 0||total (new)  : 13||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-07||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1670, '2018-11-07 16:22:37', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||costo_actual (old)  : 0||costo_actual (new)  : 130||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-07 16:22:37||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1671, '2018-11-07 16:22:49', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 343||costo_actual (old)  : 0||costo_actual (new)  : 343||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-07 16:22:48||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1672, '2018-11-07 16:32:05', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1673, '2018-11-07 16:32:27', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1674, '2018-11-07 16:32:28', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1675, '2018-11-07 16:42:54', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1676, '2018-11-07 16:43:00', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1677, '2018-11-07 16:43:00', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1678, '2018-11-07 16:47:21', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1679, '2018-11-07 16:47:25', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1680, '2018-11-07 16:47:43', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||t_anticipo (old)  : 0||t_anticipo (new)  : 314.5||t_fondo_garantia (old)  : 0||t_fondo_garantia (new)  : 62.9||t_iva (old)  : 0||t_iva (new)  : 100.64||p_pendiente (old)  : 0||p_pendiente (new)  : 40||t_pendiente (old)  : 629||t_pendiente (new)  : 251||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-07||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1681, '2018-11-07 16:47:46', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1682, '2018-11-07 16:47:51', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1683, '2018-11-07 16:49:35', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1684, '2018-11-07 17:27:27', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1685, '2018-11-07 17:30:09', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1686, '2018-11-07 17:30:10', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1687, '2018-11-08 11:45:59', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1688, '2018-11-08 11:46:05', '', 'login', 'User', '189.152.131.166', 'login Fail', 'Alguien intentó ingresar con el usuario:supervisor1');
INSERT INTO `sc_log` VALUES (1689, '2018-11-08 11:46:14', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1690, '2018-11-08 11:46:37', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1691, '2018-11-08 11:46:39', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1692, '2018-11-08 11:46:41', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1693, '2018-11-08 11:54:31', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1694, '2018-11-08 11:54:34', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1695, '2018-11-08 11:54:35', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1696, '2018-11-08 12:01:07', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1697, '2018-11-08 12:01:15', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1698, '2018-11-08 12:03:03', 'admin', 'form_conceptos_areas', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 3||--> fields <-- id_concepto (new)  : 301-ADM-001||id_area (new)  : 1');
INSERT INTO `sc_log` VALUES (1699, '2018-11-08 12:04:54', 'admin', 'form_conceptos_areas', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 4||--> fields <-- id_concepto (new)  : 301-ADM-001||id_area (new)  : 5');
INSERT INTO `sc_log` VALUES (1700, '2018-11-08 12:05:40', 'admin', 'form_generador_contrato', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 5||--> fields <-- total (old)  : 0||total (new)  : 15||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-08||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1701, '2018-11-08 12:07:02', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1702, '2018-11-08 12:07:08', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1703, '2018-11-08 12:07:08', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1704, '2018-11-08 12:09:04', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1705, '2018-11-08 12:09:06', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1706, '2018-11-08 12:09:06', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1707, '2018-11-08 12:48:38', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1708, '2018-11-08 12:48:40', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1709, '2018-11-08 12:48:41', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1710, '2018-11-08 12:50:07', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1711, '2018-11-08 12:50:09', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1712, '2018-11-08 12:50:10', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1713, '2018-11-08 13:14:06', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1714, '2018-11-08 13:14:12', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1715, '2018-11-08 13:14:22', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1716, '2018-11-08 13:14:24', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1717, '2018-11-08 13:14:25', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1718, '2018-11-08 15:29:45', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1719, '2018-11-08 15:29:47', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1720, '2018-11-08 15:29:47', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1721, '2018-11-08 15:30:55', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1722, '2018-11-08 15:30:59', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1723, '2018-11-08 15:30:59', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1724, '2018-11-08 15:55:03', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1725, '2018-11-08 15:55:05', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1726, '2018-11-08 15:55:06', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1727, '2018-11-08 16:03:04', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1728, '2018-11-08 16:03:12', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1729, '2018-11-08 16:08:09', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.131.166', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-08||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-08 16:08:09||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1730, '2018-11-08 16:32:33', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 0||total (new)  : 120||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-08||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1731, '2018-11-08 16:32:49', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 5||--> fields <-- total (old)  : 0||total (new)  : 11||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-08||usuario_modifica (old)  : ||usuario_modifica (new)  : supervisor1');
INSERT INTO `sc_log` VALUES (1732, '2018-11-08 16:40:27', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1733, '2018-11-08 16:40:32', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1734, '2018-11-08 16:40:51', 'admin', 'form_importes', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||t_anticipo (old)  : 0||t_anticipo (new)  : 851.5||t_fondo_garantia (old)  : 0||t_fondo_garantia (new)  : 170.3||t_iva (old)  : 0||t_iva (new)  : 272.48||p_pendiente (old)  : 0||p_pendiente (new)  : 40||t_pendiente (old)  : 1703||t_pendiente (new)  : 681||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-08||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1735, '2018-11-08 16:41:10', 'admin', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 2||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||costo_actual (old)  : 0||costo_actual (new)  : 130||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-08 16:41:10||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1736, '2018-11-08 16:41:19', 'admin', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 3||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 343||costo_actual (old)  : 0||costo_actual (new)  : 343||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-08 16:41:19||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1737, '2018-11-08 16:42:48', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1738, '2018-11-08 16:42:58', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1739, '2018-11-08 16:43:19', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1740, '2018-11-08 16:43:20', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1741, '2018-11-09 11:27:09', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1742, '2018-11-09 11:28:32', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1743, '2018-11-09 11:30:24', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1744, '2018-11-09 11:30:31', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1745, '2018-11-09 11:30:32', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1746, '2018-11-09 11:47:49', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1747, '2018-11-09 12:00:34', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1748, '2018-11-09 12:00:36', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1749, '2018-11-09 12:00:37', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1750, '2018-11-09 13:19:56', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '189.152.131.166', 'update', '--> keys <-- id : 2||--> fields <-- costo_actual (old)  : 130||costo_actual (new)  : 23||fecha_modificacion (old)  : 2018-11-08||fecha_modificacion (new)  : 2018-11-09 13:19:56||usuario_modifica (old)  : admin||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (1751, '2018-11-09 16:18:36', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1752, '2018-11-09 16:18:46', 'supervisor1', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1753, '2018-11-09 16:19:23', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1754, '2018-11-09 16:19:28', 'supervisor1', 'form_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1755, '2018-11-09 16:19:28', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1756, '2018-11-10 10:26:00', '', 'login', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1757, '2018-11-10 10:26:31', 'admin', 'login', 'User', '189.152.131.166', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1758, '2018-11-10 10:35:47', 'admin', 'grid_contratistas', 'Scriptcase', '189.152.131.166', 'access', '');
INSERT INTO `sc_log` VALUES (1759, '2018-11-12 11:04:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1760, '2018-11-12 11:04:29', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1761, '2018-11-12 11:04:39', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1762, '2018-11-12 11:18:53', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1763, '2018-11-12 11:18:54', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1764, '2018-11-12 11:18:58', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1765, '2018-11-12 12:01:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1766, '2018-11-12 12:01:49', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1767, '2018-11-12 12:01:58', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1768, '2018-11-12 12:02:00', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1769, '2018-11-12 12:02:01', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1770, '2018-11-12 12:02:05', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1771, '2018-11-12 12:02:13', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- estimado (old)  : 120.00||estimado (new)  : 241.00||pendiente_estimar (old)  : 299880.00||pendiente_estimar (new)  : 299759.00||cantidad (old)  : 120.00||cantidad (new)  : 121.00||importe_renglon (old)  : 1560.00||importe_renglon (new)  : 1573.00');
INSERT INTO `sc_log` VALUES (1772, '2018-11-12 12:05:26', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1773, '2018-11-12 12:05:50', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1774, '2018-11-12 12:05:50', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1775, '2018-11-12 12:05:56', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1776, '2018-11-12 13:20:07', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1777, '2018-11-12 13:21:30', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1778, '2018-11-12 13:21:43', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1779, '2018-11-12 13:21:47', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1780, '2018-11-12 13:21:47', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1781, '2018-11-12 13:22:24', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1782, '2018-11-12 15:28:24', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1783, '2018-11-12 15:28:26', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1784, '2018-11-12 15:28:27', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1785, '2018-11-12 15:28:29', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1786, '2018-11-12 15:37:00', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1787, '2018-11-12 15:37:01', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1788, '2018-11-12 15:37:14', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1789, '2018-11-12 15:39:52', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1790, '2018-11-12 15:39:53', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1791, '2018-11-12 15:39:54', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1792, '2018-11-12 15:39:56', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1793, '2018-11-12 15:44:04', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1794, '2018-11-12 15:44:12', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1795, '2018-11-12 15:44:12', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1796, '2018-11-12 15:44:17', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1797, '2018-11-12 15:55:16', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1798, '2018-11-12 15:55:17', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1799, '2018-11-12 15:55:18', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1800, '2018-11-12 15:55:21', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1801, '2018-11-12 15:55:40', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1802, '2018-11-12 15:55:42', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1803, '2018-11-12 15:55:44', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1804, '2018-11-12 15:55:44', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1805, '2018-11-12 15:55:50', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1806, '2018-11-12 15:55:57', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 7||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 50.00||pendiente_estimar (old)  : 597.60||pendiente_estimar (new)  : 547.60||cantidad (old)  : 0.00||cantidad (new)  : 50.00||importe_renglon (old)  : 0.00||importe_renglon (new)  : 17150.00');
INSERT INTO `sc_log` VALUES (1807, '2018-11-12 15:56:01', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1808, '2018-11-12 15:59:06', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1809, '2018-11-12 15:59:09', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1810, '2018-11-12 15:59:10', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1811, '2018-11-12 15:59:13', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1812, '2018-11-12 16:25:57', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1813, '2018-11-12 16:26:00', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1814, '2018-11-12 16:26:00', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1815, '2018-11-12 16:26:03', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1816, '2018-11-12 16:26:10', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 6||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 1.00||pendiente_estimar (old)  : 1.00||pendiente_estimar (new)  : 0.00||cantidad (old)  : 0.00||cantidad (new)  : 1.00||importe_renglon (old)  : 0.00||importe_renglon (new)  : 23.00');
INSERT INTO `sc_log` VALUES (1817, '2018-11-12 16:28:01', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1818, '2018-11-12 16:32:41', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1819, '2018-11-12 16:32:45', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1820, '2018-11-12 16:32:51', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1821, '2018-11-12 16:32:51', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1822, '2018-11-13 10:24:55', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1823, '2018-11-13 10:25:14', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1824, '2018-11-13 10:26:04', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1825, '2018-11-13 10:26:08', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1826, '2018-11-13 10:26:08', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1827, '2018-11-13 10:27:47', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1828, '2018-11-13 10:27:48', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1829, '2018-11-13 10:33:56', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1830, '2018-11-13 10:33:58', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1831, '2018-11-13 10:33:58', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1832, '2018-11-13 10:34:20', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1833, '2018-11-13 10:34:40', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1834, '2018-11-13 10:34:42', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1835, '2018-11-13 10:34:43', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1836, '2018-11-13 10:35:19', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1837, '2018-11-13 10:35:22', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1838, '2018-11-13 10:35:23', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1839, '2018-11-13 10:36:02', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1840, '2018-11-13 10:36:05', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1841, '2018-11-13 10:37:51', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1842, '2018-11-13 10:39:59', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1843, '2018-11-13 10:40:10', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1844, '2018-11-13 10:40:11', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1845, '2018-11-13 10:41:59', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1846, '2018-11-13 10:42:01', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1847, '2018-11-13 10:42:02', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1848, '2018-11-13 11:13:25', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1849, '2018-11-13 11:13:33', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1850, '2018-11-13 11:13:43', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1851, '2018-11-13 11:13:44', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1852, '2018-11-13 11:14:04', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1853, '2018-11-13 11:14:06', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1854, '2018-11-13 11:14:07', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1855, '2018-11-13 11:14:27', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1856, '2018-11-13 11:14:29', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1857, '2018-11-13 11:14:29', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1858, '2018-11-13 11:29:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1859, '2018-11-13 11:34:41', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1860, '2018-11-13 11:35:06', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1861, '2018-11-13 11:35:08', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1862, '2018-11-13 11:35:08', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1863, '2018-11-13 11:41:28', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1864, '2018-11-13 11:41:30', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1865, '2018-11-13 11:41:30', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1866, '2018-11-13 11:50:17', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1867, '2018-11-13 11:50:20', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1868, '2018-11-13 11:50:20', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1869, '2018-11-13 11:52:52', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1870, '2018-11-13 11:52:57', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1871, '2018-11-13 11:52:57', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1872, '2018-11-13 12:03:19', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1873, '2018-11-13 12:03:23', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1874, '2018-11-13 12:03:28', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1875, '2018-11-13 12:03:28', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1876, '2018-11-13 12:05:13', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1877, '2018-11-13 12:12:39', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1878, '2018-11-13 12:12:39', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1879, '2018-11-13 12:12:45', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1880, '2018-11-13 12:15:05', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 1.00||pendiente_estimar (old)  : 1.00||pendiente_estimar (new)  : 0.00||cantidad (old)  : 0.00||cantidad (new)  : 1.00||importe_renglon (old)  : 0.00||importe_renglon (new)  : 23.00');
INSERT INTO `sc_log` VALUES (1881, '2018-11-13 12:15:13', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1882, '2018-11-13 12:15:24', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1883, '2018-11-13 12:15:29', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- estimado (old)  : 0.00||estimado (new)  : 1.00||pendiente_estimar (old)  : 1.00||pendiente_estimar (new)  : 0.00||cantidad (old)  : 0.00||cantidad (new)  : 1.00||importe_renglon (old)  : 0.00||importe_renglon (new)  : 343.00');
INSERT INTO `sc_log` VALUES (1884, '2018-11-13 12:15:32', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1885, '2018-11-13 12:27:24', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1886, '2018-11-13 12:28:01', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1887, '2018-11-13 12:28:03', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1888, '2018-11-13 12:28:03', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1889, '2018-11-13 12:31:24', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1890, '2018-11-13 12:31:26', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1891, '2018-11-13 12:31:27', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1892, '2018-11-13 12:35:37', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1893, '2018-11-13 12:35:39', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1894, '2018-11-13 12:35:40', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1895, '2018-11-13 12:48:27', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1896, '2018-11-13 12:48:32', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1897, '2018-11-13 12:48:32', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1898, '2018-11-13 14:48:30', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1899, '2018-11-13 14:48:32', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1900, '2018-11-13 14:48:32', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1901, '2018-11-13 14:53:28', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1902, '2018-11-13 14:53:30', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1903, '2018-11-13 14:53:30', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1904, '2018-11-13 15:08:23', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1905, '2018-11-13 15:08:29', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1906, '2018-11-13 15:08:40', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1907, '2018-11-13 15:09:25', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1908, '2018-11-13 15:09:27', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1909, '2018-11-13 15:09:27', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1910, '2018-11-13 15:10:44', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1911, '2018-11-13 15:10:47', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1912, '2018-11-13 15:10:47', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1913, '2018-11-13 15:13:06', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1914, '2018-11-13 15:13:08', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1915, '2018-11-13 15:13:09', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1916, '2018-11-13 15:13:57', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1917, '2018-11-13 15:14:05', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1918, '2018-11-13 15:14:05', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1919, '2018-11-13 15:14:21', 'supervisor1', 'form_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1920, '2018-11-13 15:14:30', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1921, '2018-11-13 15:14:35', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1922, '2018-11-13 15:20:57', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1923, '2018-11-13 15:21:30', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1924, '2018-11-13 15:23:37', 'supervisor1', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 5||--> fields <-- total (old)  : 11||total (new)  : 25||fecha_modifica (old)  : 2018-11-08||fecha_modifica (new)  : 2018-11-13');
INSERT INTO `sc_log` VALUES (1925, '2018-11-14 11:54:45', '', 'login', 'Scriptcase', '189.152.165.164', 'access', '');
INSERT INTO `sc_log` VALUES (1926, '2018-11-14 11:54:52', 'supervisor1', 'login', 'User', '189.152.165.164', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1927, '2018-11-14 11:58:33', 'supervisor1', 'form_contratos', 'Scriptcase', '189.152.165.164', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-14||descripcion (new)  : contrato 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-14 11:58:33||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1928, '2018-11-14 12:00:38', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.165.164', 'access', '');
INSERT INTO `sc_log` VALUES (1929, '2018-11-14 12:01:21', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '189.152.165.164', 'access', '');
INSERT INTO `sc_log` VALUES (1930, '2018-11-14 17:30:45', '', 'login', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1931, '2018-11-14 17:30:50', 'admin', 'login', 'User', '189.152.133.246', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1932, '2018-11-14 17:39:15', '', 'login', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1933, '2018-11-14 17:39:22', 'admin', 'login', 'User', '189.152.133.246', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1934, '2018-11-14 17:59:56', 'admin', 'form_generador_contrato', 'Scriptcase', '189.152.133.246', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 0||total (new)  : 15||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-14||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1935, '2018-11-14 18:00:13', 'admin', 'form_generador_contrato', 'Scriptcase', '189.152.133.246', 'update', '--> keys <-- id : 5||--> fields <-- total (old)  : 0||total (new)  : 19||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-14||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (1936, '2018-11-14 18:00:50', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1937, '2018-11-14 18:01:01', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1938, '2018-11-14 18:01:01', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1939, '2018-11-14 18:01:59', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1940, '2018-11-14 18:01:59', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1941, '2018-11-14 18:02:25', 'admin', 'grid_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1942, '2018-11-14 18:02:32', 'admin', 'form_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1943, '2018-11-14 18:02:32', 'admin', 'grid_detalle_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1944, '2018-11-14 18:03:08', 'admin', 'form_detalle_estimaciones', 'Scriptcase', '189.152.133.246', 'access', '');
INSERT INTO `sc_log` VALUES (1945, '2018-11-15 10:33:25', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1946, '2018-11-15 10:33:33', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1947, '2018-11-15 15:38:17', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-15||descripcion (new)  : Ejemplo2||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-15 15:38:17||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1948, '2018-11-16 10:36:39', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1949, '2018-11-16 10:36:44', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1950, '2018-11-16 10:37:00', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-16||descripcion (new)  : Contrato 3||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-16 10:37:00||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1951, '2018-11-16 10:38:33', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-16||descripcion (new)  : Contrato 4||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-16 10:38:32||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1952, '2018-11-16 11:31:18', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1953, '2018-11-16 11:31:23', 'supervisor1', 'form_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1954, '2018-11-16 11:31:23', 'supervisor1', 'grid_detalle_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1955, '2018-11-16 11:31:46', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1956, '2018-11-16 11:32:53', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 5||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-16||descripcion (new)  : Ejemplo 5||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-16 11:32:53||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1957, '2018-11-16 12:10:31', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 6||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-16||descripcion (new)  : Contrato 6||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-16 12:10:31||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1958, '2018-11-16 14:03:18', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 10||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-16||descripcion (new)  : Contrato 7||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-16 14:03:18||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1959, '2018-11-16 14:30:25', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1960, '2018-11-16 14:30:33', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1961, '2018-11-16 14:55:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1962, '2018-11-16 14:55:46', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1963, '2018-11-16 15:09:20', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1964, '2018-11-16 15:12:01', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1965, '2018-11-16 15:13:29', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1966, '2018-11-16 15:14:42', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1967, '2018-11-16 15:15:44', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1968, '2018-11-16 15:16:43', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1969, '2018-11-16 15:17:47', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1970, '2018-11-16 15:19:41', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 0||--> fields <-- id_contratista (new)  : 1||id_familia (new)  : 58');
INSERT INTO `sc_log` VALUES (1971, '2018-11-16 15:20:15', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 0||--> fields <-- id_contratista (new)  : 1||id_familia (new)  : 57');
INSERT INTO `sc_log` VALUES (1972, '2018-11-20 09:50:24', '', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1973, '2018-11-20 10:39:58', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1974, '2018-11-20 10:40:59', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1975, '2018-11-20 10:41:22', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 11||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : Prueba multiples familias||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 10:41:22||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1976, '2018-11-20 10:45:48', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 12||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : Prueba m2||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 10:45:48||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1977, '2018-11-20 10:51:31', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 13||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 123123123123123||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 10:51:31||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1978, '2018-11-20 11:00:41', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 14||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 098098908098098||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:00:40||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1979, '2018-11-20 11:04:53', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 15||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 123123123123123||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:04:53||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1980, '2018-11-20 11:05:54', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 16||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 09989888898||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:05:54||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1981, '2018-11-20 11:09:02', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 17||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 0987654||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:09:02||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1982, '2018-11-20 11:16:41', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 18||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 123||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:16:41||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1983, '2018-11-20 11:18:21', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 19||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 345345||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:18:21||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1984, '2018-11-20 11:27:04', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 20||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 1123123123123||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 2||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:27:04||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1985, '2018-11-20 11:33:17', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 21||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 900909090909090||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 11:33:16||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1986, '2018-11-20 12:03:28', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 0404040404||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 12:03:27||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1987, '2018-11-20 12:30:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1988, '2018-11-20 12:32:54', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1989, '2018-11-20 12:33:40', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1990, '2018-11-20 12:33:47', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1991, '2018-11-20 12:56:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1992, '2018-11-20 12:56:48', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1993, '2018-11-20 12:57:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1994, '2018-11-20 12:59:10', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1995, '2018-11-20 12:59:16', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (1996, '2018-11-20 13:30:01', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 1231231231||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 13:30:00||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (1997, '2018-11-20 13:31:51', 'supervisor1', 'form_contratistas_familias', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1998, '2018-11-20 13:33:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (1999, '2018-11-20 13:35:09', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2000, '2018-11-20 15:14:41', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2001, '2018-11-20 15:14:47', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2002, '2018-11-20 15:15:07', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-20||descripcion (new)  : 123123123||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-20 15:15:06||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2003, '2018-11-20 17:35:46', 'supervisor1', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2004, '2018-11-20 17:36:48', 'supervisor1', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2005, '2018-11-20 17:37:24', 'supervisor1', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2006, '2018-11-20 17:39:16', 'supervisor1', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2007, '2018-11-20 17:54:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2008, '2018-11-20 17:56:35', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2009, '2018-11-20 17:56:46', 'admin', 'form_proyectos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : Amorada dos||fecha_modifica (new)  : 2018-11-20 17:56:46||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2010, '2018-11-20 17:57:34', 'admin', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2011, '2018-11-20 17:57:43', 'admin', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 173||--> fields <-- concepto (new)  : ||descripcion_larga (new)  : ||unidad (new)  : ||cantidad_original (new)  : 0||costo_maximo_subcontrato (new)  : 0||usuario_modifica (new)  : ||fecha_modifica (new)  : null||status (new)  : 0||costo_maximo_destajo (new)  : ||id_clave (new)  : ||id_proyecto (new)  : 0||generador (new)  : 0||largo (new)  : 0||ancho (new)  : 0||alto (new)  : 0||total (new)  : 0');
INSERT INTO `sc_log` VALUES (2012, '2018-11-20 17:59:12', 'admin', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2013, '2018-11-20 17:59:56', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2014, '2018-11-20 18:00:04', '', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2015, '2018-11-20 18:00:47', '', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2016, '2018-11-20 18:01:17', '', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2017, '2018-11-21 10:20:37', '', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2018, '2018-11-21 10:24:14', '', 'form_conceptos_1', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2019, '2018-11-21 11:47:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2020, '2018-11-21 11:48:08', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2021, '2018-11-21 12:04:50', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2022, '2018-11-21 12:04:55', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2023, '2018-11-21 12:28:57', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2024, '2018-11-21 12:29:05', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2025, '2018-11-21 12:35:27', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-21||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-21 12:35:26||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2026, '2018-11-21 13:01:34', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 39||--> fields <-- id_contrato (new)  : 1||concepto (new)  : 168||cantidad (new)  : 0||importe_renglon (new)  : 0||costo_actual (new)  : 0||tipo_concepto (new)  : B||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-11-21 13:01:34||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 4||comentarios (new)  : ||costo_tope (new)  : 0');
INSERT INTO `sc_log` VALUES (2027, '2018-11-21 15:20:21', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2028, '2018-11-21 15:20:26', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2029, '2018-11-21 16:03:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2030, '2018-11-21 16:04:00', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2031, '2018-11-21 16:42:18', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2032, '2018-11-21 16:45:55', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2033, '2018-11-21 16:49:14', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 40||--> fields <-- id_contrato (new)  : 1||concepto (new)  : 168||cantidad (new)  : 11||importe_renglon (new)  : 264||costo_actual (new)  : 12||tipo_concepto (new)  : B||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-11-21 16:49:14||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 4||comentarios (new)  : ||costo_tope (new)  : 24');
INSERT INTO `sc_log` VALUES (2034, '2018-11-21 16:57:25', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 41||--> fields <-- id_contrato (new)  : 1||concepto (new)  : 168||cantidad (new)  : 12||importe_renglon (new)  : 288||costo_actual (new)  : 11||tipo_concepto (new)  : B||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-11-21 16:57:25||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 4||comentarios (new)  : ||costo_tope (new)  : 24');
INSERT INTO `sc_log` VALUES (2035, '2018-11-21 18:15:22', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2036, '2018-11-21 18:15:26', 'admin', 'form_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2037, '2018-11-21 18:15:31', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2038, '2018-11-21 18:15:37', 'admin', 'grid_observaciones_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2039, '2018-11-21 18:16:56', 'admin', 'grid_Conceptos_Pendientes', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2040, '2018-11-21 18:24:18', 'admin', 'masiva_conceptos', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2041, '2018-11-22 10:21:34', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2042, '2018-11-22 10:21:48', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2043, '2018-11-22 10:45:21', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2044, '2018-11-22 10:45:25', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2045, '2018-11-22 11:31:37', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : AMORADA 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 11:31:36||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2046, '2018-11-22 11:32:47', 'supervisor1', 'grid_estimaciones', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2047, '2018-11-22 11:33:14', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2048, '2018-11-22 11:33:18', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2049, '2018-11-22 11:33:37', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||p_pendiente (old)  : 0||p_pendiente (new)  : 40||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-22||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2050, '2018-11-22 12:44:39', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 2||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-22 12:44:39||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2051, '2018-11-22 12:44:48', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 3||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-22 12:44:48||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2052, '2018-11-22 12:45:04', 'admin', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 0||total (new)  : 2||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-22||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2053, '2018-11-22 13:11:59', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- costo_actual (old)  : 2||costo_actual (new)  : 24||fecha_modificacion (old)  : 2018-11-22||fecha_modificacion (new)  : 2018-11-22 13:11:59');
INSERT INTO `sc_log` VALUES (2054, '2018-11-22 13:12:38', 'admin', 'form_generador_contrato', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- total (old)  : 2||total (new)  : 100');
INSERT INTO `sc_log` VALUES (2055, '2018-11-22 13:13:21', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- costo_actual (old)  : 3||costo_actual (new)  : 100||fecha_modificacion (old)  : 2018-11-22||fecha_modificacion (new)  : 2018-11-22 13:13:21');
INSERT INTO `sc_log` VALUES (2056, '2018-11-22 13:13:32', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 130||fecha_modificacion (old)  : 2018-11-22||fecha_modificacion (new)  : 2018-11-22 13:13:32');
INSERT INTO `sc_log` VALUES (2057, '2018-11-22 13:28:25', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- importe_renglon (old)  : 130||importe_renglon (new)  : 100||fecha_modificacion (old)  : 2018-11-22||fecha_modificacion (new)  : 2018-11-22 13:28:25');
INSERT INTO `sc_log` VALUES (2058, '2018-11-22 13:30:19', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 2||importe_renglon (old)  : 0||importe_renglon (new)  : 400||costo_actual (old)  : 0||costo_actual (new)  : 200||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-22 13:30:19||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2059, '2018-11-22 14:34:45', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2060, '2018-11-22 14:34:51', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2061, '2018-11-22 14:35:42', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 39||--> fields <-- id_contrato (new)  : 1||concepto (new)  : 168||cantidad (new)  : 91||importe_renglon (new)  : 1092||costo_actual (new)  : 12||tipo_concepto (new)  : B||clave_contrato (new)  : 301-ADM-001||fecha_modificacion (new)  : 2018-11-22 14:35:42||usuario_modifica (new)  : francisco rdz rdz||estatus (new)  : 4||comentarios (new)  : ||costo_tope (new)  : 24||marcado (new)  : 0||consecutivo (new)  : 0');
INSERT INTO `sc_log` VALUES (2062, '2018-11-22 15:08:17', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 15:08:16||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2063, '2018-11-22 15:21:11', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2064, '2018-11-22 15:32:33', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2065, '2018-11-22 15:34:27', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2066, '2018-11-22 15:35:48', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2067, '2018-11-22 15:37:15', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2068, '2018-11-22 15:37:34', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2069, '2018-11-22 15:39:36', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2070, '2018-11-22 15:40:46', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2071, '2018-11-22 15:42:17', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2072, '2018-11-22 15:42:41', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2073, '2018-11-22 15:43:52', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2074, '2018-11-22 15:44:35', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2075, '2018-11-22 15:50:29', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2076, '2018-11-22 15:50:41', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2077, '2018-11-22 15:52:02', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2078, '2018-11-22 15:53:05', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2079, '2018-11-22 15:57:13', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 0||id_concepto (new)  : ||id_area (new)  : 26||largo (new)  : 2||ancho (new)  : 2||alto (new)  : 0||total (new)  : 4||fecha_modifica (new)  : null||usuario_modifica (new)  : ||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2080, '2018-11-22 16:00:06', 'sebastian', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2081, '2018-11-22 16:00:53', 'sebastian', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 1||id_area (new)  : 47||largo (new)  : 10||ancho (new)  : 0||alto (new)  : 0||total (new)  : 10||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : sebastian||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2082, '2018-11-22 16:03:37', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2083, '2018-11-22 16:07:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2084, '2018-11-22 16:07:43', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2085, '2018-11-22 16:09:19', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 16:09:18||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2086, '2018-11-22 16:09:31', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2087, '2018-11-22 16:09:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2088, '2018-11-22 16:09:52', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2089, '2018-11-22 16:10:47', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2090, '2018-11-22 16:10:57', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2091, '2018-11-22 16:12:50', '[usr_login]', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 16:12:49||usuario_modifica (new)  : [usr_login]||IdUserRegistro (new)  : [usr_login]||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2092, '2018-11-22 16:12:57', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2093, '2018-11-22 16:16:29', '[usr_login]', 'App_sync_apps', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2094, '2018-11-22 16:17:19', '[usr_login]', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_contratos_fin||--> fields <-- priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (2095, '2018-11-22 16:17:19', '[usr_login]', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : form_generador_contrato_final||--> fields <-- priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y||priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (2096, '2018-11-22 16:17:19', '[usr_login]', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_contratos_fin||--> fields <-- priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (2097, '2018-11-22 16:17:19', '[usr_login]', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 1||app_name : grid_detalle_contratos_fin||--> fields <-- priv_export (old)  : ||priv_export (new)  : Y||priv_print (old)  : ||priv_print (new)  : Y');
INSERT INTO `sc_log` VALUES (2098, '2018-11-22 16:18:09', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2099, '2018-11-22 16:18:13', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2100, '2018-11-22 16:18:19', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2101, '2018-11-22 16:18:27', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2102, '2018-11-22 16:18:45', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 2||id_area (new)  : 42||largo (new)  : 9||ancho (new)  : 9||alto (new)  : 0||total (new)  : 81||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2103, '2018-11-22 16:24:41', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2104, '2018-11-22 16:24:51', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2105, '2018-11-22 16:24:57', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2106, '2018-11-22 16:25:02', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2107, '2018-11-22 16:25:10', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2108, '2018-11-22 16:25:37', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 2||id_area (new)  : 47||largo (new)  : 10||ancho (new)  : 10||alto (new)  : 0||total (new)  : 100||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2109, '2018-11-22 16:28:06', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2110, '2018-11-22 16:28:12', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2111, '2018-11-22 16:28:22', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2112, '2018-11-22 16:28:38', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 2||id_area (new)  : 26||largo (new)  : 1||ancho (new)  : 1||alto (new)  : 0||total (new)  : 1||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2113, '2018-11-22 16:29:10', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2114, '2018-11-22 16:29:21', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 2||id_area (new)  : 26||largo (new)  : 1||ancho (new)  : 1||alto (new)  : 0||total (new)  : 1||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2115, '2018-11-22 16:33:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2116, '2018-11-22 16:33:40', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2117, '2018-11-22 16:33:57', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : Ejemplo 2||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 2||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 16:33:57||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2118, '2018-11-22 16:37:59', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2119, '2018-11-22 16:38:04', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2120, '2018-11-22 16:43:57', '[usr_login]', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-22||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-22 16:43:57||usuario_modifica (new)  : [usr_login]||IdUserRegistro (new)  : [usr_login]||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2121, '2018-11-22 16:47:25', '', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2122, '2018-11-22 16:48:09', '', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 5||--> fields <-- id_contrato (new)  : 0||id_concepto (new)  : ||id_area (new)  : 47||largo (new)  : 1||ancho (new)  : 1||alto (new)  : 1||total (new)  : 1||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : ||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2123, '2018-11-22 16:58:35', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2124, '2018-11-22 16:58:44', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2125, '2018-11-22 16:58:58', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2126, '2018-11-22 17:02:47', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2127, '2018-11-22 17:02:53', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2128, '2018-11-22 17:03:25', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2129, '2018-11-22 17:05:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2130, '2018-11-22 17:05:23', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2131, '2018-11-22 17:05:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2132, '2018-11-22 17:05:53', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2133, '2018-11-22 17:06:06', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2134, '2018-11-22 17:08:07', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2135, '2018-11-22 17:08:15', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2136, '2018-11-22 17:08:32', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2137, '2018-11-22 17:09:10', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 6||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : ||id_area (new)  : 30||largo (new)  : 1||ancho (new)  : 1||alto (new)  : 1||total (new)  : 1||fecha_modifica (new)  : 2018-11-22||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2138, '2018-11-22 17:13:53', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2139, '2018-11-22 17:18:43', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2140, '2018-11-22 17:27:43', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2141, '2018-11-22 17:27:52', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2142, '2018-11-22 17:30:29', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2143, '2018-11-22 17:30:32', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2144, '2018-11-22 17:30:39', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2145, '2018-11-22 17:32:33', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2146, '2018-11-22 17:36:06', '1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2147, '2018-11-22 17:37:07', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2148, '2018-11-22 17:37:15', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2149, '2018-11-22 17:37:24', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2150, '2018-11-22 17:37:36', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2151, '2018-11-23 10:37:24', '', 'login', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2152, '2018-11-23 10:37:30', 'supervisor1', 'login', 'User', '189.152.160.83', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2153, '2018-11-23 10:37:45', '', 'login', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2154, '2018-11-23 10:38:52', 'admin', 'login', 'User', '189.152.160.83', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2155, '2018-11-23 10:39:08', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2156, '2018-11-23 10:46:47', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2157, '2018-11-23 10:47:35', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'insert', '--> keys <-- id : 7||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 26||largo (new)  : 12||ancho (new)  : 1||alto (new)  : 0||total (new)  : 12||fecha_modifica (new)  : 2018-11-23||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2158, '2018-11-23 10:58:49', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2159, '2018-11-23 11:05:02', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2160, '2018-11-23 11:16:44', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2161, '2018-11-23 11:19:53', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2162, '2018-11-23 11:20:29', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2163, '2018-11-23 11:30:27', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2164, '2018-11-23 11:32:25', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2165, '2018-11-23 11:34:20', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2166, '2018-11-23 11:36:05', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2167, '2018-11-23 11:37:10', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2168, '2018-11-23 11:39:11', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2169, '2018-11-23 11:39:43', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2170, '2018-11-23 12:03:16', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2171, '2018-11-23 12:03:29', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2172, '2018-11-23 12:03:59', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2173, '2018-11-23 12:05:18', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2174, '2018-11-23 12:05:36', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2175, '2018-11-23 12:06:32', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2176, '2018-11-23 12:10:34', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2177, '2018-11-23 12:11:06', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'insert', '--> keys <-- id : 8||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 10||ancho (new)  : 1||alto (new)  : 0||total (new)  : 10||fecha_modifica (new)  : 2018-11-23||usuario_modifica (new)  : [usr_login]||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2178, '2018-11-23 12:12:27', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2179, '2018-11-23 12:13:43', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2180, '2018-11-23 12:15:07', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2181, '2018-11-23 12:15:32', '[usr_login]', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2182, '2018-11-23 13:03:45', '', 'login', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2183, '2018-11-23 13:03:58', 'admin', 'login', 'User', '189.152.160.83', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2184, '2018-11-23 15:32:38', '', 'login', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2185, '2018-11-23 15:32:43', 'supervisor1', 'login', 'User', '189.152.160.83', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2186, '2018-11-23 15:32:45', '', 'login', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2187, '2018-11-23 15:32:51', 'admin', 'login', 'User', '189.152.160.83', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2188, '2018-11-23 15:33:04', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2189, '2018-11-23 15:49:09', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2190, '2018-11-23 15:51:23', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2191, '2018-11-23 15:54:21', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2192, '2018-11-23 15:57:24', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2193, '2018-11-23 15:58:06', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2194, '2018-11-23 15:59:46', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2195, '2018-11-23 16:04:05', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2196, '2018-11-23 16:07:15', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2197, '2018-11-23 16:08:27', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2198, '2018-11-23 16:09:48', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2199, '2018-11-23 16:10:43', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2200, '2018-11-23 16:13:49', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2201, '2018-11-23 16:30:55', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2202, '2018-11-23 16:32:22', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2203, '2018-11-23 16:34:08', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2204, '2018-11-23 16:37:30', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2205, '2018-11-23 16:47:01', '', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2206, '2018-11-23 16:47:02', '', 'form_generador_contrato_final', 'Scriptcase', '189.152.160.83', 'access', '');
INSERT INTO `sc_log` VALUES (2207, '2018-11-26 09:56:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2208, '2018-11-26 09:56:26', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2209, '2018-11-26 09:56:53', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2210, '2018-11-26 09:57:03', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2211, '2018-11-26 10:11:11', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2212, '2018-11-26 10:17:11', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2213, '2018-11-26 10:17:18', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2214, '2018-11-26 10:17:28', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2215, '2018-11-26 10:19:50', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2216, '2018-11-26 10:22:08', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2217, '2018-11-26 14:55:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2218, '2018-11-26 14:55:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2219, '2018-11-26 14:55:32', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2220, '2018-11-26 15:01:13', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 9||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 5||ancho (new)  : 5||alto (new)  : 0||total (new)  : 25||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2221, '2018-11-26 15:05:47', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2222, '2018-11-26 15:06:26', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2223, '2018-11-26 15:07:17', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 10||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 5||ancho (new)  : 5||alto (new)  : 0||total (new)  : 25||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2224, '2018-11-26 15:08:44', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 11||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 5||ancho (new)  : 5||alto (new)  : 0||total (new)  : 25||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2225, '2018-11-26 15:31:26', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2226, '2018-11-26 15:31:55', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 12||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 26||largo (new)  : 3||ancho (new)  : 3||alto (new)  : 0||total (new)  : 9||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2227, '2018-11-26 15:37:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2228, '2018-11-26 15:39:50', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2229, '2018-11-26 15:39:59', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2230, '2018-11-26 15:40:25', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 13||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 100||ancho (new)  : 100||alto (new)  : 0||total (new)  : 10000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2231, '2018-11-26 15:53:40', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2232, '2018-11-26 15:55:09', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 14||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 2||largo (new)  : 1000||ancho (new)  : 10000||alto (new)  : 0||total (new)  : 10000000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2233, '2018-11-26 16:01:53', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2234, '2018-11-26 16:02:21', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 15||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 1000||ancho (new)  : 1000||alto (new)  : 0||total (new)  : 1000000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2235, '2018-11-26 16:04:02', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2236, '2018-11-26 16:04:24', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 16||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 1200||ancho (new)  : 1200||alto (new)  : 0||total (new)  : 1440000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2237, '2018-11-26 16:13:59', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2238, '2018-11-26 16:14:28', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 17||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 2||largo (new)  : 10000||ancho (new)  : 10||alto (new)  : 0||total (new)  : 100000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2239, '2018-11-26 16:17:49', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 18||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 11||largo (new)  : 1000||ancho (new)  : 10||alto (new)  : 0||total (new)  : 10000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2240, '2018-11-26 16:30:24', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2241, '2018-11-26 16:30:48', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 19||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 46||largo (new)  : 123123||ancho (new)  : 123123||alto (new)  : 0||total (new)  : 15159273129||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2242, '2018-11-26 16:41:59', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-26||descripcion (new)  : Uno||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-26 16:41:59||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2243, '2018-11-26 16:42:25', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2244, '2018-11-26 17:00:14', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2245, '2018-11-26 17:01:07', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 46||largo (new)  : 1200||ancho (new)  : 1230||alto (new)  : 0||total (new)  : 1476000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2246, '2018-11-26 17:07:26', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2247, '2018-11-26 17:07:54', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 2||largo (new)  : 1200||ancho (new)  : 500||alto (new)  : 0||total (new)  : 600000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2248, '2018-11-26 17:09:37', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2249, '2018-11-26 17:10:04', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 55||largo (new)  : 1000||ancho (new)  : 1200||alto (new)  : 0||total (new)  : 1200000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2250, '2018-11-26 17:13:17', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2251, '2018-11-26 17:13:42', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 4||--> fields <-- id_contrato (new)  : 0||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 1000||ancho (new)  : 1000||alto (new)  : 0||total (new)  : 1000000||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2252, '2018-11-26 17:25:34', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2253, '2018-11-26 17:25:55', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 5||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 50||largo (new)  : 123||ancho (new)  : 1||alto (new)  : 0||total (new)  : 123||fecha_modifica (new)  : 2018-11-26||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2254, '2018-11-27 10:18:38', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2255, '2018-11-27 10:18:49', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2256, '2018-11-27 10:25:19', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2257, '2018-11-27 10:25:26', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2258, '2018-11-27 10:27:20', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-27||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-27 10:27:19||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2259, '2018-11-27 10:29:00', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 10||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 10:29:00||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (2260, '2018-11-27 10:32:25', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 2||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 1||importe_renglon (old)  : 0||importe_renglon (new)  : 100||costo_actual (old)  : 0||costo_actual (new)  : 100||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 10:32:25||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (2261, '2018-11-27 10:32:46', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- cantidad (old)  : 0||cantidad (new)  : 10||importe_renglon (old)  : 0||importe_renglon (new)  : 1000||costo_actual (old)  : 0||costo_actual (new)  : 100||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 10:32:46||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (2262, '2018-11-27 10:32:54', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 3||--> fields <-- fecha_modificacion (old)  : 2018-11-27||fecha_modificacion (new)  : 2018-11-27 10:32:54');
INSERT INTO `sc_log` VALUES (2263, '2018-11-27 10:33:11', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2264, '2018-11-27 10:33:16', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2265, '2018-11-27 10:33:42', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||t_anticipo (old)  : 0||t_anticipo (new)  : 550||t_fondo_garantia (old)  : 0||t_fondo_garantia (new)  : 110||t_iva (old)  : 0||t_iva (new)  : 176||p_pendiente (old)  : 0||p_pendiente (new)  : 40||t_pendiente (old)  : 1100||t_pendiente (new)  : 440||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-27||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2266, '2018-11-27 10:33:51', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2267, '2018-11-27 10:33:57', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2268, '2018-11-27 10:36:06', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2269, '2018-11-27 10:36:17', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2270, '2018-11-27 10:36:21', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2271, '2018-11-27 10:38:48', 'admin', 'App_form_sec_groups_apps', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- group_id : 2||app_name : form_generador_contrato_final||--> fields <-- priv_access (old)  : ||priv_access (new)  : Y||priv_insert (old)  : ||priv_insert (new)  : Y||priv_delete (old)  : ||priv_delete (new)  : Y||priv_update (old)  : ||priv_update (new)  : Y');
INSERT INTO `sc_log` VALUES (2272, '2018-11-27 10:38:52', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2273, '2018-11-27 10:39:10', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2274, '2018-11-27 10:39:28', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2275, '2018-11-27 10:44:20', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2276, '2018-11-27 10:52:26', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2277, '2018-11-27 10:52:30', 'supervisor1', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2278, '2018-11-27 10:52:56', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2279, '2018-11-27 11:15:11', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2280, '2018-11-27 11:24:19', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2281, '2018-11-27 11:29:46', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2282, '2018-11-27 11:32:34', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2283, '2018-11-27 11:40:45', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2284, '2018-11-27 11:44:13', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2285, '2018-11-27 11:46:15', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2286, '2018-11-27 11:49:10', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2287, '2018-11-27 11:50:06', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2288, '2018-11-27 11:58:12', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2289, '2018-11-27 12:04:59', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2290, '2018-11-27 12:37:19', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2291, '2018-11-27 13:59:07', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2292, '2018-11-27 14:06:41', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2293, '2018-11-27 14:09:50', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2294, '2018-11-27 14:26:47', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2295, '2018-11-27 14:27:09', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 10||ancho (new)  : 10||alto (new)  : 0||total (new)  : 100||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : supervisor1||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2296, '2018-11-27 14:29:47', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2297, '2018-11-27 14:30:42', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 2||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 50||largo (new)  : 30||ancho (new)  : 12||alto (new)  : 0||total (new)  : 360||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : supervisor1||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2298, '2018-11-27 14:31:49', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2299, '2018-11-27 14:32:15', 'supervisor1', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 3||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 1000||ancho (new)  : 10||alto (new)  : 0||total (new)  : 10000||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : supervisor1||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2300, '2018-11-27 14:54:10', 'supervisor1', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-27||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-27 14:54:10||usuario_modifica (new)  : supervisor1||IdUserRegistro (new)  : supervisor1||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2301, '2018-11-27 14:57:29', 'supervisor1', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 15||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 14:57:29||usuario_modifica (old)  : ||usuario_modifica (new)  : francisco rdz rdz');
INSERT INTO `sc_log` VALUES (2302, '2018-11-27 14:59:54', '', 'login', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2303, '2018-11-27 15:00:01', 'admin', 'login', 'User', '187.179.115.189', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2304, '2018-11-27 15:01:07', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||p_pendiente (old)  : 0||p_pendiente (new)  : 40||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-27||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2305, '2018-11-27 15:02:21', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2306, '2018-11-27 15:02:42', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2307, '2018-11-27 15:03:06', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 40||ancho (new)  : 10||alto (new)  : 0||total (new)  : 400||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2308, '2018-11-27 15:11:51', 'admin', 'form_contratos', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-27||descripcion (new)  : Ejemplo 1||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-27 15:11:51||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2309, '2018-11-27 15:12:10', 'admin', 'form_detalle_contratos', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id : 1||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 15||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 15:12:10||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2310, '2018-11-27 15:12:25', 'admin', 'form_importes', 'Scriptcase', '187.179.115.189', 'update', '--> keys <-- id_contrato : 1||--> fields <-- p_anticipo (old)  : 0||p_anticipo (new)  : 50||p_fondo_garantia (old)  : 0||p_fondo_garantia (new)  : 10||p_iva (old)  : 0||p_iva (new)  : 16||p_pendiente (old)  : 0||p_pendiente (new)  : 40||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-27||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2311, '2018-11-27 15:12:39', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'access', '');
INSERT INTO `sc_log` VALUES (2312, '2018-11-27 15:12:54', 'admin', 'form_generador_contrato_final', 'Scriptcase', '187.179.115.189', 'insert', '--> keys <-- id : 1||--> fields <-- id_contrato (new)  : 1||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 20||ancho (new)  : 20||alto (new)  : 0||total (new)  : 400||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2313, '2018-11-27 16:04:33', '', 'login', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2314, '2018-11-27 16:05:39', '', 'login', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2315, '2018-11-27 16:06:01', 'admin', 'login', 'User', '189.152.134.76', 'login', '¡Ingresado en el sistema!');
INSERT INTO `sc_log` VALUES (2316, '2018-11-27 16:19:58', 'admin', 'form_contratos', 'Scriptcase', '189.152.134.76', 'insert', '--> keys <-- id : 2||--> fields <-- nombre (new)  : 1||contratista (new)  : 1||residente (new)  : 1||fecha (new)  : 2018-11-27||descripcion (new)  : uno||usuario (new)  : 0||status (new)  : 1||tipo_contrato (new)  : 1||monto_anticipo (new)  : 0||monto_fondo_garantia (new)  : 0||monto_iva (new)  : 0||total_a (new)  : 0||total_b (new)  : 0||total_c (new)  : 0||total_d (new)  : 0||total_e (new)  : 0||monto_pendiente (new)  : 0||total_contrato (new)  : 0||fecha_modifica (new)  : 2018-11-27 16:19:58||usuario_modifica (new)  : admin||IdUserRegistro (new)  : admin||familia (new)  : 85||total_contrato_impuestos (new)  : 0||seleccionado (new)  : 0||consecutivo (new)  : 0||detalle_concepto (new)  : ');
INSERT INTO `sc_log` VALUES (2317, '2018-11-27 16:26:58', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2318, '2018-11-27 16:27:45', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'insert', '--> keys <-- id : 2||--> fields <-- id_contrato (new)  : 2||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 10||ancho (new)  : 10||alto (new)  : 0||total (new)  : 100||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2319, '2018-11-27 16:28:18', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2320, '2018-11-27 16:30:35', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2321, '2018-11-27 16:31:46', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2322, '2018-11-27 16:36:52', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2323, '2018-11-27 16:37:44', 'admin', 'form_importes', 'Scriptcase', '189.152.134.76', 'update', '--> keys <-- id_contrato : 2||--> fields <-- p_pendiente (old)  : 0||p_pendiente (new)  : 100||fecha_modifica (old)  : ||fecha_modifica (new)  : 2018-11-27||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2324, '2018-11-27 16:38:11', 'admin', 'form_detalle_contratos', 'Scriptcase', '189.152.134.76', 'update', '--> keys <-- id : 39||--> fields <-- costo_actual (old)  : 0||costo_actual (new)  : 15||fecha_modificacion (old)  : ||fecha_modificacion (new)  : 2018-11-27 16:38:11||usuario_modifica (old)  : ||usuario_modifica (new)  : admin');
INSERT INTO `sc_log` VALUES (2325, '2018-11-27 16:38:31', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2326, '2018-11-27 16:38:47', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'insert', '--> keys <-- id : 3||--> fields <-- id_contrato (new)  : 2||id_concepto (new)  : 168||id_area (new)  : 3||largo (new)  : 100||ancho (new)  : 100||alto (new)  : 0||total (new)  : 10000||fecha_modifica (new)  : 2018-11-27||usuario_modifica (new)  : admin||estatus (new)  : 0');
INSERT INTO `sc_log` VALUES (2327, '2018-11-27 16:38:49', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2328, '2018-11-27 16:39:15', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2329, '2018-11-27 16:39:19', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');
INSERT INTO `sc_log` VALUES (2330, '2018-11-27 16:39:20', 'admin', 'form_generador_contrato_final', 'Scriptcase', '189.152.134.76', 'access', '');

-- ----------------------------
-- Table structure for sec_apps
-- ----------------------------
DROP TABLE IF EXISTS `sec_apps`;
CREATE TABLE `sec_apps`  (
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`app_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_apps
-- ----------------------------
INSERT INTO `sec_apps` VALUES ('App_change_pswd', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_form_add_users', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_form_edit_users', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_form_sec_apps', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_form_sec_groups', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_form_sec_groups_apps', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_grid_sec_apps', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_grid_sec_groups', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_grid_sec_users', 'cons', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_grid_sec_users_groups', 'form', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_Login', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_retrieve_pswd', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_search_sec_groups', 'filter', 'Security Application');
INSERT INTO `sec_apps` VALUES ('App_sync_apps', 'contr', 'Security Application');
INSERT INTO `sec_apps` VALUES ('cambiar_estatus', 'blank', NULL);
INSERT INTO `sec_apps` VALUES ('CargaMasivaGuardiasVacacionales', '', NULL);
INSERT INTO `sec_apps` VALUES ('Complementarios', '', NULL);
INSERT INTO `sec_apps` VALUES ('controlMenu', 'menu', '');
INSERT INTO `sec_apps` VALUES ('ejemplo_correo', 'blank', NULL);
INSERT INTO `sec_apps` VALUES ('form_administradores', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_anexos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_areas_generador', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_areas_generador_1', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_complementos_contrato', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_conceptos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_conceptos_1', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_conceptos_actualizar_estatus', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_conceptos_areas', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_contratistas', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_contratistas_familias', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_contratos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_contratos_estimaciones', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_contratos_fin', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_cuartos_generador', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_detalle_contratos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_detalle_estimaciones', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_estimaciones', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_familias', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_generador_contrato', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_generador_contrato_final', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_importes', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_observaciones_conceptos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_proveedores', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_proyectos', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_residentes', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_supervisores', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_usuarios', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('form_zonas_generador', 'form', NULL);
INSERT INTO `sec_apps` VALUES ('grid_administradores', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_areas_generador', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_areas_generador_1', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_complementos_contrato', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_conceptos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_conceptos_1', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_conceptos_areas', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_Conceptos_EnviadosRevision', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_Conceptos_Historial', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_Conceptos_Pendientes', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_conceptos_seleccion', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratistas', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratistas_familias', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratos_cancelados', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratos_datos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratos_fin', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_contratos_proyecto', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_cuartos_generador', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_detalle_contratos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_detalle_contratos_fin', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_detalle_estimaciones', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_estimaciones', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_familias', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_generador_contrato', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_generador_estimaciones', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_importes', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_observaciones_conceptos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_proveedores', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_proyectos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_residentes', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_supervisores', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_test', 'cons', '');
INSERT INTO `sec_apps` VALUES ('grid_tmp_conceptos', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_usuarios', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('grid_zonas_generador', 'cons', NULL);
INSERT INTO `sec_apps` VALUES ('login', 'contrusr', 'Control application with layout free - Exclusivity Scriptcase 9');
INSERT INTO `sec_apps` VALUES ('masiva_conceptos', 'contr', NULL);
INSERT INTO `sec_apps` VALUES ('test', 'blank', NULL);

-- ----------------------------
-- Table structure for sec_groups
-- ----------------------------
DROP TABLE IF EXISTS `sec_groups`;
CREATE TABLE `sec_groups`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE,
  UNIQUE INDEX `description`(`description`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_groups
-- ----------------------------
INSERT INTO `sec_groups` VALUES (4, 'Administrador Rayas');
INSERT INTO `sec_groups` VALUES (1, 'Administrator Contratos');
INSERT INTO `sec_groups` VALUES (5, 'Costos');
INSERT INTO `sec_groups` VALUES (3, 'Residente');
INSERT INTO `sec_groups` VALUES (2, 'Supervisor');

-- ----------------------------
-- Table structure for sec_groups_apps
-- ----------------------------
DROP TABLE IF EXISTS `sec_groups_apps`;
CREATE TABLE `sec_groups_apps`  (
  `group_id` int(11) NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priv_access` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_insert` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_delete` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_update` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_export` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_print` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`, `app_name`) USING BTREE,
  INDEX `Sec_groups_apps_ibfk_2`(`app_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_groups_apps
-- ----------------------------
INSERT INTO `sec_groups_apps` VALUES (1, 'App_change_pswd', 'Y', 'N', 'N', 'N', 'N', 'N');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_form_add_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_form_edit_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_form_sec_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_form_sec_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_form_sec_groups_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_grid_sec_apps', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_grid_sec_groups', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_grid_sec_users', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_grid_sec_users_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_Login', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_retrieve_pswd', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_search_sec_groups', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'App_sync_apps', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'cambiar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'CargaMasivaGuardiasVacacionales', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'Complementarios', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'controlMenu', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'ejemplo_correo', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_administradores', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_anexos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_areas_generador', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_areas_generador_1', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_complementos_contrato', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_conceptos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_conceptos_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_conceptos_actualizar_estatus', 'Y', 'Y', 'Y', 'Y', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_conceptos_areas', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_contratistas', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_contratos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_contratos_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_contratos_fin', '', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_cuartos_generador', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_detalle_contratos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'form_familias', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_generador_contrato', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_generador_contrato_final', '', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_importes', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_observaciones_conceptos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_proveedores', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_proyectos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_residentes', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_supervisores', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_usuarios', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'form_zonas_generador', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_administradores', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_areas_generador', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_areas_generador_1', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_complementos_contrato', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_conceptos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_conceptos_1', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_conceptos_areas', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_Conceptos_EnviadosRevision', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_Conceptos_Historial', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_Conceptos_Pendientes', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_conceptos_seleccion', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratistas', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratos_cancelados', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratos_datos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratos_fin', '', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_contratos_proyecto', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_cuartos_generador', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_detalle_contratos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_detalle_contratos_fin', '', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_familias', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_generador_contrato', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_generador_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_importes', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_observaciones_conceptos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_proveedores', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_proyectos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_residentes', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_supervisores', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_test', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_tmp_conceptos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_usuarios', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'grid_zonas_generador', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (1, 'masiva_conceptos', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (1, 'test', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_change_pswd', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, 'App_form_add_users', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_form_edit_users', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_form_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_form_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_form_sec_groups_apps', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_grid_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_grid_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_grid_sec_users', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_grid_sec_users_groups', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_Login', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_retrieve_pswd', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_search_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'App_sync_apps', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'cambiar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'CargaMasivaGuardiasVacacionales', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'Complementarios', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'controlMenu', 'Y', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, 'ejemplo_correo', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_anexos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_areas_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_areas_generador_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_complementos_contrato', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_conceptos_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_conceptos_actualizar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_conceptos_areas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_contratos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'form_contratos_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_cuartos_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_detalle_contratos', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'form_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_generador_contrato', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'form_generador_contrato_final', 'Y', 'Y', 'Y', 'Y', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, 'form_importes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_observaciones_conceptos', '', 'Y', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, 'form_proveedores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_proyectos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_usuarios', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'form_zonas_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_areas_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_areas_generador_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_complementos_contrato', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_conceptos_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_conceptos_areas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_Conceptos_EnviadosRevision', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_Conceptos_Historial', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_Conceptos_Pendientes', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_conceptos_seleccion', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratos_cancelados', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratos_datos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_contratos_proyecto', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_cuartos_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_detalle_contratos', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_detalle_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_generador_contrato', 'Y', '', '', '', 'Y', 'Y');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_generador_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_importes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_observaciones_conceptos', '', '', '', '', '', '');
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_proveedores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_proyectos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_test', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_tmp_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_usuarios', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'grid_zonas_generador', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'login', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'masiva_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (2, 'test', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'cambiar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'ejemplo_correo', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_conceptos_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_conceptos_actualizar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_contratos_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_generador_contrato_final', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_observaciones_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'form_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_Conceptos_EnviadosRevision', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_Conceptos_Historial', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_Conceptos_Pendientes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_conceptos_seleccion', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratos_cancelados', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratos_datos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_contratos_proyecto', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_detalle_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_generador_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_observaciones_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'grid_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (3, 'test', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'cambiar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'ejemplo_correo', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_conceptos_1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_conceptos_actualizar_estatus', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_contratos_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_generador_contrato_final', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_observaciones_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'form_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_administradores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_Conceptos_EnviadosRevision', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_Conceptos_Historial', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_Conceptos_Pendientes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_conceptos_seleccion', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratistas', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratistas_familias', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratos_cancelados', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratos_datos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_contratos_proyecto', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_detalle_contratos_fin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_detalle_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_generador_estimaciones', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_observaciones_conceptos', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_residentes', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'grid_supervisores', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sec_groups_apps` VALUES (4, 'test', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sec_users
-- ----------------------------
DROP TABLE IF EXISTS `sec_users`;
CREATE TABLE `sec_users`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pswd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priv_admin` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_users
-- ----------------------------
INSERT INTO `sec_users` VALUES ('admin', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'admin', 'origen@admin.com', 'Y', NULL, NULL, 1, 1);
INSERT INTO `sec_users` VALUES ('adminRayas', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'AdministradorRayas', 'rayass@origen.com', 'Y', NULL, NULL, 2, 1);
INSERT INTO `sec_users` VALUES ('residente', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'juan  rdz rdz', 'residente@origien.com', 'Y', NULL, NULL, 3, NULL);
INSERT INTO `sec_users` VALUES ('supervisor', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'Supervisor', 'adrian_rocha_123@hotmail.com', 'Y', '', '', 4, NULL);
INSERT INTO `sec_users` VALUES ('supervisor1', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 'francisco rdz rdz', 'supervisro@origne.com', 'Y', NULL, NULL, 5, NULL);

-- ----------------------------
-- Table structure for sec_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `sec_users_groups`;
CREATE TABLE `sec_users_groups`  (
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`login`, `group_id`) USING BTREE,
  INDEX `Sec_users_groups_ibfk_2`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sec_users_groups
-- ----------------------------
INSERT INTO `sec_users_groups` VALUES ('admin', 1);
INSERT INTO `sec_users_groups` VALUES ('Supervisor', 2);
INSERT INTO `sec_users_groups` VALUES ('supervisor1', 2);
INSERT INTO `sec_users_groups` VALUES ('residente', 3);
INSERT INTO `sec_users_groups` VALUES ('adminRayas', 4);

-- ----------------------------
-- Table structure for supervisores
-- ----------------------------
DROP TABLE IF EXISTS `supervisores`;
CREATE TABLE `supervisores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `persona_moral` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `razon_social` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_paterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ap_materno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_proveedor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_moneda` int(11) NOT NULL,
  `rfc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag_activo` tinyint(4) NULL DEFAULT NULL,
  `tb_sec_users_login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usuario_modifica` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `mail` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supervisores
-- ----------------------------
INSERT INTO `supervisores` VALUES (1, '1', 'francisco rdz', 'francisco rdz', 'francisco', 'rdz', 'rdz', '1', 2, '23', '23', 1, 'supervisor1', 'admin', '2018-10-10', 'supervisro@origne.com');

-- ----------------------------
-- Table structure for tb_sendemail
-- ----------------------------
DROP TABLE IF EXISTS `tb_sendemail`;
CREATE TABLE `tb_sendemail`  (
  `id_sendEmail` int(11) NOT NULL AUTO_INCREMENT,
  `smtp` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `port` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_sendEmail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sendemail
-- ----------------------------
INSERT INTO `tb_sendemail` VALUES (1, 'smtp.gmail.com', 'sebastian.villarreal@tibs.com.mx', 'ABC1238F47', '25');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `idtest` int(11) NOT NULL AUTO_INCREMENT,
  `test` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idtest`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tipo_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `tipo_conceptos`;
CREATE TABLE `tipo_conceptos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_conceptos
-- ----------------------------
INSERT INTO `tipo_conceptos` VALUES (1, 'A', 'CTO. NORMAL');
INSERT INTO `tipo_conceptos` VALUES (2, 'B', 'CTO. EXTRA CLIENTE');
INSERT INTO `tipo_conceptos` VALUES (3, 'C', 'CTO. EXTRA OF');
INSERT INTO `tipo_conceptos` VALUES (4, 'D', 'CTO. DEDUCTIVO');
INSERT INTO `tipo_conceptos` VALUES (5, 'E', 'CTO. EXCEDIDO');

-- ----------------------------
-- Table structure for tmp_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `tmp_conceptos`;
CREATE TABLE `tmp_conceptos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion_larga` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `unidad` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cantidad_original` float NULL DEFAULT NULL,
  `costo_maximo_subcontrato` float NULL DEFAULT NULL,
  `usuario_modifica` int(11) NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `costo_maximo_destajo` float NULL DEFAULT NULL,
  `id_clave` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_proyecto` int(11) NULL DEFAULT NULL,
  `generador` int(11) NULL DEFAULT NULL,
  `largo` float NULL DEFAULT NULL,
  `ancho` float NULL DEFAULT NULL,
  `alto` float NULL DEFAULT NULL,
  `total` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `nombre_usuario` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `registros_sede` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(0) NOT NULL,
  `activo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (2, 18, 'SVILLARREAL', '25f9e794323b453885f5181f1b624d0b', 1, 0, '0000-00-00', '00:00:00', 1, 1);
INSERT INTO `usuarios` VALUES (3, 19, 'MBAUTISTA', '25f9e794323b453885f5181f1b624d0b', 1, 0, '2018-12-19', '04:50:51', 1, 0);
INSERT INTO `usuarios` VALUES (4, 20, 'MSILVA', '25f9e794323b453885f5181f1b624d0b', 3, 0, '2018-12-19', '04:51:11', 1, 0);
INSERT INTO `usuarios` VALUES (5, 21, 'MLOPEZ', '25f9e794323b453885f5181f1b624d0b', 2, 0, '2018-12-19', '04:51:37', 1, 0);
INSERT INTO `usuarios` VALUES (6, 22, 'CCOSTOS', '25f9e794323b453885f5181f1b624d0b', 5, 0, '2018-12-21', '02:15:43', 1, 0);

-- ----------------------------
-- Table structure for zonas_generador
-- ----------------------------
DROP TABLE IF EXISTS `zonas_generador`;
CREATE TABLE `zonas_generador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_modifica` date NULL DEFAULT NULL,
  `usuario_modifica` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zonas_generador
-- ----------------------------
INSERT INTO `zonas_generador` VALUES (1, 'Planta alta', NULL, NULL);
INSERT INTO `zonas_generador` VALUES (2, 'Planta Baja', NULL, NULL);
INSERT INTO `zonas_generador` VALUES (3, 'Sotano', NULL, NULL);

-- ----------------------------
-- Procedure structure for sp_calcular_importes
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_calcular_importes`;
delimiter ;;
CREATE PROCEDURE `sp_calcular_importes`(IN id_contrato INT(11))
BEGIN
	DECLARE t_c FLOAT;
	DECLARE total_iva FLOAT;
	DECLARE total_anticipo FLOAT;
	DECLARE total_fondo FLOAT;
	DECLARE total_p FLOAT;
	
	SET t_c = (SELECT total_contrato FROM contratos WHERE id = id_contrato);
	UPDATE importes SET 
		t_anticipo =  ((t_c * p_anticipo) / 100), 
		t_iva = ((t_c * p_iva) / 100),
		t_fondo_garantia = ((t_c * p_fondo_garantia) / 100),
		total_contrato = t_c,
		t_pendiente = t_c - (t_anticipo + t_fondo_garantia);
		
		
	SET total_iva = (SELECT t_iva FROM importes WHERE id_contrato = id_contrato LIMIT 1);
	SET total_anticipo = (SELECT t_anticipo FROM importes WHERE id_contrato = id_contrato LIMIT 1);
	SET total_fondo = (SELECT t_fondo_garantia FROM importes WHERE id_contrato = id_contrato LIMIT 1);
	SET total_iva = (SELECT t_iva FROM importes WHERE id_contrato = id_contrato LIMIT 1);
	SET total_p = (SELECT t_pendiente FROM importes WHERE id_contrato = id_contrato LIMIT 1);
	
	UPDATE contratos SET 
		monto_iva = total_iva, 
		monto_anticipo = total_anticipo, 
		monto_fondo_garantia = total_fondo, 
		monto_pendiente = total_p,
		total_contrato_impuestos = t_c + monto_iva
	WHERE id = id_contrato;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_filtros_sp
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_filtros_sp`;
delimiter ;;
CREATE PROCEDURE `sp_filtros_sp`(t_sp INT ( 1 ), 
	perfil INT ( 11 ), 
	usr VARCHAR ( 15 ), 
	id_usr INT ( 11 ))
BEGIN	IF t_sp = 1 THEN
		CALL sp_select_contratos_autorizados(perfil, usr, id_usr);
	ELSEIF t_sp = 2 THEN
	CALL sp_select_contratos_finiquitados(perfil, usr, id_usr);
	ELSEIF t_sp = 3 THEN 
	 CALL sp_select_contratos_cancelados(perfil, usr, id_usr);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_conceptos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_conceptos`;
delimiter ;;
CREATE PROCEDURE `sp_insert_conceptos`(concepto VARCHAR(25),
	descripcion TEXT,
	unidad VARCHAR(5),
	cantidad FLOAT,
	max_subcontrato FLOAT,
	max_destajo FLOAT,
	clave_fam VARCHAR(10),
	proyecto INT(11),
	gen INT(1))
BEGIN 
	INSERT INTO conceptos ( concepto, descripcion_larga, unidad, cantidad_original, costo_maximo_subcontrato, costo_maximo_destajo, id_clave, id_proyecto, generador )
	VALUES
	( concepto, descripcion, unidad, cantidad, max_subcontrato, max_destajo, clave_fam, proyecto, gen );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_contrato
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_contrato`;
delimiter ;;
CREATE PROCEDURE `sp_insert_contrato`(IN id_proyecto TEXT(10),
	IN contratista TEXT(10),
	IN fecha DATE,
	IN tipo TEXT(1),
	IN residente TEXT(1),
	IN usuario_m TEXT(255),
	IN UserRegistro TEXT(255),
	IN descripcion TEXT(255))
BEGIN
	DECLARE id_c INT;
	
	INSERT INTO contratos (nombre, contratista, descripcion ,fecha, status, total_a, total_b, total_c, total_d, tipo_contrato, residente, usuario_modifica, IdUserRegistro, fecha_modifica, monto_anticipo,  monto_fondo_garantia, monto_iva, total_e, monto_pendiente, total_contrato_impuestos, consecutivo)
	VALUES
	(id_proyecto, contratista, descripcion,  fecha, 1, 0, 0, 0, 0, tipo, residente, usuario_m, UserRegistro, fecha, 0, 0, 0, 0, 0, 0, 0);
	
		SET id_c = (SELECT MAX(id) FROM contratos);
		INSERT INTO fechas_contratos(id_contrato) VALUES (id_c);
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_detalle
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_detalle`;
delimiter ;;
CREATE PROCEDURE `sp_insert_detalle`(IN id_contrato INT(11),
	IN concepto TEXT(255),
	IN tipo_conc TEXT(255),
	IN fecha date,
	IN tipo_contrato INT(11))
BEGIN
DECLARE cons INT;
DECLARE costo_top FLOAT;
DECLARE num_contrato INT;

IF tipo_contrato = 2 THEN
	SET costo_top = (SELECT costo_maximo_subcontrato FROM conceptos WHERE id = concepto);
ELSEIF tipo_contrato = 1 THEN
	SET costo_top = (SELECT costo_maximo_destajo FROM conceptos WHERE id = concepto);
END IF;

SET cons = (SELECT IFNULL(MAX(consecutivo_contrato),0) FROM detalle_contratos WHERE id_contrato = id_contrato) + 1;
SET num_contrato = (SELECT consecutivo FROM contratos WHERE id = id_contrato);

		INSERT INTO detalle_contratos ( id_contrato, concepto, cantidad, importe_renglon, costo_actual, tipo_concepto, consecutivo, consecutivo_contrato, fecha_modificacion, costo_tope )
	VALUES
	( id_contrato, concepto, '0', '0', '0', tipo_conc, num_contrato, cons, fecha, costo_top);
	
		-- CALL sp_totales_conceptos(id_contrato, tipo_conc);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_importes
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_importes`;
delimiter ;;
CREATE PROCEDURE `sp_insert_importes`(IN id_c INT(11),
	IN p_ant INT(11),
	IN p_gara INT(11),
	IN p_iva INT(11),
	IN t_ant FLOAT,
	IN t_fondo FLOAT,
	IN t_iva FLOAT,
	IN p_pend INT(11),
	IN t_pend FLOAT)
BEGIN
	DECLARE existe INT;
	DECLARE cantidad INT;
	DECLARE t_contrato FLOAT;
	SET cantidad = (SELECT COUNT(*) FROM importes WHERE id_contrato = id_c);
	SET t_contrato = (SELECT total_contrato FROM contratos WHERE id = id_c);
	
	IF cantidad = 0 THEN
		INSERT INTO importes ( id_contrato, p_anticipo, p_fondo_garantia, p_iva, t_anticipo, t_fondo_garantia, t_iva, p_pendiente, t_pendiente, total_contrato)
		VALUES
			( id_c, p_ant, p_gara, p_iva, t_ant, t_fondo, t_iva, p_pend, t_pend, t_contrato );
			
	ELSEIF cantidad > 0 THEN
		UPDATE importes SET p_anticipo = p_ant, p_fondo_garantia = p_gara, p_iva=p_iva, t_anticipo = t_ant, t_fondo_garantia = t_fondo, t_iva = t_iva, total_contrato = t_contrato WHERE id_contrato = id_c;
	END IF;
	CALL sp_calcular_importes(id_c);
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_rechazar_contrato
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_rechazar_contrato`;
delimiter ;;
CREATE PROCEDURE `sp_rechazar_contrato`(id_c INT (11),
	fecha DATE)
BEGIN
	DECLARE id_fecha INT;
	SET id_fecha = (SELECT MAX(id) FROM fechas_contratos WHERE id_contrato = id_c);
	
	UPDATE fechas_contratos SET fecha_return = fecha WHERE id = id_fecha;
	UPDATE contratos SET `status` = 1;
	INSERT INTO fechas_contratos(id_contrato) VALUES (id_c);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
	WHERE
		( CASE perfil
		WHEN 3 THEN residente = id_usr AND contratos.`status` = 1
		WHEN 5 THEN contratos.`status` = 3
		ELSE 1 = 1 AND contratos.`status` < 4
		
		END );
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 2;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos_agrupado
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos_agrupado`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos_agrupado`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return,
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
	WHERE
		( CASE perfil
		WHEN 3 THEN 
			residente = id_usr 
		AND contratos.`status` = 1
		WHEN 5 THEN contratos.`status` = 3
		ELSE 1 = 1 AND contratos.`status` < 4
		END )
		GROUP BY contratos.id
		;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		(SELECT fecha_residente FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_residente DESC LIMIT 1),
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 2
		GROUP BY contratos.id;
		
ELSEIF perfil = 3 THEN
		SELECT
			contratos.id,
			contratistas.persona_moral AS contratista,
			usuarios.nombre_usuario AS residente,
			proyectos.nombre,
			contratos.descripcion,
			FORMAT( contratos.total_contrato, 2 ),
			contratos.usuario_modifica,
			estatus_contratos.descripcion,
			(SELECT fecha_return FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_return DESC LIMIT 1),
			contratos.consecutivo,
			contratos.fecha AS creado
		FROM
			contratos
			INNER JOIN contratistas ON contratistas.id = contratos.contratista
			INNER JOIN usuarios ON usuarios.id = contratos.residente
			INNER JOIN proyectos ON proyectos.id = contratos.nombre
			INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		WHERE
			residente = id_usr 
		AND 
			contratos.`status` = 1
			GROUP BY contratos.id
		;
ELSEIF perfil = 5 THEN
		SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		(SELECT fecha_supervisor FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_supervisor DESC LIMIT 1),
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
	WHERE
		contratos.`status` = 3
	GROUP BY 
		contratos.id;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos_autorizados
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos_autorizados`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos_autorizados`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		(SELECT fecha_costos FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_costos DESC LIMIT 1)
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		
	WHERE
		( CASE perfil
		WHEN 3 THEN IdUserRegistro = usr
		WHEN 5 THEN contratos.`status` = 4
		ELSE 1 = 1 END )
		AND contratos.`status` = 4
		GROUP BY contratos.id;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 4;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos_cancelados
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos_cancelados`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos_cancelados`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre 
	WHERE
		( CASE perfil
		WHEN 3 THEN IdUserRegistro = usr
		WHEN 5 THEN contratos.`status` = 5
		ELSE 1 = 1 END )
		AND contratos.`status` = 5;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 5;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos_desarrollo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos_desarrollo`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos_desarrollo`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return,
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
	WHERE
		( CASE perfil
		WHEN 3 THEN 
			residente = id_usr 
		AND contratos.`status` = 1
		WHEN 5 THEN contratos.`status` = 3
		ELSE 1 = 1 AND contratos.`status` < 4
		END )
		GROUP BY contratos.id
		;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		(SELECT fecha_residente FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_residente DESC LIMIT 1),
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` < 4
		GROUP BY contratos.id;
		
ELSEIF perfil = 3 THEN
		SELECT
			contratos.id,
			contratistas.persona_moral AS contratista,
			usuarios.nombre_usuario AS residente,
			proyectos.nombre,
			contratos.descripcion,
			FORMAT( contratos.total_contrato, 2 ),
			contratos.usuario_modifica,
			estatus_contratos.descripcion,
			(SELECT fecha_return FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_return DESC LIMIT 1),
			contratos.consecutivo,
			contratos.fecha AS creado
		FROM
			contratos
			INNER JOIN contratistas ON contratistas.id = contratos.contratista
			INNER JOIN usuarios ON usuarios.id = contratos.residente
			INNER JOIN proyectos ON proyectos.id = contratos.nombre
			INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		WHERE
			residente = id_usr 
		AND 
			contratos.`status` < 4
			GROUP BY contratos.id
		;
ELSEIF perfil = 5 THEN
		SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		(SELECT fecha_supervisor FROM fechas_contratos WHERE id_contrato = contratos.id ORDER BY fecha_supervisor DESC LIMIT 1),
		contratos.consecutivo,
		contratos.fecha AS creado
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
	WHERE
		contratos.`status` < 4
	GROUP BY 
		contratos.id;

END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contratos_finiquitados
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contratos_finiquitados`;
delimiter ;;
CREATE PROCEDURE `sp_select_contratos_finiquitados`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre 
	WHERE
		( CASE perfil
		WHEN 3 THEN IdUserRegistro = usr
		WHEN 5 THEN contratos.`status` = 6
		ELSE 1 = 1 END )
		AND contratos.`status` = 6;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 6;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_contrato_filtro
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_contrato_filtro`;
delimiter ;;
CREATE PROCEDURE `sp_select_contrato_filtro`(IN usuario TEXT ( 25 ),
	IN grupo INT(11))
SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		residentes.persona_moral AS residente,
		proyectos.nombre,
		contratos.descripcion,
		contratos.total_contrato,
		contratos.usuario_modifica 
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN residentes ON residentes.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre 
	WHERE
		( CASE grupo WHEN 2 THEN IdUserRegistro = usuario ELSE 1 = 1 END ) 
	AND `status` = 1
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_historial
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_historial`;
delimiter ;;
CREATE PROCEDURE `sp_select_historial`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor,
		fechas_contratos.fecha_costos,
		fechas_contratos.fecha_return,
		contratos.fecha
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
	WHERE
		( CASE perfil
		WHEN 3 THEN residente = id_usr AND contratos.`status` = 1
		WHEN 5 THEN contratos.`status` = 4
		ELSE 1 = 1 AND contratos.`status` = 4
		
		END );
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 4;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_historial_filtro
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_historial_filtro`;
delimiter ;;
CREATE PROCEDURE `sp_select_historial_filtro`(perfil INT(11),
	usr VARCHAR(15),
	id_usr INT(11),
	proyecto INT(11))
BEGIN

IF perfil = 1 OR perfil = 3 OR perfil = 5 THEN 
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor,
		fechas_contratos.fecha_costos,
		fechas_contratos.fecha_return,
		contratos.fecha
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
	WHERE
		( CASE perfil
		WHEN 3 THEN residente = id_usr AND contratos.`status` = 1
		WHEN 5 THEN contratos.`status` = 4
		ELSE 1 = 1 AND contratos.`status` = 4
		
		END )
		AND contratos.nombre = proyecto;
		
ELSEIF perfil = 2 THEN
	SELECT
		contratos.id,
		contratistas.persona_moral AS contratista,
		usuarios.nombre_usuario AS residente,
		proyectos.nombre,
		contratos.descripcion,
		FORMAT( contratos.total_contrato, 2 ),
		contratos.usuario_modifica,
		estatus_contratos.descripcion,
		fechas_contratos.fecha_residente,
		fechas_contratos.fecha_supervisor, 
		fechas_contratos.fecha_return
	FROM
		contratos
		INNER JOIN contratistas ON contratistas.id = contratos.contratista
		INNER JOIN usuarios ON usuarios.id = contratos.residente
		INNER JOIN proyectos ON proyectos.id = contratos.nombre
		INNER JOIN residentes ON residentes.id_usuario = contratos.residente
		INNER JOIN estatus_contratos ON estatus_contratos.id = contratos.`status`
		INNER JOIN fechas_contratos ON fechas_contratos.id_contrato = contratos.id
		WHERE residentes.id_supervisor = id_usr
		AND contratos.`status` = 4
		AND contratos.nombre = proyecto;
		
		
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_totales_conceptos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_totales_conceptos`;
delimiter ;;
CREATE PROCEDURE `sp_totales_conceptos`(IN id_con  INT(11),
	IN t_concepto  VARCHAR(2))
BEGIN 
		DECLARE total_c FLOAT;
		DECLARE iva FLOAT;
				DECLARE t FLOAT;
		
		IF t_concepto = 'A' THEN
		SET t = (SELECT SUM(importe_renglon) FROM detalle_contratos WHERE tipo_concepto = 'A' AND id_contrato = id_con);
		UPDATE contratos SET total_a = t WHERE id = id_con;
		
	ELSEIF t_concepto = 'B' THEN 
		SET t = (SELECT SUM(importe_renglon) FROM detalle_contratos WHERE tipo_concepto = 'B' AND id_contrato = id_con);
		UPDATE contratos SET total_b = t WHERE id = id_con;
		
		
		ELSEIF t_concepto = 'C' THEN
			SET t = (SELECT SUM(importe_renglon) FROM detalle_contratos WHERE tipo_concepto = 'C' AND id_contrato = id_con);
			UPDATE contratos SET total_c = t WHERE id = id_con;
			
			
		ELSEIF t_concepto = 'D' THEN
			SET t = (SELECT SUM(importe_renglon) FROM detalle_contratos WHERE tipo_concepto = 'D' AND id_contrato = id_con);
			UPDATE contratos SET total_d = t WHERE id = id_con;
	END IF;
	
	SET total_c = (SELECT SUM(importe_renglon) FROM detalle_contratos WHERE id_contrato = id_con);

	UPDATE contratos SET total_contrato = total_c WHERE id = id_con;
	
	-- Ejecutar proceso para los importes despues de calcular los totales por tipo de concepto 
	
	CALL sp_calcular_importes(id_con);
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_cantidad_costo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_cantidad_costo`;
delimiter ;;
CREATE PROCEDURE `sp_update_cantidad_costo`(IN id_detalle INT ( 11 ), 
	IN cantidad_nueva FLOAT)
BEGIN
		DECLARE limite FLOAT;
		DECLARE t FLOAT;
		DECLARE id_concepto INT;
	
	SET @limite = ( SELECT cantidad_original FROM conceptos INNER JOIN detalle_contratos ON conceptos.id = detalle_contratos.concepto WHERE detalle_contratos.id = id_detalle );
	SET @id_concepto = (SELECT concepto FROM detalle_contratos WHERE id = id_detalle);
	IF
		cantidad_nueva <= @limite THEN 
			UPDATE detalle_contratos SET cantidad = cantidad_nueva, importe_renglon = cantidad * costo_actual WHERE id = id_detalle;
			UPDATE conceptos SET cantidad_original = cantidad_original - cantidad_nueva WHERE id = @id_concepto;
			SELECT "resultado",1 as flag;
	ELSEIF cantidad_nueva > @limite THEN
		SELECT "resultado", 0 as flag;
	END IF;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_costo
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_costo`;
delimiter ;;
CREATE PROCEDURE `sp_update_costo`(id_renglon INT(11),
	costo_nuevo FLOAT)
BEGIN 
	DECLARE limite FLOAT;
	DECLARE id_c INT;
	
	
	SET @limite = (SELECT IFNULL(costo_tope, 0) FROM detalle_contratos WHERE id = id_renglon);
	
	IF costo_nuevo <= @limite THEN
		UPDATE detalle_contratos SET costo_actual = costo_nuevo, importe_renglon = cantidad * costo_actual WHERE id = id_renglon;
		SELECT "resultado",1 as flag;
	ELSEIF costo_nuevo > @limite THEN 

		SELECT "resultado", 0 as flag;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_status`;
delimiter ;;
CREATE PROCEDURE `sp_update_status`(id_c INT(11),
	tipo INT(11),
	fecha DATE)
BEGIN 
	DECLARE id_f INT;
	SET id_f = (SELECT MAX(id) FROM fechas_contratos WHERE id_contrato = id_c);
	
	IF tipo = 3 THEN
		UPDATE contratos SET `status` =  2 WHERE id = id_c;
		UPDATE fechas_contratos SET fecha_residente = fecha WHERE id = id_f;
		
	ELSEIF tipo = 2 THEN 
		UPDATE contratos SET `status` = 3 WHERE id = id_c;
		UPDATE fechas_contratos SET fecha_supervisor = fecha WHERE id = id_f;
		
	ELSEIF tipo = 5 THEN
		UPDATE contratos SET `status` = 4 WHERE id = id_c;
		UPDATE fechas_contratos SET fecha_costos = fecha WHERE id = id_f;
		
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
