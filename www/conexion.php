<?php
/*Datos de conexion a la base de datos*/
$db_host = "192.168.56.20";
$db_user = "vagrant_usr";
$db_pass = "Vagrant1*";
$db_name = "vagrantdb";

$con = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if(mysqli_connect_errno()){
	echo 'No se pudo conectar a la base de datos : '.mysqli_connect_error();
}
?>
