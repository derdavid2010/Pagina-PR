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



	if (isset($_POST[agregar])) {

		//RECUPERAR VALORES DEL FORMULARIO
		$id_client = $_REQUEST[id_client];
		$nom_machine = $_REQUEST[nom_machine];
		$designation = $_REQUEST[designation];
		$type = $_REQUEST[type];
		$reference = $_REQUEST[reference];
		$marque = $_REQUEST[marque];
		$fournisseur = $_REQUEST[fournisseur];
		$commentaire = $_REQUEST[commentaire];
		$compteur = $_REQUEST[compteur];
		$nb_arrets = $_REQUEST[nb_arrets];
		$temps_arrets = $_REQUEST[temps_arrets];
		$montant_pieces = $_REQUEST[montant_pieces];
		$tps_mo = $_REQUEST[tps_mo];
		$nb_inter = $_REQUEST[nb_inter];

		//VERIFICAR SI ESTAN VACIOS PARA HACERLOS NULL
		$designation = !empty($designation) ? "'$designation'" : "NULL";
		$type = !empty($type) ? "'$type'" : "NULL";
		$reference = !empty($reference) ? "'$reference'" : "NULL";
		$marque = !empty($marque) ? "'$marque'" : "NULL";
		$fournisseur = !empty($fournisseur) ? "'$fournisseur'" : "NULL";
		$commentaire = !empty($commentaire) ? "'$commentaire'" : "NULL";

		$query = "INSERT INTO machine_p (id_client, nom_machine, designation, type, reference, marque, fournisseur, commentaire, compteur, nb_arrets, temps_arrets, montant_pieces, tps_mo, nb_inter) VALUES ($id_client, '$nom_machine', $designation, $type, $reference, $marque, $fournisseur, $commentaire, $compteur, $nb_arrets, $temps_arrets, $montant_pieces, $tps_mo, $nb_inter)"; 
		
		header('Location: tableau.php');

		mysqli_query($enlace, $query);
		mysqli_close($enlace);
	}
	else{
	
?>

<html>
	<head>
		<title>Ajouter Machine</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/ajouter_machine_style.css">
	</head>

	<body>

		<ul>
			<li><a href="tableau.php"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="#" class="active"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="ajouter_maintenance.php"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="ajouter_panne.php"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<form id="ajouter_machine" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

				<p>- Client: 
					<select name="id_client">
						<option>Sélectionnez...</option>
						<option value="1">FEMEXFUT</option>
						<option value="2">D1-Diademas</option>
						<option value="3">LA-Diademas</option>
						<option value="4">D1-Banderines</option>
						<option value="5">LA-Banderines</option>
						<option value="6">Tableros</option>
					</select>*
				</p>

				<p>- Nom de la machine:
					<input type="text" name="nom_machine">*
				</p>

				<p>- Désignation:
					<input type="text" name="designation">
				</p>

				<p>- Type:
					<input type="text" name="type">
				</p>

				<p>- Référence:
					<input type="text" name="reference">
				</p>

				<p>- Marque:
					<input type="text" name="marque">
				</p>

				<p>- Fournisseur:
					<input type="text" name="fournisseur">
				</p>

				<p>- Commentaire:
					<br/>
					<textarea name="commentaire" form="ajouter_machine" rows="7" cols="100"></textarea>
				</p>

				<p>- Compteur:
					<input type="number" name="compteur" value="0">
				</p>

				<p>- Nombre d'arrêts:
					<input type="number" name="nb_arrets" value="0">
				</p>

				<p>- Temps d'arrêt:
					<input type="number" name="temps_arrets" value="0">
				</p>

				<p>- Montant pièces:
					<input type="number" name="montant_pieces" value="0">
				</p>

				<p>- Temps MO:
					<input type="number" name="tps_mo" value="0">
				</p>

				<p>- Nombre d'interv:
					<input type="number" name="nb_inter" value="0">
				</p>
			  	<br/>
				<p>
					<input type="reset" value="Effacer" id="boton">
			  		<input type="submit" name="agregar" value="Ajouter machine" id="boton">
			  	</p>
		</form>

	</body>
</html>

<?php } ?>