<?php
 session_start();
?>
<html>
  <body>
    <?php
      require("connection.php");
      $VAT_client = $_SESSION["VAT_client"];
      $stmt = $connection->prepare("INSERT INTO client VALUES (:VAT_client);");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':VAT_client', $VAT_client);
      $stmt->execute();
      $result = $stmt->fetchAll();
      $connection = null;
      header("Location: check_animal.php");
    ?>
  </body>
</html>
