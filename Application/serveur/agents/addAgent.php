<?php
  include "../connection/connection.php";
  //function addAgent(
    $code=$_POST['code'];
    $nom = $_POST['nom'];
    $type = $_POST['type'];
    $gsm = $_POST['gsm'];
    $email = $_POST['email'];
    $adresse = $_POST['adresse'];
  // Ecriture de la requête
$sqlQuery = 'INSERT INTO agents
VALUES (:code, :nom ,:type , :gsm, :email, :adresse)';

// Préparation
$insertAgent = $mysqlClient->prepare($sqlQuery);
echo '2';

// Exécution ! La recette est maintenant en base de données
$insertAgent->execute([
'code' => $code,  
'nom' => $nom,
'type' => $type,
'gsm'  => $gsm ,      
'email' => $email,     
'adresse' => $adresse
]);
header('Location:http://localhost/Tresorie/Application');
exit();   
?>