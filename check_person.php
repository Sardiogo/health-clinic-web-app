<?php
  session_start();
?>
<html>
  <head>
    <title> Check Person </title>
  </head>
<body>
  <font face = "verdana" size = "8">
    <center>
      <img src="logo.png" alt="logo" style="width:200px;height:200px;">
      <p> <b> <font size="5"> Records </font></b> </p>
      <?php
        require("connection.php");
        $VAT_client = $_REQUEST['VAT_client'];
        $animal_name = $_REQUEST['animal_name'];
        $owner_name = $_REQUEST['owner_name'];
        $_SESSION["VAT_client"] = $VAT_client;
        $_SESSION["animal_name"] = $animal_name;
        $_SESSION["owner_name"] = $owner_name;
        $stmt= $connection->prepare("SELECT * FROM person WHERE person.VAT =:vat_client;");
        if ($stmt == FALSE)
        {
          $info = $connection->errorInfo();
          echo("<p>Error: {$info[2]}</p>");
          exit();
        }
        $stmt->bindParam(':vat_client', $VAT_client);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if ($result == NULL)
        {
          echo('<font size="4">This person is not in the database. Would you like to add a new person and client?</font>');
          ?>
            <form>
              <input type="button" value="Add Person and Client" onclick="window.location.href='insert_person.php'" />
            </form>
          <?php
        }
        else
        {
          header("Location: check_client.php");
        }
        $connection = null;
      ?>
    </center>
  </font>
</body>
</html>