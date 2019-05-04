# health-clinic-web-app
MySQL and PHP project. A web application for a veterinary health clinic 🐶👨‍⚕️🏥
To run this project you need to provide your database login information in a file named "connection.php" with the following code:
``` php
<?php
	$host="insert-here-your-localhost";
	$user="insert-here-your-username";
	$pass="insert-here-your-password";
	$dbname = $user;
	$dsn = "mysql:host=$host;dbname=$dbname";
	try
	{
	  $connection = new PDO($dsn, $user, $pass);
	}
	catch(PDOException $exception)
	{
	  echo("<p>Error: ");
	  echo($exception->getMessage());
	  echo("</p>");
	  exit();
	}
?>
```
