<?php
session_start();
$animal_name= $_SESSION['animal_name'];
$owner_vat= $_REQUEST['owner_vat'];
$_SESSION['owner_vat'] = $owner_vat;
?>
<html>
  <head>
    <title> List of Consults </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <img src="logo.png" alt="logo" style="width:200px;height:200px;">
        <b> <font size="5"> <?php echo("<p>Records</p>"); echo("<p><font size = '4'> $animal_name | $owner_vat</font></p>"); ?> </font></b>
        <?php
          require("connection.php");
          $stmt = $connection->prepare("SELECT date_timestamp FROM consult WHERE consult.name = :animal_name AND consult.VAT_owner = :owner_vat;");
          if ($stmt == FALSE)
          {
            $info = $connection->errorInfo();
            echo("<p>Error: {$info[2]}</p>");
            exit();
          }
          $stmt->bindParam(':animal_name', $animal_name);
          $stmt->bindParam(':owner_vat', $owner_vat);
          $stmt->execute();
          $result = $stmt->fetchAll();
          echo("<table border=\"0\" cellspacing=\"5\">\n");
          echo("<tr><td> <b>DATE</b></td></tr>");
            foreach($result as $row)
            {
              echo("<tr><td>");
              echo($row['date_timestamp']);
              echo("</td><td>");
              echo("<td><a href=\"consult_info.php?date_timestamp=");
              echo($row['date_timestamp']);
              echo("\">Consult Info</a></td>");
              echo("</td><td>");
              echo("<td> <a href=\"data_procedure.php?date_timestamp=");
              echo($row['date_timestamp']);
              echo("\"> Blood Test Procedure Registration</a></td>\n");
              echo("</tr>\n");
            }
            echo("</table>");
            echo('<font size="3"><p><b> Register New Consult </b></p></font>');
        ?>
        <form>
          <input type="button" value="Register Consult" onclick="window.location.href='data_consult.php'" />
        </form>
        <?php $connection = null; ?>
      </center>
    </font>
  </body>
</html>
