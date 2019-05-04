<?php
  session_start();
?>
<html>
  <head>
    <title> Check Animal </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <img src="logo.png" alt="logo" style="width:200px;height:200px;">
        <p> <b> <font size="5"> Records </font></b> </p>
        <?php
          require("connection.php");
          $VAT_client = $_SESSION['VAT_client'];
          $animal_name= $_SESSION['animal_name'];
          $owner_name = $_SESSION['owner_name'];
          $stmt= $connection->prepare("SELECT animal.name as a_name, person.name as p_name, person.VAT as owner_vat FROM animal, person WHEREanimal.name=:animal_name AND animal.VAT=person.VAT AND person.name like CONCAT('%',:owner_name,'%');");
          if ($stmt == FALSE)
          {
            $info = $connection->errorInfo();
            echo("<p>Error: {$info[2]}</p>");
            exit();
          }
          $stmt->bindParam(':animal_name', $animal_name);
          $stmt->bindParam(':owner_name', $owner_name);
          $stmt->execute();
          $result = $stmt->fetchAll();
          if ($result==NULL)
          {
            echo('<font size="3"><p> No Matching Records Found. </p></font>');
        ?>
        <form>
          <input type="button" value="New Animal" onclick="window.location.href='insert_animal.php'" />
        </form>
        <?php
          }
          else
          {
            echo("<table border=\"0\" cellspacing=\"5\">\n");
            echo("<tr><td> <b> Animal </b></td><td><b>Owner</b> </td></tr>");
            foreach($result as $row)
            {
              echo("<tr><td>");
              echo($row['a_name']);
              echo("</td><td>");
              echo($row['p_name']);
              echo("</td><td>");
              echo("<td><a href=\"list_consults.php?owner_vat=");
              echo($row['owner_vat']);
              echo("\">Consults</a></td>\n");
              echo("</tr>\n");
            }
            echo("</table>");
          }
          $connection = null;
        ?>
      </center>
    </font>
  </body>
</html>
