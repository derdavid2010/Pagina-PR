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
		$nom_client = $_REQUEST[nom_client];
		$nom_responsable = $_REQUEST[nom_responsable];
		$adresse = $_REQUEST[adresse];
		$CP = $_REQUEST[CP];
		$tel_responsable = $_REQUEST[tel_responsable];
		$tel_mobile = $_REQUEST[tel_mobile];
		$email = $_REQUEST[email];
		$date_derniere_visite = $_REQUEST[date_derniere_visite];
		$commentaire = $_REQUEST[commentaire];

		//VERIFICAR SI ESTAN VACIOS PARA HACERLOS NULL
		$nom_responsable = !empty($nom_responsable) ? "'$nom_responsable'" : "NULL";
		$adresse = !empty($adresse) ? "'$adresse'" : "NULL";
		$email = !empty($email) ? "'$email'" : "NULL";
		$date_derniere_visite = !empty($date_derniere_visite) ? "'$date_derniere_visite'" : "NULL";
		$commentaire = !empty($commentaire) ? "'$commentaire'" : "NULL";

		$query = "INSERT INTO clients (nom_client, nom_responsable, adresse, CP, tel_responsable, tel_mobile, email, date_derniere_visite, commentaire) VALUES ('$nom_client', $nom_responsable, $adresse, $CP, $tel_responsable, $tel_mobile, $email, $date_derniere_visite, $commentaire)";
		
		mysqli_query($enlace, $query);
		header('Location: tableau.php');

	}
	else{
	
?>

<html>
	<head>
		<title>Ajouter Maintenance</title>
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
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="#" class="active"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="maint_prev.php"><i class="material-icons">build</i>&nbsp;Maintenance préventive</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<form id="ajouter_client" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

				<p>Nom client:
					<input type="text" name="nom_client">*
				</p>

				<p>Nom responsable:
					<input type="text" name="nom_responsable">
				</p>

				<p>Adresse:
					<input type="text" name="adresse">
				</p>

				<p>CP:
					<input type="text" name="CP" value="00000">
				</p>

				<p>Tel responsable:
					<input type="number" name="tel_responsable" value="0">
				</p>

				<p>Tel mobile:
					<input type="number" name="tel_mobile" value="0">
				</p>

				<p>Email:
					<input type="email" name="email">
				</p>

				<p>Date de la dernière visite:
					<input type="date" name="date_derniere_visite">
				</p>

				<p>Commentaire:
					<br/>
					<textarea name="commentaire" form="ajouter_client" rows="7" cols="100"></textarea>
				</p>
			  
				<p>
					<input type="reset" value="Effacer" id="boton">
			  		<input type="submit" name="agregar" value="Ajouter client" id="boton">
			  	</p>
		</form>

	</body>
</html>

<?php } 

	mysqli_close($enlace);

?>