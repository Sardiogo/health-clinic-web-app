<?php
session_start();
?>
<html>
  <body>
    <?php
      require("connection.php");
      $VAT_owner = $_SESSION["VAT_client"];
      $a_name = $_SESSION['animal_name'];
      $species = $_REQUEST['s_name'];
      $colour = $_REQUEST['colour'];
      $gender = $_REQUEST['gender'];
      $birth_year = $_REQUEST['birth_year'];
      $age = $_REQUEST['age'];
      $stmt = $connection->prepare( "INSERT INTO animal VALUES (:a_name, :VAT_owner,:species,:colour,:gender, :birth_year, :age);");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':a_name', $a_name);
      $stmt->bindParam(':VAT_owner', $VAT_owner);
      $stmt->bindParam(':species', $species);
      $stmt->bindParam(':colour', $colour);
      $stmt->bindParam(':gender', $gender);
      $stmt->bindParam(':birth_year', $birth_year);
      $stmt->bindParam(':age', $age);
      $stmt->execute();
      $connection = null;
      header('Location: check_animal.php');
    ?>
  </body>
</html>
