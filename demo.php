<?php

$id = $_GET["id"];
$nom = $_GET["nom"];

?>
<!DOCTYPE html>
<html>
<head>
	<title>demo</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<style type="text/css">a{margin-left: 30px;font-size: 18px;}</style>
</head>
<body>
	<h3 style="font-family: 'Montserrat', sans-serif;"><i class="material-icons">arrow_back</i>&nbsp;Sélectionnez une machine s'il vous plaît</h3>
	<br/>
	<a href="exportar_maintenance_todos.php?id=<?php echo $id; ?>&nom=<?php echo $nom; ?>">
		Exporter liste des operations de maintenance de <?php echo $nom; ?>
	</a>
	<br/><br/>
	<a href="exportar_panne_todos.php?id=<?php echo $id; ?>&nom=<?php echo $nom; ?>">
		Exporter liste des pannes de <?php echo $nom; ?>
	</a>
</body>
</html>