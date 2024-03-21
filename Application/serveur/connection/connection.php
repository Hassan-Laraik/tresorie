<?php
try
{
	$mysqlClient = new PDO(
	'mysql:host=localhost;dbname=tresorie;charset=utf8',
	'root',
	'12345678'
);
echo "Connected";
}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}

?>