<?php
session_start();

$VAT_person = $_SESSION['VAT_client'];
$animal_name= $_SESSION['animal_name'];
$owner_vat= $_SESSION['owner_vat'];

?>

<html>
<head>
  <title> Data Consult </title>
</head>
<body>
  <font face = "verdana" size = "8">
    <center>
      <form action="register_consult.php" method="post">
        <img src="logo.png" alt="logo" style="width:200px;height:200px;">
        <p> <b> <font size="5"> Consult Information Form </font></b> </p>
        <table>
          <?php
          echo("<tr><td>Animal Name</td><td>$animal_name</td></tr>");
          echo("<tr><td>VAT owner</td><td>$owner_vat</td></tr>");
          ?>
          <tr><td> S </td><td><input type="text" name="s" size="50" required/></td></tr>
          <tr><td> O </td><td><input type="text" name="o" size="50" required/></td></tr>
          <tr><td> A </td><td><input type="text" name="a" size="50" required/></td></tr>
          <tr><td> P </td><td><input type="text" name="p" size="50" required/></td></tr>


          <tr><td>VAT Veterinary</td> <td>
            <select name="vat_vet">
              <?php
              require("connection.php");
              $stmt = $connection->prepare("SELECT vat FROM veterinary ORDER BY vat;");

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

          <tr><td> Weight </td><td><input type="number" name="weight" required/></td></tr>

          <tr><td>Diagnosis Code </td> <td>
            <select name="code">
              <?php

              $stmt = $connection->prepare("SELECT code FROM diagnosis_code ORDER BY code;");

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
                $code = $row[code];
                echo("<option value=\"$code\">$code</option>");
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
