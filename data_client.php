<?php
  session_destroy();
  session_start();
?>
<html>
  <head>
    <title> Data Client </title>
  </head>
  <body>
    <font face = "verdana" size = "8">
      <center>
        <form action="check_person.php" method="post">
          <img src="logo.png" alt="logo" style="width:200px;height:200px;">
          <p><b><font size="5"> Check Client & Animal </font></b></p>
            <table>
              <tr><td> VAT Client </td><td> <input type="number" name="VAT_client" required/></td></tr>
              <tr><td> Animal Name </td><td><input type="text" name="animal_name" required/></td></tr>
              <tr><td> Owner Name </td><td><input type="text" name="owner_name" required/></td></tr>
            </table>
          <p><input type="submit"/></p>
        </form>
      </center>
    </font>
  </body>
</html>
