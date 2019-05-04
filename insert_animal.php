<?php
  session_start();
  $VAT_owner = $_SESSION["VAT_client"];
  $a_name = $_SESSION['animal_name'];
?>
<html>
  <head>
    <title> Register animal </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <form action="insert_animal_db.php" method="post">
          <img src="logo.png" alt="logo" style="width:200px;height:200px;">
          <p> <b> <font size="5"> Animal Information Form </font></b> </p>
          <table>
            <?php echo("<tr><td>VAT Owner</td><td>$VAT_owner</td></tr>"); ?>
            <?php echo("<tr><td>Name</td><td>$a_name</td></tr>"); ?>
            <tr>
              <td>Species</td> 
              <td><select name="s_name">
              <?php
                  require("connection.php");
                  $stmt = $connection->prepare("SELECT name FROM species ORDER BY name;");
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
                    $name = $row['name'];
                    echo("<option value=\"$name\">$name</option>");
                  }
                  $connection = null;
              ?>
              </select></td>
            </tr>
            <tr><td> Colour </td><td><input type="text" name="colour" required/></td></tr>
            <tr><td> Gender </td><td><input type="text" name="gender" required/></td></tr>
            <tr><td> Birth year </td><td><input type="number" name="birth_year" required/></td></tr>
            <tr><td> Age </td><td><input type="number" name="age"required/></td></tr>
          </table>
          <p><input type="submit"/></p>
        </form>
      </center>
    </font>
  </body>
</html>
