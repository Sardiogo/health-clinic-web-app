<?php
 session_start();
?>
<html>
  <head>
    <title> Check Client </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <img src="logo.png" alt="logo" style="width:200px;height:200px;">
        <p> <b> <font size="5"> Records </font></b> </p>
        <?php
          require("connection.php");
          $VAT_client = $_SESSION["VAT_client"];
          $stmt = $connection->prepare("SELECT client.VAT FROM client WHERE client.VAT = :VAT_client;");
          if ($stmt == FALSE)
          {
            $info = $connection->errorInfo();
            echo("<p>Error: {$info[2]}</p>");
            exit();
          }
          $stmt->bindParam(':VAT_client', $VAT_client);
          $stmt->execute();
          $result = $stmt->fetchAll();
          if ($result == NULL)
          {
            echo('<font size="4"> This person is not a client in the database. Would you like to add this person as a client </font>');
        ?>
        <form>
          <input type="button" value="Add Person as Client" onclick="window.location.href='insert_client.php'" />
        </form>
        <?php
          }
          else
          {
            header("Location: check_animal.php");
          }
          $connection = null;
        ?>
      </center>
    </font>
  </body>
</html>
