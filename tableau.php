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

	$query = "SELECT id_client, nom_client FROM clients ORDER BY id_client ASC";
	$fecha = "SELECT id_machine, prox_date FROM maintenance_prev ORDER BY id_prev ASC";

	$acum = 0;
	$resultado = mysqli_query($enlace, $query);
	$resultado2 = mysqli_query($enlace, $fecha);

	while($row_fecha = mysqli_fetch_assoc($resultado2)){
		$fechaEntero = strtotime($row_fecha["prox_date"]);
		$prox_mes[$cont] = date("n", $fechaEntero);
		$prox_dia[$cont] = date("j", $fechaEntero);

		if (date("n")==$prox_mes[$cont] && date("j")==$prox_dia[$cont]) {
			$query_m = "SELECT nom_machine FROM machine WHERE id_machine=".$row_fecha["id_machine"];
			$resultado3 = mysqli_query($enlace, $query_m);

			while ($row_m = mysqli_fetch_assoc($resultado3)) {
				$machine[$acum] = $row_m["nom_machine"];
				$acum++;
			}
		}
		$cont++; 
	}
	
	if ($acum>0) { ?>
		<script type="text/javascript">
			alert('<?php for ($x=0; $x<$acum; $x++){?>LA MACHINE <?php echo $machine[$x] ?> A BESOIN DE MAINTENANCE \n <?php }?>');
  			//location.href="index.php";
		</script>
	<?php }	

?>

<html>
	<head>
		<title>Tableau principal</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/tableau_style.css">
	</head>

	<body>

		<ul>
			<li><a href="#" class="active"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="ajouter_machine.php"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="ajouter_maintenance.php"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="ajouter_oper.php"><i class="material-icons">add</i>&nbsp;Ajouter opération de maintenance</a></li>
			<li><a href="ajouter_panne.php"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="maint_prev.php"><i class="material-icons">build</i>&nbsp;Maintenance préventive</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<table class="clients">

			<tr>
			    <th colspan="100%">LISTE DES CLIENTS</th>
			</tr>
			
			<tr>
	        	<td><a href="machines.php?id=<?php echo 0;?>" target="machines"><strong>TOUS</strong></a></td>

			<?php while ($fila = mysqli_fetch_assoc($resultado)) { ?>

	        	<td><a href="machines.php?id=<?php echo $fila["id_client"]; ?>" target="machines"><?php echo $fila["nom_client"] ?> </a></td>

			<?php } ?>	    	

			</tr>

		</table> 

		<iframe width="100%" height="80%" src="machines.php" name="machines"></iframe>
		
		<?php
		/* liberar la serie de resultados */
		mysqli_free_result($resultado);

		mysqli_close($enlace);

		?>
	</body>
</html>