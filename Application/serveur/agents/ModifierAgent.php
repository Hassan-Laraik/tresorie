<?php
 include "../connection/connection.php";
 
 
    $code = $_POST['code'];
    $sqlQuery = 'update agents set nom_complet=:nom,type=:type,gsm=:gsm,email=:email,adresse=:adresse
     WHERE code_agent =:code';
    $Modifier_Agent = $mysqlClient->prepare($sqlQuery);
    $Modifier_Agent->execute([
        'code' => $_POST['code'],
        'nom' => $_POST['nom'],
        'type' => $_POST['type'],
        'gsm' => $_POST['gsm'],
        'email' => $_POST['email'],
        'adresse' => $_POST['adresse'],
    ]);

  
    $Modifier_Agent->execute();


?>