create schema lifegame;
use lifegame;
create table Pais( 
id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) 
);  

create table categoria( 
id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) 
); 

create table usuario( 
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
documento VARCHAR(15) NOT NULL, 
birthdate DATE NOT NULL, 
id_pais INT NOT NULL, 
direccion VARCHAR(50), 
mail VARCHAR(50), 
telefono INT, 
FOREIGN KEY fk_id_pais(id_pais) REFERENCES Pais(id_pais)
);

create table empresa( 
id_empresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
id_pais INT NOT NULL, 
FOREIGN KEY fk_id_pais(id_pais)REFERENCES Pais(id_pais) 
); 

create table juego( 
id_juego INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(50) NOT NULL, 
id_empresa INT NOT NULL, 
fecha DATE, 
id_categoria INT NOT NULL, 
descripcion VARCHAR(250), 
FOREIGN KEY fk_id_empresa(id_empresa)REFERENCES empresa(id_empresa), 
FOREIGN KEY fk_id_categoria(id_categoria)REFERENCES categoria(id_categoria) 
); 

create table valoracion( 
id_reseña INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_juego INT NOT NULL, 
valoracion INT NOT NULL, 
reseña VARCHAR(250), 
id_usuario INT NOT NULL, 
FOREIGN KEY fk_id_juego(id_juego)REFERENCES juego(id_juego), 
FOREIGN KEY fk_id_usuario(id_usuario)REFERENCES usuario(id_usuario) 
); 

create table compra( 
id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_usuario INT NOT NULL, 
id_juego INT NOT NULL, 
monto DECIMAL(6,2), 
FOREIGN KEY fk_id_usuario (id_usuario)REFERENCES usuario(id_usuario), 
FOREIGN KEY fk_id_juego(id_juego)REFERENCES juego(id_juego) 
);

INSERT INTO pais (id_pais, nombre) VALUES (11, 'Peru'), (12,'Bolivia'),(13,'Ecuador');
INSERT INTO empresa(id_empresa, nombre, id_pais) VALUES (4,"Epic Games", 5 ),(5,"Mojang Studios",14),(6,"Pubg Studios",15);
INSERT INTO juego (id_juego, nombre,id_empresa, fecha,id_categoria, descripcion) VALUES 
(4, 'Fortnite', 4,'2017-09-26', 3,'Battle Royale y juego de acción'),
(5, 'Minecraft',5, '2009-11-18', 7,'Sandbox y Mundo Abierto'),
(6, 'PUBG', 6,'2017-08-23', 3,'Battle Royale multijugador');
insert INTO categoria (id_categoria, nombre)values (8,'Aventura');
INSERT INTO juego (id_juego, nombre,id_empresa, fecha,id_categoria, descripcion) VALUES (7, 'GTA V', 3, '2015-04-15',8,'ofrece a los jugadores la opción de explorar el galardonado mundo de Los Santos');
insert INTO compra(id_compra, id_usuario, id_juego, monto)values(7,2,6,100.00),(8,1,7,778.00);
 
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `lanzamiento_juego`()
BEGIN
Select nombre, fecha 
from lifegame.juego;
END

////////////////////////////////////////////////////////////////////

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario`(
    IN p_nombre VARCHAR(50),
    IN p_documento VARCHAR(15),
    IN p_birthdate DATE,
    IN p_id_pais INT,
    IN p_direccion VARCHAR(50),
    IN p_mail VARCHAR(50),
    IN p_telefono INT
)
BEGIN
    INSERT INTO usuario(nombre, documento, birthdate, id_pais, direccion, mail, telefono)
    VALUES (p_nombre, p_documento, p_birthdate, p_id_pais, p_direccion, p_mail, p_telefono);
END

*/

 CALL lanzamiento_juego(); 
 CALL InsertarUsuario('Pablo', '123456789', '1990-01-01', 1, 'Calle Principal', 'pabloclavounclavito@example.com', 123456789);
 
