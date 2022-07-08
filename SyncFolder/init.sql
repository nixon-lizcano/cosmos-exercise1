CREATE DATABASE IF NOT EXISTS `vagrantdb`;
CREATE USER IF NOT EXISTS 'vagrant_usr'@'192.168.56.10' IDENTIFIED BY 'Vagrant1*';
GRANT ALL PRIVILEGES ON * . * TO 'vagrant_usr'@'192.168.56.10';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS `empleados` (
  `codigo` varchar(10) NOT NULL PRIMARY KEY,
  `nombres` varchar(50) NOT NULL,
  `lugar_nacimiento` varchar(30) NOT NULL,
  `fecha_nacimiento` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `puesto` varchar(15) NOT NULL,
  `estado` int(11) NOT NULL
);