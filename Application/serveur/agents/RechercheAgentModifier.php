<?php
 include "../connection/connection.php";
 
 //////
 if (!empty($_POST['code'])) {
    $code = $_POST['code'];
    $sqlQuery = 'SELECT * FROM agents WHERE code_agent = :code';
    $all_Agent = $mysqlClient->prepare($sqlQuery);
    $all_Agent->execute([
        'code' => $code
    ]);

  }else{
    $sqlQuery = 'SELECT * FROM agents ';
    $all_Agent = $mysqlClient->prepare($sqlQuery);
    $all_Agent->execute();
  }

// Exécution ! La recette est maintenant en base de données

$fetch_All_Agent = $all_Agent->fetchAll();
$code_agent = $fetch_All_Agent[0]['code_agent']; 
$nom_complet = $fetch_All_Agent[0]['nom_complet'];
$type = $fetch_All_Agent[0]['type'];
$gsm = $fetch_All_Agent[0]['gsm'];
$email= $fetch_All_Agent[0]['email'];
$adresse = $fetch_All_Agent[0]['adresse'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <H2>Rechercher Agent</H2>
    <form action="./RechercheAgentModifier.php" method="post">
        <input type="text" name="code" id="">
        <input type="submit" value="Rechercher">
    </form>
    <hr>
    <H2>Formulaire de Modification</H2>
      <form action="./ModifierAgent.php" method="post">
        <input type="text" name="code" id="" placeholder="Code Agent" value= "<?php echo $code_agent ?>"  > 
        <input type="text" name="nom" id="" placeholder="Nom Complet" value= "<?php echo $nom_complet ?>">
        <input type="text" name="type" id="" placeholder="Type" value= "<?php echo $type ?>">
        <input type="tel" name="gsm" id="" placeholder="GSM" value= "<?php echo $gsm ?>">
        <input type="email" name="email" id="" placeholder="Email" value= "<?php echo $email ?>">
        <input type="text" name="adresse" id="" placeholder="Adresse" value= "<?php echo $adresse ?>">
        <br>
        <input type="submit" value="Modifier">
      </form>
</body>
</html>