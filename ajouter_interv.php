<?php

	/*Comprobar Sesion*/

	session_start();
	if(!isset($_SESSION["id"]) && !isset($_SESSION["nombre"])){
		echo "No has iniciado sesion";
		header('Location: index.php');
	}
?>

	<h3 style="position: fixed; color: #e4f1fe; padding-left: 10px;">Bienvenu: <?php echo $_SESSION["nombre"]; ?> </h3> 
	<h3 align="right" style="position: static; color: #e4f1fe;margin: 10px;"> 
		<?php 
		date_default_timezone_set('America/Mexico_City');
		setlocale(LC_TIME, "fr_FR");
		echo strftime("%A %d %B %G - %R"); ?> </h3>

<?php
	
	require_once 'conexion.php';
	$enlace = mysqli_connect($hostname, $username, $password, $database);

	/* comprobar la conexión */
	if (!$enlace) {
	    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
	    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
	    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
	    exit;
	}

	//$id = $_GET["id"];


	if (isset($_POST[agregar])) {

		//RECUPERAR VALORES DEL FORMULARIO
		$nom_interv = $_REQUEST[nom_interv];
		$correo = $_REQUEST[correo];
		$pass = $_REQUEST[pass];

		$query = "INSERT INTO intervenants (nom_interv, correo, pass) VALUES ('$nom_interv', '$correo', '$pass')";
		
		mysqli_query($enlace, $query);
		header('Location: tableau.php');

	}
	else{
	
?>

<html>
	<head>
		<title>Nouveau intervenant</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/ajouter_machine_style.css">
	</head>

	<body>

		<ul>
			<li><a href="tableau.php"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="ajouter_machine.php"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="ajouter_maintenance.php"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="ajouter_oper.php"><i class="material-icons">add</i>&nbsp;Ajouter opération de maintenance</a></li>
			<li><a href="ajouter_panne.php"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="#" class="active"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="maint_prev.php"><i class="material-icons">build</i>&nbsp;Maintenance préventive</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<form id="ajouter_interv" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

				<p>Nom intervenant:
					<input type="text" name="nom_interv">*
				</p>

				<p>Email:
					<input type="text" name="correo">*
				</p>

				<p>Mot de passe:
					<input type="text" name="pass">*
				</p>
			  
				<p>
					<input type="reset" value="Effacer" id="boton">
			  		<input type="submit" name="agregar" value="Enregistrer intervenant" id="boton">
			  	</p>
		</form>

	</body>
</html>

<?php } 
	mysqli_close($enlace);
?>