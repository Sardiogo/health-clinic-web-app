<?php
session_start();
?>
<html>
<body>
  <?php
  require("connection.php");

  $vat_person = $_SESSION['VAT_client'];
  $animal_name= $_SESSION['animal_name'];
  $owner_vat= $_SESSION['owner_vat'];


  $S = $_REQUEST['s'];
  $O = $_REQUEST['o'];
  $A = $_REQUEST['a'];
  $P = $_REQUEST['p'];
  $vat_vet= $_REQUEST['vat_vet'];
  $weight = $_REQUEST['weight'];
  $code = $_REQUEST['code'];

  $today= date("Y-m-d H:i:s");


  $stmt= $connection->prepare("INSERT INTO consult VALUES (:animal_name, :owner_vat,:today,:S,:O,:A,:P,:vat_person,:vat_vet,:weight);
  INSERT INTO consult_diagnosis VALUES(:code,:animal_name, :owner_vat,:today);");

  if ($stmt == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }
  $stmt->bindParam(':animal_name', $animal_name);
  $stmt->bindParam(':owner_vat', $owner_vat);
  $stmt->bindParam(':today', $today);
  $stmt->bindParam(':S', $S);
  $stmt->bindParam(':O', $O);
  $stmt->bindParam(':A', $A);
  $stmt->bindParam(':P', $P);
  $stmt->bindParam(':vat_person', $vat_person);
  $stmt->bindParam(':vat_vet', $vat_vet);
  $stmt->bindParam(':weight', $weight);
  $stmt->bindParam(':code', $code);

  $stmt->execute();
  $connection = null;
  header("Location: list_consults.php?owner_vat=$owner_vat");
  ?>
</body>
</html>
