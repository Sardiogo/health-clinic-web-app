<?php
  session_start();
  $VAT_person = $_SESSION["VAT_client"];
?>
<html>
  <head>
    <title> Data Person </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <form action="insert_person_db.php" method="post">
          <img src="logo.png" alt="logo" style="width:200px;height:200px;">
          <p> <b> <font size="5"> Personal Information Form </font></b> </p>
          <table>
            <?php
              echo("<tr><td>VAT Person</td><td>$VAT_person</td></tr>");
            ?>
            <tr><td> Name </td><td><input type="text" name="pname" required/></td></tr>
            <tr><td> Street </td><td><input type="text" name="pstreet" required/></td></tr>
            <tr><td> City </td><td><input type="text" name="pcity" required/></td></tr>
            <tr><td> ZIP </td><td><input type="number" name="pzip" required/></td></tr>
            <tr><td> Phone Number </td><td><input type="number" name="pphone" required/></td></tr>
          </table>
          <p><input type="submit"/></p>
        </form>
      </center>
    </font>
  </body>
</html>
