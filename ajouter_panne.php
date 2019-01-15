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

	$query1 = "SELECT id_client, nom_client FROM clients ORDER BY id_client ASC";

	$resultado1_c = mysqli_query($enlace, $query1);

	if (isset($_POST[agregar])) {

		//RECUPERAR VALORES DEL FORMULARIO
		$id_machine = $_REQUEST[id_machine];
		$id_interv = $_REQUEST[id_interv];
		$date = $_REQUEST[date];
		$organe = $_REQUEST[organe];
		$operation = $_REQUEST[operation];
		$nature_panne = $_REQUEST[nature_panne];
		$cause_panne = $_REQUEST[cause_panne];
		$garantie = $_REQUEST[garantie];
		$temps_darret = $_REQUEST[temps_darret];
		$PR = $_REQUEST[PR];
		$tps_interv = $_REQUEST[tps_interv];
		$compteur = $_REQUEST[compteur];
		$commentaire = $_REQUEST[commentaire];

		//VERIFICAR SI ESTAN VACIOS PARA HACERLOS NULL
		$organe = !empty($organe) ? "'$organe'" : "NULL";
		$operation = !empty($operation) ? "'$operation'" : "NULL";
		$nature_panne = !empty($nature_panne) ? "'$nature_panne'" : "NULL";
		$cause_panne = !empty($cause_panne) ? "'$cause_panne'" : "NULL";
		$garantie = is_null($garantie) ? 0 : 1;
		$PR = !empty($PR) ? "'$PR'" : "NULL";
		$commentaire = !empty($commentaire) ? "'$commentaire'" : "NULL";

		$query = "INSERT INTO panne_p (id_machine, id_interv, date, organe, operation, nature_panne, cause_panne, garantie, temps_darret, PR, tps_interv, compteur, commentaire) VALUES ($id_machine, $id_interv, '$date', $organe, $operation, $nature_panne, $cause_panne, $garantie, $temps_darret, $PR, $tps_interv, $compteur, $commentaire)";
		
		mysqli_query($enlace, $query);
		header('Location: tableau.php');

	}
	else{
	
?>

<html>
	<head>
		<title>Enregistrer Panne</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/ajouter_machine_style.css">
	</head>

	<body>

		<ul>
			<li><a href="tableau.php"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="ajouter_machine.php"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="ajouter_maintenance.php"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="#" class="active"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="maint_prev.php"><i class="material-icons">build</i>&nbsp;Maintenance préventive</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<form id="ajouter_panne" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

				<p>Machine: 
					<select name="id_machine">
						<option>Sélectionnez...</option>
						
						<?php

							while ($row1_c = mysqli_fetch_assoc($resultado1_c)) {

								$query2 = "SELECT id_machine, nom_machine FROM machine WHERE id_client=".$row1_c["id_client"];
							$resultado2_m = mysqli_query($enlace, $query2);
						?>

						<optgroup label="<?php echo $row1_c["nom_client"]?>">
							
							<?php 
								while ($row2_m = mysqli_fetch_assoc($resultado2_m)) { ?>

							<option value="<?php echo $row2_m["id_machine"] ?>">
								<?php echo $row2_m["nom_machine"]?>
					
							</option>
							<?php } ?>

						</optgroup>
						<?php } ?>
					</select>*

				</p>
				
				<p>Intervenant
					<select name="id_interv">
						<option value="<?php echo $_SESSION["id"] ?>">
							<?php echo $_SESSION["nombre"] ?>
						</option>
					</select>*
				</p>

				<p>Date:
					<input type="date" name="date">*
				</p>

				<p>Organe:
					<input type="text" name="organe">
				</p>

				<p>Opération:
					<input type="text" name="operation">
				</p>

				<p>Nature panne:
					<input type="text" name="nature_panne">
				</p>

				<p>Cause panne:
					<input type="text" name="cause_panne">
				</p>

				<p>Garantie:
					<input type="checkbox" name="garantie" value="1">
				</p>

				<p>Temps d'arrêt:
					<input type="number" name="temps_darret" value="0">
				</p>

				<p>PR:
					<input type="text" name="PR">
				</p>

				<p>Tps Interv:
					<input type="number" name="tps_interv" value="0">
				</p>

				 <p>Compteur:
					<input type="number" name="compteur" value="0">
				</p>

				<p>Commentaire:
					<br/>
					<textarea name="commentaire" form="ajouter_panne" rows="7" cols="100"></textarea>
				</p>
			  
				<p>
					<input type="reset" value="Effacer" id="boton">
			  		<input type="submit" name="agregar" value="Enregistrer panne" id="boton">
			  	</p>
		</form>

	</body>
</html>

<?php } 
	mysqli_free_result($resultado1_c);
	mysqli_free_result($resultado2_m);
	mysqli_close($enlace);

?>