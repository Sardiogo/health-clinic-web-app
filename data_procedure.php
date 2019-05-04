<?php
  session_start();
  $animal_name= $_SESSION['animal_name'];
  $owner_vat= $_SESSION['owner_vat'];
  $date_timestamp = $_REQUEST['date_timestamp'];
  $_SESSION['date_timestamp']= $date_timestamp;
?>
<html>
  <head>
    <title> Data Procedure </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <form action="register_procedure.php" method="POST">

          <img src="logo.png" alt="logo" style="width:200px;height:200px;">
          <p> <b> <font size="5"> Procedure Form </font></b> </p>

          <table>
            <?php
              echo("<tr><td>Animal Name</td><td>$animal_name</td></tr>");
              echo("<tr><td>VAT owner</td><td>$owner_vat</td></tr>");
            ?>
            <tr><td>VAT Assistant</td> <td>
              <select name="vat_ass">
                <?php
                  require("connection.php");
                  $stmt = $connection->prepare("SELECT vat FROM assistant ORDER BY vat;");
                  if ($stmt == FALSE)
                  {
                    $info = $connection->errorInfo();
                    echo("<p>Error: {$info[2]}</p>");
                    exit();
                  }
                  $stmt->execute();
                  $result = $stmt->fetchAll();
                  foreach($result as $row)
                  {
                    $vat = $row[vat];
                    echo("<option value=\"$vat\">$vat</option>");
                  }
                ?>
              </select>
            </td></tr>
            <tr><td> Indicator Value </td><td><input type="number" name="value" required/></td></tr>
            <tr><td> Indicator name</td> <td>
              <select name="indicator">
                <?php
                  $stmt = $connection->prepare("SELECT * FROM indicator WHERE type_indicator=1 ORDER BY name;");
                  if ($stmt == FALSE)
                  {
                    $info = $connection->errorInfo();
                    echo("<p>Error: {$info[2]}</p>");
                    exit();
                  }
                  $stmt->execute();
                  $result = $stmt->fetchAll();
                  foreach($result as $row)
                  {
                    echo("<option value=\"$row[name]\">$row[name] - $row[units] </option>");
                  }
                  $connection = null;
                ?>
              </select>
            </td></tr>
          </table>
        <p><input type="submit"/></p>
        </form>
      </center>
    </font>
  </body>
</html>
