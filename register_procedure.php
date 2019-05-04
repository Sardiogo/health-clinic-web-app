<?php
session_start();
?>
<html>
<body>
  <?php
  require("connection.php");

  $animal_name= $_SESSION['animal_name'];
  $owner_vat= $_SESSION['owner_vat'];
  $date_timestamp = strtotime($_SESSION['date_timestamp']);
  $time = getdate($date_timestamp);
  $y = $time['year'];
  $m = $time['mon'];
  $d = $time['mday'];
  $h = $time['hours'];
  $i = $time['minutes'];
  $s = $time['seconds'];

  $vat_ass= $_REQUEST['vat_ass'];
  $value = $_REQUEST['value'];
  $indicator = $_REQUEST['indicator'];

  $stmt = $connection->prepare("SELECT COUNT(num)+1 AS n
  FROM procedure_consult
  WHERE procedure_consult.name = :animal_name
  AND procedure_consult.VAT_owner = :owner_vat
  AND procedure_consult.date_timestamp = '$y-$m-$d $h:$i:$s';");
  if ($stmt == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }
  $stmt->bindParam(':animal_name', $animal_name);
  $stmt->bindParam(':owner_vat', $owner_vat);
  $stmt->execute();
  $result = $stmt->fetch();
  $num = $result['n'];


  $connection->beginTransaction();

  $stmt1 = $connection->prepare("INSERT INTO procedure_consult VALUES (:animal_name, :owner_vat, '$y-$m-$d $h:$i:$s', :num, 'Blood Analysis');");
  if ($stmt1 == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }
  $stmt2 = $connection->prepare("INSERT INTO test_procedure VALUES (:animal_name, :owner_vat, '$y-$m-$d $h:$i:$s', :num, 'blood');");
  if ($stmt2 == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  $stmt3 = $connection->prepare("INSERT INTO produced_indicator VALUES(:animal_name, :owner_vat, '$y-$m-$d $h:$i:$s', :num, :indicator, :value);");
  if ($stmt3 == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  $stmt4= $connection->prepare("INSERT INTO performed VALUES(:animal_name, :owner_vat, '$y-$m-$d $h:$i:$s', :num, :vat_ass);");

  if ($stmt4 == FALSE)
  {
    $info = $connection->errorInfo();
    echo("<p>Error: {$info[2]}</p>");
    exit();
  }

  $stmt1->bindParam(':animal_name', $animal_name);
  $stmt1->bindParam(':owner_vat', $owner_vat);
  $stmt1->bindParam(':num', $num);

  $stmt2->bindParam(':animal_name', $animal_name);
  $stmt2->bindParam(':owner_vat', $owner_vat);
  $stmt2->bindParam(':num', $num);

  $stmt3->bindParam(':animal_name', $animal_name);
  $stmt3->bindParam(':owner_vat', $owner_vat);
  $stmt3->bindParam(':num', $num);
  $stmt3->bindParam(':indicator', $indicator);
  $stmt3->bindParam(':value', $value);

  $stmt4->bindParam(':animal_name', $animal_name);
  $stmt4->bindParam(':owner_vat', $owner_vat);
  $stmt4->bindParam(':num', $num);
  $stmt4->bindParam(':vat_ass', $vat_ass);


  $result1= $stmt1->execute();
  $result2= $stmt2->execute();
  $result3= $stmt3->execute();
  $result4= $stmt4->execute();


  if($result1 && $result2 && $result3 && $result4)
  {

    $connection->commit();
    $connection = null;
    header("Location: list_consults.php?owner_vat=$owner_vat");
  }

  else{
    $connetion->rollback();
    $connection = null;
    echo "error";
  }

  ?>
</body>
</html>
