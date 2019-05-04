<?php
  session_start();
?>
<html>
  <body>
    <?php
      require("connection.php");
      $VAT_person = $_SESSION["VAT_client"];
      $pname = $_REQUEST['pname'];
      $pstreet = $_REQUEST['pstreet'];
      $pcity = $_REQUEST['pcity'];
      $pzip = $_REQUEST['pzip'];
      $pphone = $_REQUEST['pphone'];
      $stmt= $connection->prepare("INSERT INTO person VALUES (:VAT_person,:pname,:pstreet,:pcity,:pzip);
      INSERT INTO phone_number VALUES(:VAT_person,:pphone);
      INSERT INTO client VALUES(:VAT_person);");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':VAT_person', $VAT_person);
      $stmt->bindParam(':pname', $pname);
      $stmt->bindParam(':pstreet', $pstreet);
      $stmt->bindParam(':pcity', $pcity);
      $stmt->bindParam(':pzip', $pzip);
      $stmt->bindParam(':pphone', $pphone);
      $stmt->execute();
      $connection = null;
      header("Location: check_animal.php");
    ?>
  </body>
</html>
