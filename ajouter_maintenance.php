<?php

	/*Comprobar Sesion*/

	session_start();
	if(!isset($_SESSION["id"]) && !isset($_SESSION["nombre"])){
		echo "No has iniciado sesion";
		header('Location: index.php');
	}
?>

	<h3 style="color: #e4f1fe;margin: 10px;">Bienvenu: <?php echo $_SESSION["nombre"]; ?> </h3>

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
	$oper = "SELECT id_oper, intitule FROM operation ORDER BY id_oper ASC";

	$resultado1_c = mysqli_query($enlace, $query1);
	$resultado3_o = mysqli_query($enlace, $oper);

	if (isset($_POST[agregar])) {

		//RECUPERAR VALORES DEL FORMULARIO
		$id_machine = $_REQUEST[id_machine];
		$id_oper = $_REQUEST[id_oper];
		$id_interv = $_REQUEST[id_interv];
		$date = $_REQUEST[date];
		$echeance = $_REQUEST[echeance];
		$compteur = $_REQUEST[compteur];
		$commentaire = $_REQUEST[commentaire];

		//VERIFICAR SI ESTAN VACIOS PARA HACERLOS NULL
		$echeance = !empty($echeance) ? "'$echeance'" : "NULL";
		$commentaire = !empty($commentaire) ? "'$commentaire'" : "NULL";

		$query = "INSERT INTO maintenance_p (id_machine, id_oper, id_interv, date, echeance, compteur, commentaire) VALUES ($id_machine, $id_oper, $id_interv, '$date', $echeance, $compteur, $commentaire)";
		
		mysqli_query($enlace, $query);
		header('Location: tableau.php');

	}
	else{
	
?>

<html>
	<head>
		<title>Ajouter Machine</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/tableau_style.css">
	</head>

	<body>

		<ul>
			<li><a href="tableau.php"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="ajouter_machine.php"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="#" class="active"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="ajouter_panne.php"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<form id="ajouter_maintenance" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

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

				<p>Operation
					<select name="id_oper">
						<?php 
							while ($row3_o = mysqli_fetch_assoc($resultado3_o)) { ?>

							<option value="<?php echo $row3_o["id_oper"] ?>">
								<?php 
									echo $row3_o["intitule"]?>
							</option>
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

				<p>Échéance:
					<input type="date" name="echeance">
				</p>

				<p>Compteur:
					<input type="number" name="compteur" value="0">
				</p>

				<p>Commentaire:
					<textarea name="commentaire" form="ajouter_maintenance" rows="7" cols="100"></textarea>
				</p>
			  
				<p>
					<input type="reset" value="Effacer">
			  		<input type="submit" name="agregar" value="Ajouter machine">
			  	</p>
		</form>

	</body>
</html>

<?php } 
	mysqli_free_result($resultado1_c);
	mysqli_free_result($resultado2_m);
	mysqli_free_result($resultado3_o);
	mysqli_close($enlace);

?>