<?php
session_start();
$animal_name= $_SESSION['animal_name'];
$owner_vat= $_SESSION['owner_vat'];
$timestamp = $_REQUEST['date_timestamp'];
?>
<html>
<head>
  <title> Consult Information </title>
</head>
<body>
  <font face = "verdana" size = "8">
    <center>
      <img src="logo.png" alt="logo" style="width:200px;height:200px;">
      <b> <font size="5"> <?php echo("<p>Consult Information</p>"); echo("<p><font size = '4'> $animal_name | $owner_vat | $timestamp</font></p>"); ?> </font></b>

      <?php
      require("connection.php");

      $stmt = $connection->prepare("SELECT species_name, colour, gender, birth_year, age
      FROM animal WHERE name = :animal_name AND VAT = :owner_vat;");
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
      foreach($result as $row)
      {
        echo("<tr><td><b>Animal Information</b></td></tr>");
        echo("<tr><td><b>Species</b></td><td>");
        echo($row['species_name']);
        echo("</td></tr>");
        echo("<tr><td><b>Colour</b></td><td>");
        echo($row['colour']);
        echo("</td></tr>");
        echo("<tr><td><b>Gender</b></td><td>");
        echo($row['gender']);
        echo("</td></tr>");
        echo("<tr><td><b>Birth Year</b></td><td>");
        echo($row['birth_year']);
        echo("</td></tr>");
        echo("<tr><td><b>Age</b></td><td>");
        echo($row['age']);
        echo("</td></tr>");
      }
      echo("</table>");

      $stmt = $connection->prepare("SELECT s, o, a, p, VAT_client, VAT_vet, weight
      FROM consult WHERE name = :animal_name AND VAT_owner = :owner_vat AND date_timestamp = :dtimestamp;");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':animal_name', $animal_name);
      $stmt->bindParam(':owner_vat', $owner_vat);
      $stmt->bindParam(':dtimestamp', $timestamp);
      $stmt->execute();
      $result = $stmt->fetchAll();

      echo("<p></p>");
      echo("<table border=\"0\" cellspacing=\"5\">\n");
      foreach($result as $row)
      {
        echo("<tr><td><b>Consult Information</b></td></tr>");
        echo("<tr><td><b>S</b></td><td>");
        echo($row['s']);
        echo("</td></tr>");
        echo("<tr><td><b>O</b></td><td>");
        echo($row['o']);
        echo("</td></tr>");
        echo("<tr><td><b>A</b></td><td>");
        echo($row['a']);
        echo("</td></tr>");
        echo("<tr><td><b>P</b></td><td>");
        echo($row['p']);
        echo("</td></tr>");
        echo("<tr><td><b>Client VAT</b></td><td>");
        echo($row['VAT_client']);
        echo("</td></tr>");
        echo("<tr><td><b>Veterinary VAT</b></td><td>");
        echo($row['VAT_vet']);
        echo("</td></tr>");
        echo("<tr><td><b>Weight</b></td><td>");
        echo($row['weight']);
        echo("</td></tr>");
      }
      echo("</table>");

      $stmt = $connection->prepare("SELECT code
      FROM consult_diagnosis WHERE name = :animal_name AND VAT_owner = :owner_vat AND date_timestamp = :dtimestamp;");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':animal_name', $animal_name);
      $stmt->bindParam(':owner_vat', $owner_vat);
      $stmt->bindParam(':dtimestamp', $timestamp);
      $stmt->execute();
      $result = $stmt->fetchAll();

      echo("<p></p>");
      echo("<table border=\"0\" cellspacing=\"5\">\n");
      foreach($result as $row)
      {
        echo("<tr><td><b>Consult Diagnosis</b></td></tr>");
        echo("<tr><td><b>Code</b></td><td>");
        echo($row['code']);
        echo("</td></tr>");
      }
      echo("</table>");

      $stmt = $connection->prepare("SELECT name_med, lab, dosage, regime
      FROM prescription WHERE name = :animal_name AND VAT_owner = :owner_vat AND date_timestamp = :dtimestamp;");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':animal_name', $animal_name);
      $stmt->bindParam(':owner_vat', $owner_vat);
      $stmt->bindParam(':dtimestamp', $timestamp);
      $stmt->execute();
      $result = $stmt->fetchAll();

      echo("<p></p>");
      echo("<table border=\"0\" cellspacing=\"5\">\n");
      $c = 1;
      foreach($result as $row)
      {
        echo("<tr><td><b>Prescription</b></td><td>");
        echo($c);
        echo("</td></tr>");
        echo("<tr><td><b>Med. Name</b></td><td>");
        echo($row['name_med']);
        echo("</td></tr>");
        echo("<tr><td><b>Lab</b></td><td>");
        echo($row['lab']);
        echo("</td></tr>");
        echo("<tr><td><b>Dosage</b></td><td>");
        echo($row['dosage']);
        echo("</td></tr>");
        echo("<tr><td><b>Regime</b></td><td>");
        echo($row['regime']);
        echo("</td></tr>");
        $c = $c + 1;
      }
      echo("</table>");




      $stmt = $connection->prepare("SELECT descripton
      FROM procedure_consult WHERE name = :animal_name AND VAT_owner = :owner_vat AND date_timestamp = :dtimestamp;");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':animal_name', $animal_name);
      $stmt->bindParam(':owner_vat', $owner_vat);
      $stmt->bindParam(':dtimestamp', $timestamp);
      $stmt->execute();
      $result = $stmt->fetchAll();

      echo("<p></p>");
      echo("<table border=\"0\" cellspacing=\"5\">\n");
      echo("<tr><td><b>Consult Procedure</b></td></tr>");
      foreach($result as $row)
      {
        echo("<tr><td><b>Procedure </b></td><td>");
        echo($row['descripton']);
        echo("</td></tr>");
      }
      echo("</table>");


      $stmt = $connection->prepare("SELECT indicator_name,value, type_indicator
      FROM produced_indicator left outer join indicator on (indicator_name=indicator.name)
      WHERE produced_indicator.name = :animal_name AND VAT_owner = :owner_vat AND date_timestamp = :dtimestamp;");
      if ($stmt == FALSE)
      {
        $info = $connection->errorInfo();
        echo("<p>Error: {$info[2]}</p>");
        exit();
      }
      $stmt->bindParam(':animal_name', $animal_name);
      $stmt->bindParam(':owner_vat', $owner_vat);
      $stmt->bindParam(':dtimestamp', $timestamp);
      $stmt->execute();
      $result = $stmt->fetchAll();


      echo("<table border=\"1\" cellspacing=\"5\">\n");

      echo("<tr><td><b>Procedure Indicators </b></td></tr>");
      echo("<tr><td><b>Type</b></td><td> <b>Indicator Name</b> </td><td> <b> Value </td></tr>");


      foreach($result as $row)
      {

        if ($row['type_indicator']==1  )
        {
          echo("<tr> <td> Blood </td>");
        }
        else
        {
        echo(" <tr> <td> Urine </td>");
        }

        echo("<td>");
        echo($row['indicator_name']);
        echo("</td>");

        echo("<td>");
        echo($row['value']);
        echo("</td></tr>");

      }
      echo("</table>");

      $connection = null;

      ?>

    </center>
  </font>
</body>
</html>
